package com.tamilnadu.culture.config;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tamilnadu.culture.entity.*;
import com.tamilnadu.culture.repository.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.io.InputStream;
import java.util.*;

@Component
public class SeedDataInitializer implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(SeedDataInitializer.class);

    private final CategoryRepository categoryRepository;
    private final DistrictRepository districtRepository;
    private final CulturalEntryRepository entryRepository;
    private final UserRepository userRepository;
    private final ChatbotKnowledgeRepository chatbotRepository;
    private final PasswordEncoder passwordEncoder;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public SeedDataInitializer(CategoryRepository categoryRepository,
                               DistrictRepository districtRepository,
                               CulturalEntryRepository entryRepository,
                               UserRepository userRepository,
                               ChatbotKnowledgeRepository chatbotRepository,
                               PasswordEncoder passwordEncoder) {
        this.categoryRepository = categoryRepository;
        this.districtRepository = districtRepository;
        this.entryRepository = entryRepository;
        this.userRepository = userRepository;
        this.chatbotRepository = chatbotRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        logger.info("Initializing Tamil Nadu Cultural Heritage master dataset (38 Districts, 20 Categories, 61 Cultural Items)...");

        try {
            JsonNode datasetRoot = loadOverallDataset();

            seedCategories(datasetRoot);
            seedDistricts(datasetRoot);
            seedAdminUser();
            seedCulturalEntries(datasetRoot);
            seedChatbotKnowledge(datasetRoot);
            seedDistrictDataPacks();

            logger.info("Master dataset synchronization completed successfully. Active: {} districts, {} categories, {} entries.",
                    districtRepository.count(), categoryRepository.count(), entryRepository.count());
        } catch (Exception ex) {
            logger.error("Error during master dataset seeding: {}", ex.getMessage(), ex);
        }
    }

    private JsonNode loadOverallDataset() {
        try (InputStream is = getClass().getResourceAsStream("/data/tamilnadu_culture_overall_dataset.json")) {
            if (is != null) {
                return objectMapper.readTree(is);
            }
        } catch (Exception e) {
            logger.warn("Could not load /data/tamilnadu_culture_overall_dataset.json from classpath: {}", e.getMessage());
        }
        return null;
    }

    private void seedCategories(JsonNode root) {
        if (root != null && root.has("categories")) {
            for (JsonNode catNode : root.get("categories")) {
                String code = catNode.path("code").asText();
                Category cat = categoryRepository.findByCode(code).orElse(new Category());
                cat.setCode(code);
                cat.setNameEn(catNode.path("nameEn").asText());
                cat.setNameTa(catNode.path("nameTa").asText());
                cat.setDescription(catNode.path("nameEn").asText() + " of Tamil Nadu");
                cat.setIconClass(catNode.path("icon").asText("bi-bank"));
                cat.setDisplayOrder(catNode.path("displayOrder").asInt(1));
                cat.setActive(true);
                categoryRepository.save(cat);
            }
            logger.info("Seeded/updated {} categories.", categoryRepository.count());
        }
    }

    private void seedDistricts(JsonNode root) {
        if (root != null && root.has("districts")) {
            for (JsonNode distNode : root.get("districts")) {
                String code = distNode.path("code").asText();
                String nameEn = distNode.path("name").path("en").asText();
                String nameTa = distNode.path("name").path("ta").asText();
                String region = distNode.path("region").asText();
                double lat = distNode.path("coordinates").path("lat").asDouble(13.0827);
                double lng = distNode.path("coordinates").path("lng").asDouble(80.2707);
                String desc = distNode.path("summary").path("en").asText();

                District dist = districtRepository.findByCode(code)
                        .or(() -> districtRepository.findByNameEnIgnoreCase(nameEn))
                        .orElse(new District());

                dist.setCode(code);
                dist.setNameEn(nameEn);
                dist.setNameTa(nameTa);
                dist.setRegion(region);
                dist.setLatitude(lat);
                dist.setLongitude(lng);
                dist.setDescription(desc);
                districtRepository.save(dist);
            }
            logger.info("Seeded/updated {} districts.", districtRepository.count());
        }
    }

    private void seedAdminUser() {
        if (userRepository.findByEmail("admin@tamilnaduculture.gov.in").isEmpty()) {
            User admin = new User(
                    "Tamil Nadu Culture Administrator",
                    "admin@tamilnaduculture.gov.in",
                    "+91",
                    "9876543210",
                    "India",
                    "en",
                    passwordEncoder.encode("Admin@Culture2026"),
                    Role.ROLE_ADMIN,
                    true
            );
            userRepository.save(admin);
            logger.info("Admin account seeded: admin@tamilnaduculture.gov.in");
        }
    }

    private void seedCulturalEntries(JsonNode root) {
        if (root == null || !root.has("items")) return;

        Map<String, String> distIdToCode = new HashMap<>();
        if (root.has("districts")) {
            for (JsonNode d : root.get("districts")) {
                distIdToCode.put(d.path("id").asText(), d.path("code").asText());
            }
        }

        int count = 0;
        for (JsonNode item : root.get("items")) {
            String slug = item.path("slug").asText(item.path("id").asText());
            String title = item.path("name").path("en").asText();
            String titleTa = item.path("name").path("ta").asText("");
            String shortDesc = item.path("summary").path("en").asText("");
            String fullDesc = item.path("description").path("en").asText(shortDesc);
            String catCode = item.path("seedCategoryCode").asText();

            String primaryDistId = item.path("districtIds").isArray() && item.path("districtIds").size() > 0
                    ? item.path("districtIds").get(0).asText() : "chennai";
            String distCode = distIdToCode.getOrDefault(primaryDistId, "CHN");

            Category category = categoryRepository.findByCode(catCode).orElse(null);
            District district = districtRepository.findByCode(distCode).orElse(null);

            if (category == null) {
                logger.warn("Category {} not found for item {}", catCode, slug);
                continue;
            }

            CulturalEntry entry = entryRepository.findBySlug(slug)
                    .or(() -> entryRepository.findByTitle(title))
                    .orElse(new CulturalEntry());

            entry.setSlug(slug);
            entry.setTitle(title);
            entry.setTitleTa(titleTa);
            entry.setAlternateNames(titleTa);
            entry.setShortDescription(shortDesc.length() > 990 ? shortDesc.substring(0, 990) : shortDesc);
            entry.setFullDescription(fullDesc);
            entry.setCategory(category);
            entry.setDistrict(district);

            String address = item.path("location").path("address").asText("");
            if (address.isEmpty() && item.has("origin")) {
                address = item.path("origin").path("en").asText("");
            }
            entry.setTownVillage(address.length() > 140 ? address.substring(0, 140) : address);

            entry.setLatitude(item.path("location").path("lat").asDouble(district != null ? district.getLatitude() : 13.0827));
            entry.setLongitude(item.path("location").path("lng").asDouble(district != null ? district.getLongitude() : 80.2707));

            String coverImage = item.path("images").isArray() && item.path("images").size() > 0
                    ? item.path("images").get(0).path("url").asText("/images/placeholders/place.svg")
                    : "/images/placeholders/place.svg";
            entry.setCoverImageUrl(coverImage);

            List<String> tagsList = new ArrayList<>();
            if (item.path("tags").isArray()) {
                item.path("tags").forEach(t -> tagsList.add(t.asText()));
            }
            entry.setTags(String.join(", ", tagsList));

            entry.setHistoryOrigin(item.path("era").asText("Ancient Tamil Heritage"));
            entry.setCulturalSignificance(shortDesc);

            if (item.has("rituals") && item.path("rituals").isArray()) {
                List<String> rituals = new ArrayList<>();
                item.path("rituals").forEach(r -> rituals.add(r.path("en").asText()));
                entry.setFestivalsCustoms(String.join("; ", rituals));
            }

            if (item.has("sources") && item.path("sources").isArray()) {
                List<String> src = new ArrayList<>();
                item.path("sources").forEach(s -> src.add(s.path("label").asText()));
                entry.setSourceReferences(String.join("; ", src));
            }

            entry.setAuthenticityType(AuthenticityType.HISTORICAL_FACT);
            entry.setStatus(SubmissionStatus.APPROVED);
            entry.setFeatured(count < 15);
            boolean isHidden = "HIDDEN_GEMS".equals(catCode) ||
                    slug.contains("kazhugumalai") ||
                    slug.contains("sittanavasal");
            entry.setHiddenGem(isHidden);
            entry.setAverageRating(4.8);
            entry.setTotalRatings(40 + (count * 3) % 40);
            entry.setViewCount(100 + (count * 17) % 250);

            entryRepository.save(entry);
            count++;
        }
        seedSampleHiddenGems();
        logger.info("Seeded/synchronized {} cultural entries.", count);
    }

    private void seedSampleHiddenGems() {
        Category hiddenCat = categoryRepository.findByCode("HIDDEN_GEMS").orElse(null);
        if (hiddenCat == null) return;

        createHiddenGemIfMissing(
                "thirumayam-fort-caves",
                "Thirumayam Fort & Rock-Cut Cave Temples",
                "திருமயம் கோட்டை மற்றும் குடைவரை கோயில்கள்",
                "PDK",
                hiddenCat,
                "Thirumayam, Pudukkottai District",
                10.2464, 78.7523,
                "Colossal 17th-century polygonal bastion fort harboring massive 8th-century rock-cut cave temples of Shiva and Vishnu.",
                "Constructed in 1687 by Vijaya Raghunatha Sethupathi of Ramanathapuram, Thirumayam Fort is a 40-acre semi-circular fortification. Carved into its rocky face are the 8th-century Satyamurthy Perumal (one of the largest reclining Vishnu bas-reliefs in India) and the Satyagirisvarar rock-cut cave temples with Pandya-era musical inscriptions.",
                "https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=800",
                "fort, rock-cut, vishnu, shiva, hidden-gem, pudukkottai"
        );

        createHiddenGemIfMissing(
                "gingee-fort-troy-of-east",
                "Gingee Fort - 'The Troy of the East'",
                "செஞ்சிக் கோட்டை - தென்னகத்தின் ட்ராய்",
                "VLP",
                hiddenCat,
                "Gingee, Viluppuram District",
                12.2533, 79.4187,
                "Impregnable 3-citadel hilltop fortress complex called the 'Troy of the East' by British invaders.",
                "Spread over three formidable hills—Rajagiri, Krishnagiri, and Chandrayandurg—Gingee Fort spans a 13-kilometer perimeter wall. It features the grand 8-story Kalyana Mahal, massive granaries, secret escape tunnels, and sacred temples like Venkataramana Temple.",
                "https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=800",
                "fort, rajagiri, chola, nayak, hidden-gem, villupuram"
        );

        createHiddenGemIfMissing(
                "tharangambadi-danish-fort",
                "Tharangambadi (Tranquebar) Danish Fort Dansborg",
                "தரங்கம்பாடி டேனிஷ் கோட்டை டான்ஸ்போர்க்",
                "MYD",
                hiddenCat,
                "Tharangambadi, Mayiladuthurai District",
                11.0333, 79.8500,
                "1620 CE Scandinavian seaside fortress on the Coromandel coast with golden ozone beaches.",
                "Constructed by Danish Admiral Ove Gjedde under treaty with King Raghunatha Nayak of Thanjavur, Fort Dansborg is the second largest Danish fort ever built. It preserves intact 17th-century colonial ramparts, canon bastions, and the first printing press in India.",
                "https://images.unsplash.com/photo-1548013146-72479768bada?w=800",
                "danish, coastal, fort, tranquebar, hidden-gem, mayiladuthurai"
        );

        createHiddenGemIfMissing(
                "kudumiyanmalai-musical-inscriptions",
                "Kudumiyanmalai Sikhagiriswara Ancient Musical Inscriptions",
                "குடுமியான்மலை சிகாகிரீஸ்வரர் இசை கல்வெட்டுகள்",
                "PDK",
                hiddenCat,
                "Kudumiyanmalai, Pudukkottai District",
                10.4222, 78.6588,
                "7th-century rock face inscribed with 38 lines of fundamental classical Carnatic/Tamil musical treatise.",
                "Attributed to Pallava King Mahendravarman I, the 7th-century musical inscriptions on the living granite bedrock at Kudumiyanmalai detail 7 classical ragas (Gramas) and musical notes meant for the 8-stringed Parivadini lute, making it a priceless milestone in world music history.",
                "https://images.unsplash.com/photo-1600100397608-f010f443b78c?w=800",
                "inscriptions, music, pallava, rock-cut, hidden-gem, pudukkottai"
        );

        createHiddenGemIfMissing(
                "poompuhar-submerged-port",
                "Poompuhar Submerged Ancient Chola Port",
                "பூம்புகார் காவிரிப்பூம்பட்டினம் மூழ்கிய துறைமுகம்",
                "MYD",
                hiddenCat,
                "Poompuhar, Mayiladuthurai District",
                11.1447, 79.8550,
                "Ancient submerged port city praised in Silappathikaram, showcasing ancient marine trade history.",
                "Once the flourishing maritime capital and harbor of the Early Cholas, Kaveripoompattinam traded silk, pearls, and spices with Rome and Southeast Asia. Underwater excavations have revealed ancient wharves, ring wells, and monolithic brick structures preserved along the seashore.",
                "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800",
                "chola, port, silappathikaram, submerged, hidden-gem, mayiladuthurai"
        );

        createHiddenGemIfMissing(
                "kurangani-mountain-trails",
                "Kurangani Cloud Hills & Megamalai Mountain Passes",
                "குரங்கணி மேகமலை மலைப்பாதை மற்றும் பழங்குடி மரபு",
                "THN",
                hiddenCat,
                "Kurangani, Bodinayakanur, Theni District",
                10.0805, 77.2422,
                "Hidden misty valleys, ancient tribal passes, and coffee trails in the Western Ghats.",
                "Tucked inside the Bodinayakanur hills, Kurangani is an unspoiled mountain hamlet surrounded by 8,000-foot peaks, cascading mountain brooks, and cardamom estates with deep tribal lore of the Western Ghats.",
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800",
                "western-ghats, mountain, trails, tribal, hidden-gem, theni"
        );

        createHiddenGemIfMissing(
                "samanar-malai-jain-caves",
                "Samanar Malai & Mangulam 3rd BCE Jain Rock Beds",
                "சமணர் மலை மற்றும் மாங்குளம் தமிழ் பிராமி படுக்கைகள்",
                "MDU",
                hiddenCat,
                "Keelakuyilkudi, Madurai District",
                9.9234, 78.0612,
                "Ancient 3rd-century BCE stone beds used by Tamil Jain ascetic monks with carved Bas-reliefs.",
                "Located 10 km from Madurai in Keelakuyilkudi village, Samanar Malai contains natural rock shelters where Digambara Jain monks meditated over 2,200 years ago. The hill preserves ancient Tamil-Brahmi inscriptions and rock-carved sculptures of Mahavira and Gomateshwara.",
                "https://images.unsplash.com/photo-1544735716-392fe2489ffa?w=800",
                "jain, rock-cut, ancient, brahmi, hidden-gem, madurai"
        );
    }

    private void createHiddenGemIfMissing(String slug, String title, String titleTa, String distCode,
                                          Category category, String town, double lat, double lng,
                                          String shortDesc, String fullDesc, String coverImage, String tags) {
        if (entryRepository.findBySlug(slug).isPresent()) {
            CulturalEntry existing = entryRepository.findBySlug(slug).get();
            if (!existing.isHiddenGem()) {
                existing.setHiddenGem(true);
                entryRepository.save(existing);
            }
            return;
        }

        District district = districtRepository.findByCode(distCode).orElse(null);
        CulturalEntry entry = new CulturalEntry();
        entry.setSlug(slug);
        entry.setTitle(title);
        entry.setTitleTa(titleTa);
        entry.setAlternateNames(titleTa);
        entry.setShortDescription(shortDesc);
        entry.setFullDescription(fullDesc);
        entry.setCategory(category);
        entry.setDistrict(district);
        entry.setTownVillage(town);
        entry.setLatitude(lat);
        entry.setLongitude(lng);
        entry.setCoverImageUrl(coverImage);
        entry.setTags(tags);
        entry.setAuthenticityType(AuthenticityType.HISTORICAL_FACT);
        entry.setStatus(SubmissionStatus.APPROVED);
        entry.setHiddenGem(true);
        entry.setFeatured(false);
        entry.setAverageRating(4.9);
        entry.setTotalRatings(60);
        entry.setViewCount(320);

        entryRepository.save(entry);
    }

    private void seedChatbotKnowledge(JsonNode root) {
        if (root != null && root.has("chatbotTopics")) {
            for (JsonNode t : root.get("chatbotTopics")) {
                String intentKey = t.path("topicKey").asText();
                if (chatbotRepository.findByIntentKey(intentKey).isEmpty()) {
                    List<String> kw = new ArrayList<>();
                    if (t.path("keywords").isArray()) {
                        t.path("keywords").forEach(k -> kw.add(k.asText()));
                    }
                    ChatbotKnowledge ck = new ChatbotKnowledge(
                            intentKey,
                            String.join(", ", kw),
                            t.path("categoryCode").asText(),
                            t.path("districtCode").asText(),
                            t.path("responseEn").asText(),
                            t.path("responseTa").asText(),
                            null
                    );
                    chatbotRepository.save(ck);
                }
            }
            logger.info("Seeded/verified chatbot knowledge topics.");
        }
    }

    private void seedDistrictDataPacks() {
        seedDistrictDataPack("/data/districts/ariyalur.json");
        seedDistrictDataPack("/data/districts/chengalpattu.json");
        seedDistrictDataPack("/data/districts/chennai.json");
        seedDistrictDataPack("/data/districts/coimbatore.json");
        seedDistrictDataPack("/data/districts/cuddalore.json");
        seedDistrictDataPack("/data/districts/dharmapuri.json");
        seedDistrictDataPack("/data/districts/dindigul.json");
        seedDistrictDataPack("/data/districts/erode.json");
        seedDistrictDataPack("/data/districts/kallakurichi.json");
        seedDistrictDataPack("/data/districts/kanchipuram.json");
        seedDistrictDataPack("/data/districts/kanniyakumari.json");
        seedDistrictDataPack("/data/districts/karur.json");
        seedDistrictDataPack("/data/districts/krishnagiri.json");
        seedDistrictDataPack("/data/districts/madurai.json");
        seedDistrictDataPack("/data/districts/mayiladuthurai.json");
        seedDistrictDataPack("/data/districts/nagapattinam.json");
        seedDistrictDataPack("/data/districts/namakkal.json");
        seedDistrictDataPack("/data/districts/the-nilgiris.json");
        seedDistrictDataPack("/data/districts/perambalur.json");
        seedDistrictDataPack("/data/districts/pudukkottai.json");
        seedDistrictDataPack("/data/districts/ramanathapuram.json");
        seedDistrictDataPack("/data/districts/ranipet.json");
        seedDistrictDataPack("/data/districts/sivaganga.json");
        seedDistrictDataPack("/data/districts/tenkasi.json");
        seedDistrictDataPack("/data/districts/thanjavur.json");
        seedDistrictDataPack("/data/districts/theni.json");
        seedDistrictDataPack("/data/districts/thoothukudi.json");
        seedDistrictDataPack("/data/districts/tiruchirappalli.json");
        seedDistrictDataPack("/data/districts/tirupathur.json");
        seedDistrictDataPack("/data/districts/tirupur.json");
        seedDistrictDataPack("/data/districts/tiruvallur.json");
        seedDistrictDataPack("/data/districts/tiruvannamalai.json");
        seedDistrictDataPack("/data/districts/tiruvarur.json");
        seedDistrictDataPack("/data/districts/vellore.json");
        seedDistrictDataPack("/data/districts/viluppuram.json");
        seedDistrictDataPack("/data/districts/virudhunagar.json");
    }

    private void seedDistrictDataPack(String resourcePath) {
        try (InputStream is = getClass().getResourceAsStream(resourcePath)) {
            if (is == null) {
                logger.warn("District data pack not found at {}", resourcePath);
                return;
            }
            JsonNode pack = objectMapper.readTree(is);
            if (pack == null) return;

            // 1. Update / seed District
            District district = null;
            if (pack.has("district")) {
                JsonNode dNode = pack.get("district");
                String code = dNode.path("code").asText();
                String nameEn = dNode.path("nameEn").asText();
                String nameTa = dNode.path("nameTa").asText();
                String region = dNode.path("region").asText("Central");
                double lat = dNode.path("latitude").asDouble(11.14);
                double lng = dNode.path("longitude").asDouble(79.08);
                String desc = dNode.path("description").asText();

                district = districtRepository.findByCode(code)
                        .or(() -> districtRepository.findByNameEnIgnoreCase(nameEn))
                        .orElse(new District());

                district.setCode(code);
                district.setNameEn(nameEn);
                district.setNameTa(nameTa);
                district.setRegion(region);
                district.setLatitude(lat);
                district.setLongitude(lng);
                district.setDescription(desc);
                district = districtRepository.save(district);
                logger.info("Updated/seeded district: {} ({})", nameEn, code);
            }

            // 2. Seed Cultural Entries
            if (pack.has("culturalEntries") && pack.get("culturalEntries").isArray()) {
                int count = 0;
                for (JsonNode item : pack.get("culturalEntries")) {
                    String title = item.path("title").asText();
                    String slug = item.path("slug").asText(
                            title.toLowerCase().replaceAll("[^a-z0-9]+", "-").replaceAll("^-|-$", "")
                    );
                    String titleTa = item.path("titleTa").asText("");
                    String altNames = item.path("alternateNames").asText(titleTa);
                    String shortDesc = item.path("shortDescription").asText("");
                    String fullDesc = item.path("fullDescription").asText(shortDesc);
                    String catCode = item.path("categoryCode").asText();
                    String distCode = item.path("districtCode").asText("ARI");

                    Category category = categoryRepository.findByCode(catCode).orElse(null);
                    if (category == null) {
                        logger.warn("Category {} not found for item {}", catCode, title);
                        continue;
                    }

                    District targetDistrict = district != null && district.getCode().equalsIgnoreCase(distCode)
                            ? district : districtRepository.findByCode(distCode).orElse(district);

                    CulturalEntry entry = entryRepository.findBySlug(slug)
                            .or(() -> entryRepository.findByTitle(title))
                            .orElse(new CulturalEntry());

                    entry.setSlug(slug);
                    entry.setTitle(title);
                    entry.setTitleTa(titleTa);
                    entry.setAlternateNames(altNames);
                    entry.setShortDescription(shortDesc.length() > 990 ? shortDesc.substring(0, 990) : shortDesc);
                    entry.setFullDescription(fullDesc);
                    entry.setCategory(category);
                    entry.setDistrict(targetDistrict);
                    entry.setTownVillage(item.path("townVillage").asText(targetDistrict != null ? targetDistrict.getNameEn() : ""));
                    entry.setLatitude(item.path("latitude").asDouble(targetDistrict != null ? targetDistrict.getLatitude() : 11.14));
                    entry.setLongitude(item.path("longitude").asDouble(targetDistrict != null ? targetDistrict.getLongitude() : 79.08));

                    String authStr = item.path("authenticityType").asText("HISTORICAL_FACT");
                    try {
                        entry.setAuthenticityType(AuthenticityType.valueOf(authStr));
                    } catch (Exception e) {
                        entry.setAuthenticityType(AuthenticityType.HISTORICAL_FACT);
                    }

                    entry.setReligionCommunity(item.path("religionCommunity").asText(null));
                    entry.setHistoryOrigin(item.path("historyOrigin").asText(null));
                    entry.setCulturalSignificance(item.path("culturalSignificance").asText(null));
                    entry.setFestivalsCustoms(item.path("festivalsCustoms").asText(null));
                    entry.setRelatedArts(item.path("relatedArts").asText(null));
                    entry.setTraditionalClothing(item.path("traditionalClothing").asText(null));
                    entry.setTraditionalCuisine(item.path("traditionalCuisine").asText(null));

                    String coverImage = item.path("coverImageUrl").asText("");
                    if (coverImage.isBlank() || "null".equals(coverImage)) {
                        coverImage = "/images/placeholders/place.svg";
                    }
                    entry.setCoverImageUrl(coverImage);

                    if (item.has("sourceReferences")) {
                        if (item.get("sourceReferences").isArray()) {
                            List<String> src = new ArrayList<>();
                            item.get("sourceReferences").forEach(s -> src.add(s.asText()));
                            entry.setSourceReferences(String.join("; ", src));
                        } else {
                            entry.setSourceReferences(item.path("sourceReferences").asText(null));
                        }
                    }

                    entry.setStatus(SubmissionStatus.APPROVED);
                    entry.setFeatured(item.path("featured").asBoolean(false));
                    entry.setHiddenGem(item.path("hiddenGem").asBoolean(false));
                    entry.setAverageRating(item.path("averageRating").asDouble(4.8));
                    entry.setTotalRatings(item.path("totalRatings").asInt(40));
                    entry.setViewCount(item.path("viewCount").asInt(150));

                    if (item.has("tags")) {
                        if (item.get("tags").isArray()) {
                            List<String> tagsList = new ArrayList<>();
                            item.get("tags").forEach(t -> tagsList.add(t.asText()));
                            entry.setTags(String.join(", ", tagsList));
                        } else {
                            entry.setTags(item.path("tags").asText());
                        }
                    }

                    entryRepository.save(entry);
                    count++;
                }
                logger.info("Seeded {} cultural entries from data pack: {}", count, resourcePath);
            }

            // 3. Seed Chatbot Knowledge
            if (pack.has("chatbotKnowledge") && pack.get("chatbotKnowledge").isArray()) {
                int kbCount = 0;
                for (JsonNode t : pack.get("chatbotKnowledge")) {
                    String topicKey = t.path("topicKey").asText();
                    if (topicKey.isBlank()) continue;

                    ChatbotKnowledge ck = chatbotRepository.findByIntentKey(topicKey).orElse(new ChatbotKnowledge());
                    ck.setIntentKey(topicKey);

                    if (t.has("keywords")) {
                        if (t.get("keywords").isArray()) {
                            List<String> kw = new ArrayList<>();
                            t.get("keywords").forEach(k -> kw.add(k.asText()));
                            ck.setKeywords(String.join(", ", kw));
                        } else {
                            ck.setKeywords(t.path("keywords").asText());
                        }
                    }

                    ck.setCategoryCode(t.path("categoryCode").asText(null));
                    ck.setDistrictCode(t.path("districtCode").asText(null));
                    ck.setResponseEn(t.path("answerEn").asText(""));
                    ck.setResponseTa(t.path("answerTa").asText(null));
                    ck.setVerified(true);

                    String linkedTitle = t.path("linkedEntryTitle").asText("");
                    if (!linkedTitle.isBlank()) {
                        entryRepository.findByTitle(linkedTitle).ifPresent(ck::setRelatedEntry);
                    }

                    chatbotRepository.save(ck);
                    kbCount++;
                }
                logger.info("Seeded {} chatbot knowledge items from data pack: {}", kbCount, resourcePath);
            }
        } catch (Exception e) {
            logger.error("Error loading district data pack {}: {}", resourcePath, e.getMessage(), e);
        }
    }
}
