package com.tamilnadu.culture.service;

import com.tamilnadu.culture.dto.ChatRequest;
import com.tamilnadu.culture.dto.ChatResponse;
import com.tamilnadu.culture.entity.Category;
import com.tamilnadu.culture.entity.ChatbotKnowledge;
import com.tamilnadu.culture.entity.CulturalEntry;
import com.tamilnadu.culture.entity.District;
import com.tamilnadu.culture.entity.SubmissionStatus;
import com.tamilnadu.culture.repository.CategoryRepository;
import com.tamilnadu.culture.repository.ChatbotKnowledgeRepository;
import com.tamilnadu.culture.repository.CulturalEntryRepository;
import com.tamilnadu.culture.repository.DistrictRepository;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
public class ChatbotService {

    private final ChatbotKnowledgeRepository knowledgeRepository;
    private final CulturalEntryRepository entryRepository;
    private final DistrictRepository districtRepository;
    private final CategoryRepository categoryRepository;

    private static final Set<String> STOP_WORDS = Set.of(
            "tell", "me", "about", "what", "is", "are", "where", "which", "who", "whom", "whose", "why",
            "how", "can", "you", "show", "give", "please", "the", "a", "an", "of", "in", "for", "details",
            "info", "information", "does", "do", "did", "have", "has", "had", "with", "from", "that", "this",
            "there", "their", "they", "know", "more", "like", "want", "help", "good", "best", "many", "much",
            "some", "any", "find", "explore", "search", "looking", "guide", "brief", "explain", "describe",
            "history", "culture", "heritage", "place", "places", "thing", "things"
    );

    public ChatbotService(ChatbotKnowledgeRepository knowledgeRepository,
                          CulturalEntryRepository entryRepository,
                          DistrictRepository districtRepository,
                          CategoryRepository categoryRepository) {
        this.knowledgeRepository = knowledgeRepository;
        this.entryRepository = entryRepository;
        this.districtRepository = districtRepository;
        this.categoryRepository = categoryRepository;
    }

    public ChatResponse processChat(ChatRequest request) {
        String originalMessage = request.getMessage() != null ? request.getMessage().trim() : "";
        if (originalMessage.isBlank()) {
            return new ChatResponse("Please ask a question about Tamil Nadu culture, districts, or heritage monuments.", "EMPTY", "en", Collections.emptyList());
        }

        String query = originalMessage.toLowerCase();
        String lang = request.getLanguageCode() != null ? request.getLanguageCode().toLowerCase() : "en";
        boolean isTamil = "ta".equalsIgnoreCase(lang) || containsTamilScript(originalMessage);

        // 1. Greetings
        if (query.matches(".*\\b(hi|hello|hey|vanakkam|namaste|bonjour|greetings|hola|good morning|good evening)\\b.*")) {
            String greetingReply = isTamil ?
                    "வணக்கம்! நான் தமிழ்நாடு பண்பாட்டு வழிகாட்டி AI உதவியாளர். 38 மாவட்டங்கள், 20 பண்பாட்டுப் பிரிவுகள் மற்றும் 61 தொன்மையான மரபுச் சின்னங்கள், நடனங்கள், இசை, திருவிழாக்கள், உணவு முறைகள் குறித்து நீங்கள் என்னிடம் கேட்கலாம்!" :
                    "Vanakkam! I am your Tamil Nadu Cultural Heritage AI Assistant. Fed with our comprehensive dataset across all 38 districts, 20 categories, and 61 verified cultural items—including ancient monuments, classical & folk dances, music, cuisine, and festivals. What would you like to explore today?";
            return new ChatResponse(greetingReply, "GREETING", isTamil ? "ta" : "en", getPopularSuggestions(isTamil));
        }

        // 2. Platform navigation & feature inquiries (Map, current location, 38 districts, profile)
        if (query.contains("map") || query.contains("location") || query.contains("nearby") || query.contains("gps") || query.contains("distance")) {
            String mapReply = isTamil ?
                    "எங்கள் ஊடாடும் வரைபடத்தில் (Interactive Heritage Map) உங்கள் இருப்பிடத்தைக் கண்டறிய 'Use My Current Location' பொத்தானை அழுத்தலாம். உங்கள் பகுதியிலிருந்து 25 கி.மீ, 50 கி.மீ, 100 கி.மீ தொலைவில் உள்ள வரலாற்றுத் தலங்கள் மற்றும் வழிகாட்டிகளை இது துல்லியமாகக் காட்டும்." :
                    "Our Interactive Heritage Map features real-time GPS proximity discovery. By clicking 'Use My Current Location', you can discover all verified cultural heritage landmarks within 25 km, 50 km, 100 km, or 200 km of your position, with direct driving directions and distance calculations across Tamil Nadu.";
            return new ChatResponse(mapReply, "MAP_GUIDE", isTamil ? "ta" : "en", null);
        }

        // 3. Collect District Names & Cultural Entries
        List<District> allDistricts = districtRepository.findAll();
        Set<String> districtNames = allDistricts.stream()
                .map(d -> d.getNameEn().toLowerCase())
                .collect(Collectors.toSet());

        List<CulturalEntry> allEntries = entryRepository.findByStatus(SubmissionStatus.APPROVED);
        CulturalEntry bestEntry = findBestEntryMatch(query, allEntries, districtNames);
        if (bestEntry != null) {
            return buildEntryResponse(bestEntry, isTamil);
        }

        // 4. District Match (Check all 38 districts for regional guides & lists of places)
        for (District dist : allDistricts) {
            String enName = dist.getNameEn().toLowerCase();
            String taName = dist.getNameTa() != null ? dist.getNameTa() : "";
            String code = dist.getCode().toLowerCase();

            boolean districtMatched = query.contains(enName) ||
                    (!taName.isBlank() && query.contains(taName)) ||
                    (request.getDistrictCode() != null && request.getDistrictCode().equalsIgnoreCase(dist.getCode())) ||
                    (code.length() >= 3 && Pattern.compile("\\b" + code + "\\b").matcher(query).find());

            if (districtMatched) {
                return buildDistrictResponse(dist, isTamil);
            }
        }

        // 5. Category Overview Match (Check all 20 categories)
        List<Category> allCategories = categoryRepository.findAll();
        for (Category cat : allCategories) {
            String catCode = cat.getCode().toLowerCase();
            String catNameEn = cat.getNameEn().toLowerCase();
            String catNameTa = cat.getNameTa() != null ? cat.getNameTa() : "";

            boolean catMatched = query.contains(catNameEn) || (!catNameTa.isBlank() && query.contains(catNameTa)) ||
                    (catCode.contains("dance") && (query.contains("dance") || query.contains("நடன"))) ||
                    (catCode.contains("music") && (query.contains("music") || query.contains("இசை") || query.contains("song"))) ||
                    (catCode.contains("cuisine") && (query.contains("food") || query.contains("cuisine") || query.contains("recipe") || query.contains("உணவு") || query.contains("samayal"))) ||
                    (catCode.contains("festivals") && (query.contains("festival") || query.contains("celebration") || query.contains("திருவிழா"))) ||
                    (catCode.contains("crafts") && (query.contains("craft") || query.contains("handloom") || query.contains("கைவினை"))) ||
                    (catCode.contains("dress") && (query.contains("dress") || query.contains("textile") || query.contains("saree") || query.contains("உடை"))) ||
                    (catCode.contains("literature") && (query.contains("literature") || query.contains("poem") || query.contains("poet") || query.contains("இலக்கியம்"))) ||
                    (catCode.contains("architecture") && (query.contains("architecture") || query.contains("sculpture") || query.contains("கோபுரம்") || query.contains("சிற்ப"))) ||
                    (catCode.contains("archaeological") && (query.contains("excavation") || query.contains("archaeology") || query.contains("தொல்லியல்")));

            if (catMatched) {
                return buildCategoryResponse(cat, allEntries, isTamil);
            }
        }

        // 6. Check Curated Chatbot Knowledge Base
        List<ChatbotKnowledge> knowledgeMatches = knowledgeRepository.searchKnowledge(query);
        if (!knowledgeMatches.isEmpty()) {
            ChatbotKnowledge match = knowledgeMatches.get(0);
            String replyText = isTamil && match.getResponseTa() != null ? match.getResponseTa() : match.getResponseEn();
            return new ChatResponse(replyText, match.getIntentKey(), isTamil ? "ta" : "en", getPopularSuggestions(isTamil));
        }

        // 7. General Keyword Search Fallback
        List<CulturalEntry> searchMatches = searchEntriesByTokens(query, allEntries);
        if (!searchMatches.isEmpty()) {
            CulturalEntry top = searchMatches.get(0);
            return buildEntryResponse(top, isTamil);
        }

        // 8. Polite cultural fallback with prompt suggestions
        String fallback = isTamil ?
                "மன்னிக்கவும், உங்கள் கேள்விக்குரிய துல்லியமான தகவல் எங்கள் ஆவணங்களில் கிடைக்கவில்லை. நீங்கள் தஞ்சாவூர் பெரிய கோயில், மதுரை மீனாட்சி அம்மன், பரதநாட்டியம், சிலம்பம், திருநெல்வேலி அல்வா, அல்லது தமிழ்நாட்டின் 38 மாவட்டங்கள் குறித்து கேட்கலாம்!" :
                "I couldn't find a direct match for your specific query. However, our knowledge base includes detailed records on all 38 districts of Tamil Nadu, Brihadisvara Temple, Meenakshi Amman Temple, Bharatanatyam, Chettinad Cuisine, Thirukkural, Silambam, and 61 cultural landmarks! Try asking about any district or cultural tradition.";

        return new ChatResponse(fallback, "SUGGESTIONS", isTamil ? "ta" : "en", getPopularSuggestions(isTamil));
    }

    private boolean containsTamilScript(String text) {
        for (char c : text.toCharArray()) {
            if (Character.UnicodeBlock.of(c) == Character.UnicodeBlock.TAMIL) {
                return true;
            }
        }
        return false;
    }

    private CulturalEntry findBestEntryMatch(String query, List<CulturalEntry> entries, Set<String> districtNames) {
        String cleanQuery = cleanTokens(query);
        String[] queryWords = cleanQuery.split("\\s+");

        CulturalEntry bestEntry = null;
        int highestScore = 0;

        for (CulturalEntry entry : entries) {
            int score = 0;
            String slug = entry.getSlug() != null ? entry.getSlug().toLowerCase() : "";
            String titleEn = entry.getTitle().toLowerCase();
            String titleTa = entry.getTitleTa() != null ? entry.getTitleTa().toLowerCase() : "";
            String tags = entry.getTags() != null ? entry.getTags().toLowerCase() : "";
            String shortDesc = entry.getShortDescription() != null ? entry.getShortDescription().toLowerCase() : "";

            // Title without parentheses (e.g. "Brihadisvara Temple" from "Brihadisvara Temple (Thanjavur Periya Koil)")
            String cleanTitleEn = titleEn.replaceAll("\\(.*?\\)", "").trim();

            // Direct slug match (only if slug is not solely a district name)
            if (!slug.isBlank() && (cleanQuery.contains(slug) || slug.replace("-", " ").contains(cleanQuery))) {
                score += 50;
            }

            // Direct title substring match (full title match)
            if (!cleanTitleEn.isBlank() && !districtNames.contains(cleanTitleEn) &&
                (cleanQuery.contains(cleanTitleEn) || (cleanTitleEn.length() > 6 && cleanTitleEn.contains(cleanQuery)))) {
                score += 45;
            }
            if (!titleTa.isBlank() && (cleanQuery.contains(titleTa) || (titleTa.length() > 6 && titleTa.contains(cleanQuery)))) {
                score += 45;
            }

            // Substring inside parentheses (e.g. "thanjavur periya koil")
            if (titleEn.contains("(") && titleEn.contains(")")) {
                String inParens = titleEn.substring(titleEn.indexOf("(") + 1, titleEn.indexOf(")")).trim();
                if (!inParens.isBlank() && !districtNames.contains(inParens) &&
                    (cleanQuery.contains(inParens) || (inParens.length() > 6 && inParens.contains(cleanQuery)))) {
                    score += 40;
                }
            }

            // Word-level scoring
            int nonDistrictMatches = 0;
            for (String word : queryWords) {
                if (word.length() <= 2 || STOP_WORDS.contains(word)) continue;

                boolean isDist = districtNames.contains(word);
                if (isDist) {
                    continue;
                }

                boolean matched = false;
                if (slug.contains(word)) { score += 15; matched = true; }
                if (cleanTitleEn.contains(word)) { score += 15; matched = true; }
                if (tags.contains(word)) { score += 10; matched = true; }
                if (shortDesc.contains(word)) { score += 5; matched = true; }

                if (matched) {
                    nonDistrictMatches++;
                }
            }

            // If query also mentions the district of this item, give a bonus ONLY if distinctive non-district word matched
            if (nonDistrictMatches > 0 && entry.getDistrict() != null && cleanQuery.contains(entry.getDistrict().getNameEn().toLowerCase())) {
                score += 15;
            }

            // Special cultural aliases and colloquial keywords
            if (cleanQuery.contains("brihadisvara") || cleanQuery.contains("brihadeeswara") || cleanQuery.contains("periya koil") || cleanQuery.contains("big temple")) {
                if (slug.contains("brihadisvara") || titleEn.contains("brihadisvara")) score += 60;
            }
            if (cleanQuery.contains("meenakshi") && (slug.contains("meenakshi") || titleEn.contains("meenakshi"))) {
                score += 60;
            }
            if (cleanQuery.contains("shore temple") && (slug.contains("shore") || titleEn.contains("shore"))) {
                score += 60;
            }
            if ((cleanQuery.contains("halwa") || cleanQuery.contains("alva")) && (slug.contains("halwa") || titleEn.contains("halwa"))) {
                score += 60;
            }
            if (cleanQuery.contains("jigarthanda") && (slug.contains("jigarthanda") || titleEn.contains("jigarthanda"))) {
                score += 60;
            }
            if (cleanQuery.contains("biryani") && (slug.contains("biryani") || titleEn.contains("biryani"))) {
                score += 60;
            }
            if ((cleanQuery.contains("silk") || cleanQuery.contains("saree") || cleanQuery.contains("pattu")) && (slug.contains("silk") || titleEn.contains("silk"))) {
                score += 60;
            }
            if (cleanQuery.contains("kallanai") && (slug.contains("kallanai") || titleEn.contains("kallanai"))) {
                score += 60;
            }
            if (cleanQuery.contains("bharatanatyam") && (slug.contains("bharatanatyam") || titleEn.contains("bharatanatyam"))) {
                score += 60;
            }
            if (cleanQuery.contains("silambam") && (slug.contains("silambam") || titleEn.contains("silambam"))) {
                score += 60;
            }
            if (cleanQuery.contains("jallikattu") && (slug.contains("jallikattu") || titleEn.contains("jallikattu"))) {
                score += 60;
            }

            if (score > highestScore && score >= 15) {
                highestScore = score;
                bestEntry = entry;
            }
        }

        return bestEntry;
    }

    private List<CulturalEntry> searchEntriesByTokens(String query, List<CulturalEntry> entries) {
        String cleanQuery = cleanTokens(query);
        String[] words = cleanQuery.split("\\s+");

        Map<CulturalEntry, Integer> scoreMap = new HashMap<>();
        for (CulturalEntry entry : entries) {
            int score = 0;
            String fullText = (entry.getTitle() + " " + entry.getShortDescription() + " " +
                    (entry.getTags() != null ? entry.getTags() : "") + " " +
                    (entry.getFullDescription() != null ? entry.getFullDescription() : "")).toLowerCase();

            for (String word : words) {
                if (word.length() > 3 && !STOP_WORDS.contains(word) && fullText.contains(word)) {
                    score += 5;
                }
            }
            if (score > 0) {
                scoreMap.put(entry, score);
            }
        }

        return scoreMap.entrySet().stream()
                .sorted(Map.Entry.<CulturalEntry, Integer>comparingByValue().reversed())
                .map(e -> e.getKey())
                .limit(4)
                .collect(Collectors.toList());
    }

    private String cleanTokens(String text) {
        return text.replaceAll("[^a-zA-Z0-9\\u0B80-\\u0BFF\\s]", " ").trim().replaceAll("\\s+", " ");
    }

    private ChatResponse buildEntryResponse(CulturalEntry entry, boolean isTamil) {
        StringBuilder sb = new StringBuilder();

        if (isTamil && entry.getTitleTa() != null && !entry.getTitleTa().isBlank()) {
            sb.append("✨ ").append(entry.getTitleTa()).append(" (").append(entry.getTitle()).append(")\n\n");
            sb.append(entry.getShortDescription()).append("\n\n");
            if (entry.getFullDescription() != null && !entry.getFullDescription().isBlank()) {
                sb.append(entry.getFullDescription()).append("\n\n");
            }
            if (entry.getDistrict() != null) {
                sb.append("📍 மாவட்டம்: ").append(entry.getDistrict().getNameTa()).append("\n");
            }
            if (entry.getTownVillage() != null && !entry.getTownVillage().isBlank()) {
                sb.append("🏛️ அமைவிடம்: ").append(entry.getTownVillage()).append("\n");
            }
            if (entry.getCategory() != null) {
                sb.append("📂 மரபுப் பிரிவு: ").append(entry.getCategory().getNameTa()).append("\n");
            }
            if (entry.getHistoryOrigin() != null && !entry.getHistoryOrigin().isBlank()) {
                sb.append("⏳ காலம்: ").append(entry.getHistoryOrigin()).append("\n");
            }
            if (entry.getFestivalsCustoms() != null && !entry.getFestivalsCustoms().isBlank()) {
                sb.append("🎉 திருவிழாக்கள்/சடங்குகள்: ").append(entry.getFestivalsCustoms()).append("\n");
            }
        } else {
            sb.append("✨ ").append(entry.getTitle()).append("\n\n");
            sb.append(entry.getShortDescription()).append("\n\n");
            if (entry.getFullDescription() != null && !entry.getFullDescription().isBlank()) {
                sb.append(entry.getFullDescription()).append("\n\n");
            }
            if (entry.getDistrict() != null) {
                sb.append("📍 District: ").append(entry.getDistrict().getNameEn()).append(" (").append(entry.getDistrict().getRegion()).append(" Region)\n");
            }
            if (entry.getTownVillage() != null && !entry.getTownVillage().isBlank()) {
                sb.append("🏛️ Location: ").append(entry.getTownVillage()).append("\n");
            }
            if (entry.getCategory() != null) {
                sb.append("📂 Category: ").append(entry.getCategory().getNameEn()).append("\n");
            }
            if (entry.getHistoryOrigin() != null && !entry.getHistoryOrigin().isBlank()) {
                sb.append("⏳ Historical Era: ").append(entry.getHistoryOrigin()).append("\n");
            }
            if (entry.getFestivalsCustoms() != null && !entry.getFestivalsCustoms().isBlank()) {
                sb.append("🎉 Associated Rituals & Celebrations: ").append(entry.getFestivalsCustoms()).append("\n");
            }
        }

        ChatResponse.EntryCardSummary card = new ChatResponse.EntryCardSummary(
                entry.getId(),
                isTamil && entry.getTitleTa() != null ? entry.getTitleTa() : entry.getTitle(),
                entry.getShortDescription(),
                entry.getCategory() != null ? entry.getCategory().getNameEn() : "Cultural Heritage",
                entry.getDistrict() != null ? entry.getDistrict().getNameEn() : "Tamil Nadu",
                entry.getCoverImageUrl()
        );

        return new ChatResponse(sb.toString(), "ENTRY_DETAIL", isTamil ? "ta" : "en", List.of(card));
    }

    private ChatResponse buildDistrictResponse(District dist, boolean isTamil) {
        List<CulturalEntry> districtEntries = entryRepository.findByStatusAndDistrictId(SubmissionStatus.APPROVED, dist.getId());
        StringBuilder sb = new StringBuilder();

        if (isTamil) {
            sb.append("🏛️ ").append(dist.getNameTa()).append(" மாவட்டம் (").append(dist.getNameEn()).append(")\n");
            sb.append("📍 மண்டலம்: ").append(dist.getRegion()).append(" தமிழ்நாடு | தலைநகரம்: ").append(dist.getNameTa()).append("\n\n");
            sb.append(dist.getDescription() != null ? dist.getDescription() : "தமிழ்நாட்டின் தொன்மைமிக்க வரலாற்று மாவட்டம்.").append("\n\n");
            if (!districtEntries.isEmpty()) {
                sb.append("இம்மாவட்டத்தில் ஆவணப்படுத்தப்பட்டுள்ள முக்கிய இடங்கள் மற்றும் கலைகள் (").append(districtEntries.size()).append("):\n");
                for (int i = 0; i < Math.min(5, districtEntries.size()); i++) {
                    CulturalEntry e = districtEntries.get(i);
                    sb.append("• ").append(e.getTitleTa() != null ? e.getTitleTa() : e.getTitle()).append(" (").append(e.getCategory().getNameTa()).append(")\n");
                }
            }
        } else {
            sb.append("🏛️ ").append(dist.getNameEn()).append(" District (").append(dist.getRegion()).append(" Tamil Nadu)\n");
            sb.append("📍 Headquarters: ").append(dist.getNameEn()).append(" | Coordinates: ").append(dist.getLatitude()).append("° N, ").append(dist.getLongitude()).append("° E\n\n");
            sb.append(dist.getDescription() != null ? dist.getDescription() : "A prominent heritage and cultural district of Tamil Nadu.").append("\n\n");
            if (!districtEntries.isEmpty()) {
                sb.append("Documented Cultural Treasures & Highlights (").append(districtEntries.size()).append("):\n");
                for (int i = 0; i < Math.min(5, districtEntries.size()); i++) {
                    CulturalEntry e = districtEntries.get(i);
                    sb.append("• ").append(e.getTitle()).append(" — ").append(e.getCategory().getNameEn()).append("\n");
                }
            }
        }

        List<ChatResponse.EntryCardSummary> summaries = districtEntries.stream()
                .map(e -> new ChatResponse.EntryCardSummary(
                        e.getId(),
                        isTamil && e.getTitleTa() != null ? e.getTitleTa() : e.getTitle(),
                        e.getShortDescription(),
                        e.getCategory().getNameEn(),
                        dist.getNameEn(),
                        e.getCoverImageUrl()
                ))
                .limit(4)
                .collect(Collectors.toList());

        return new ChatResponse(sb.toString(), "DISTRICT_GUIDE", isTamil ? "ta" : "en", summaries);
    }

    private ChatResponse buildCategoryResponse(Category cat, List<CulturalEntry> allEntries, boolean isTamil) {
        List<CulturalEntry> catEntries = allEntries.stream()
                .filter(e -> e.getCategory() != null && e.getCategory().getId().equals(cat.getId()))
                .collect(Collectors.toList());

        StringBuilder sb = new StringBuilder();
        if (isTamil) {
            sb.append("🎭 ").append(cat.getNameTa()).append(" (").append(cat.getNameEn()).append(")\n\n");
            sb.append(cat.getDescription() != null ? cat.getDescription() : "தமிழ்நாட்டின் தனித்துவமான பண்பாட்டுப் பிரிவு.").append("\n\n");
            sb.append("இப்பிரிவில் ஆவணப்படுத்தப்பட்டுள்ள சிறப்பம்சங்கள் (").append(catEntries.size()).append("):\n");
            for (int i = 0; i < Math.min(6, catEntries.size()); i++) {
                CulturalEntry e = catEntries.get(i);
                sb.append("• ").append(e.getTitleTa() != null ? e.getTitleTa() : e.getTitle()).append("\n");
            }
        } else {
            sb.append("🎭 ").append(cat.getNameEn()).append(" Heritage\n\n");
            sb.append(cat.getDescription() != null ? cat.getDescription() : "An essential domain of Tamil Nadu's vibrant civilization.").append("\n\n");
            sb.append("Documented Items in this Category (").append(catEntries.size()).append("):\n");
            for (int i = 0; i < Math.min(6, catEntries.size()); i++) {
                CulturalEntry e = catEntries.get(i);
                sb.append("• ").append(e.getTitle()).append("\n");
            }
        }

        List<ChatResponse.EntryCardSummary> summaries = catEntries.stream()
                .map(e -> new ChatResponse.EntryCardSummary(
                        e.getId(),
                        isTamil && e.getTitleTa() != null ? e.getTitleTa() : e.getTitle(),
                        e.getShortDescription(),
                        cat.getNameEn(),
                        e.getDistrict() != null ? e.getDistrict().getNameEn() : "Tamil Nadu",
                        e.getCoverImageUrl()
                ))
                .limit(4)
                .collect(Collectors.toList());

        return new ChatResponse(sb.toString(), "CATEGORY_GUIDE", isTamil ? "ta" : "en", summaries);
    }

    private List<ChatResponse.EntryCardSummary> getPopularSuggestions(boolean isTamil) {
        List<CulturalEntry> featured = entryRepository.findByStatusAndFeaturedTrue(SubmissionStatus.APPROVED);
        if (featured.isEmpty()) {
            featured = entryRepository.findByStatus(SubmissionStatus.APPROVED);
        }
        return featured.stream()
                .limit(3)
                .map(e -> new ChatResponse.EntryCardSummary(
                        e.getId(),
                        isTamil && e.getTitleTa() != null ? e.getTitleTa() : e.getTitle(),
                        e.getShortDescription(),
                        e.getCategory() != null ? e.getCategory().getNameEn() : "Heritage",
                        e.getDistrict() != null ? e.getDistrict().getNameEn() : "Tamil Nadu",
                        e.getCoverImageUrl()
                ))
                .collect(Collectors.toList());
    }
}
