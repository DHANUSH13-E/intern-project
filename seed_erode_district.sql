-- ===================================================================
-- SEED SCRIPT: ERODE DISTRICT (ERD)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Erode District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'ERD', 'Erode', 'ஈரோடு', 'Western', 11.3410, 77.7172,
  'A prominent center for the textile and turmeric industries, Erode lies on the banks of the Kaveri and Bhavani rivers, noted for its rich agricultural heritage and handloom traditions.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Erode
-- Entry 1: Bhavani Sangameshwarar Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'bhavani-sangameshwarar-temple',
  'Bhavani Sangameshwarar Temple',
  'பவானி சங்கமேஸ்வரர் கோயில்',
  'Kooduthurai, Triveni Sangamam of South',
  'A sacred Shiva temple situated at the confluence of the Kaveri, Bhavani, and the mystic Amudha rivers, highly revered for ancestral rituals.',
  'Located at ''Kooduthurai'', where the Kaveri and Bhavani rivers meet (along with the mythical underground Amudha river), this temple is known as the Triveni Sangamam of South India. The presiding deity is Lord Sangameshwarar with Goddess Vedanayaki. The location is considered highly auspicious for performing Tarpanam (ancestral rites). A unique feature is the ivory cradle donated by William Garrow, a British Collector in 1804, who claimed the Goddess saved his life from a collapsing building.',
  c.id, d.id, 'Bhavani', 11.4468, 77.6830,
  'HISTORICAL_FACT', 'Hindu',
  'Praising hymns by Thirugnanasambandar in the 7th century; British era additions like the ivory cradle.',
  'A major pilgrimage site for river-based rituals in Kongu Nadu, demonstrating continuous religious significance and unique colonial-era syncretic history.',
  'Aadi Perukku, Maha Shivaratri, Amavasya tarpanam bathing rituals',
  'Tevaram recitation, traditional river ghat rituals',
  'Dhotis and sarees for sacred bath rituals',
  'Temple panchamirtham, Kongu puliyodharai',
  '/images/placeholders/place.svg',
  'Tevaram hymns (Thirugnanasambandar); Tamil Nadu HR&CE Department',
  'APPROVED', 0, 0, 4.8, 210, 890, 'sangamam, kaveri, bhavani river, shiva temple, kongu nadu, rituals, erode',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'ERD'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  alternate_names = VALUES(alternate_names),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  history_origin = VALUES(history_origin),
  cultural_significance = VALUES(cultural_significance);

-- Entry 2: Bhavani Jamakkalam Weaving Heritage
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'bhavani-jamakkalam-weaving-heritage',
  'Bhavani Jamakkalam Weaving Heritage',
  'பவானி ஜமக்காளம் நெசவு மரபு',
  'Bhavani Carpets, Handloom Cotton Durries',
  'GI-tagged handloom floor rugs and blankets intricately woven from coarse dyed cotton threads on traditional pit looms.',
  'Bhavani Jamakkalam is an internationally acclaimed handloom craft holding a Geographical Indication (GI) tag. Developed towards the end of the 19th century in Bhavani by the skilled Devanga weaving community, these vibrant, striped cotton blankets and heavy floor carpets (durries) are handwoven on pit looms. Celebrated for their exceptional durability and bold color schemes, they are an indispensable cultural fixture at Tamil weddings, festive gatherings, and temple ceremonies.',
  c.id, d.id, 'Bhavani Town', 11.4440, 77.6800,
  'COMMUNITY_ORAL_HISTORY', 'Weaving Guilds (Devanga / Padmasaliar)',
  'Late 19th century artisanal origin; recognized with Geographical Indication (GI) status in 2005.',
  'Preserves indigenous pit-loom handloom weaving traditions and forms an economic pillar for thousands of artisanal households in the Kongu belt.',
  'Handloom expos, wedding gift traditions, Ayudha Pooja loom blessing',
  'Pit loom jacquard weaving, yarn dyeing',
  '/images/placeholders/place.svg',
  'Geographical Indications Registry of India; Department of Handlooms & Textiles, Tamil Nadu',
  'APPROVED', 0, 0, 4.7, 115, 430, 'jamakkalam, handloom, bhavani, textiles, gi tag, weaving, erode',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'ERD'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Kodumanal Sangam Archaeological Site
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kodumanal-sangam-archaeological-site',
  'Kodumanal Sangam Archaeological Site',
  'கொடுமணல் சங்ககால தொல்லியல் களம்',
  'Kodumanam (as referenced in Pathitrupathu)',
  '2,500-year-old Sangam-era industrial metropolis famous for quartz bead making, iron metallurgy, Roman coin hoards, and Tamil-Brahmi pottery.',
  'Mentioned as ''Kodumanam'' in the classical Sangam anthology Pathitrupathu, Kodumanal is an extraordinary archaeological site located on the northern bank of the Noyyal River. Systematic excavations by the Tamil Nadu State Department of Archaeology and Tamil University have unearthed an extensive bead manufacturing industry utilizing beryl, quartz, and carnelian, iron and steel furnaces that produced high-carbon crucible steel (wootz), megalithic stone cists, Roman coins, and more than 500 potsherds inscribed with ancient Tamil-Brahmi names.',
  c.id, d.id, 'Kodumanal, Perundurai', 11.1082, 77.5147,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Sangam / Megalithic Civilization',
  '5th century BCE to 2nd century CE; celebrated in Sangam poetry (Pathitrupathu 67, 74).',
  'Provides empirical evidence of early historic urbanism, international maritime trade with Rome and the Mediterranean, and widespread Tamil-Brahmi literacy in ancient Kongu Nadu.',
  'Archaeological study tours and heritage seminars',
  'Lapidary quartz bead crafting, iron and crucible steel metallurgy, Tamil-Brahmi epigraphy',
  '/images/placeholders/place.svg',
  'Tamil Nadu State Department of Archaeology; Excavations at Kodumanal reports (Prof. K. Rajan)',
  'APPROVED', 0, 1, 4.8, 95, 380, 'archaeology, sangam, kodumanal, tamil brahmi, noyyal, megalithic, iron age, erode',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'ERD'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge Topics for Erode
INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'BHAVANI_KOODUTHURAI',
  'erode, bhavani, sangameshwarar, kooduthurai, triveni sangamam, kaveri, river confluence',
  'HINDU_HERITAGE',
  'ERD',
  'The Bhavani Sangameshwarar Temple in Erode is located at Kooduthurai, the confluence of the Kaveri, Bhavani, and mythical Amudha rivers. It is a highly sacred site for Hindu ancestral rites and river worship.',
  'ஈரோடு மாவட்டத்தில் உள்ள பவானி சங்கமேஸ்வரர் கோயில், காவிரி, பவானி மற்றும் அமுத நதி ஆகிய மூன்று நதிகள் இணையும் ''கூடுதுறை''யில் அமைந்துள்ளது. இது தென்னகத்தின் திரிவேணி சங்கமம் என அழைக்கப்படுகிறது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'bhavani-sangameshwarar-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);

INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'BHAVANI_JAMAKKALAM',
  'erode, bhavani, jamakkalam, carpet, durrie, handloom, pit loom, gi tag',
  'TRADITIONAL_CRAFTS',
  'ERD',
  'Bhavani Jamakkalam is a GI-tagged traditional handloom carpet craft from Bhavani in Erode district, known for its durable and vibrant pit-woven cotton floor mats used in celebrations.',
  'பவானி ஜமக்காளம் என்பது ஈரோடு மாவட்டத்தின் பவானியில் பாரம்பரிய குழித்தறிகளில் நெய்யப்படும் உலகப் புகழ் பெற்ற, புவிசார் குறியீடு பெற்ற பருத்தி விரிப்பு கைவினைப் பொருளாகும்.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'bhavani-jamakkalam-weaving-heritage'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);

INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'KODUMANAL_ARCHAEOLOGY',
  'kodumanal, erode, sangam, pathitrupathu, noyyal, beads, quartz, metallurgy, tamil brahmi',
  'ARCHAEOLOGICAL_INSCRIPTIONS',
  'ERD',
  'Kodumanal in Erode district is a major 2,500-year-old Sangam-era archaeological site famous for semi-precious quartz bead manufacturing, crucible steel smelting, and hundreds of Tamil-Brahmi inscribed potsherds.',
  'ஈரோடு மாவட்டம் நொய்யல் கரையில் உள்ள கொடுமணல், 2,500 ஆண்டுகள் பழமையான சங்க காலத் தொழில் நகரமாகும். இது பளிங்கு மணி தயாரிப்பு, இரும்பு உருக்கு ஆலைகள் மற்றும் தமிழ்-பிராமி கல்வெட்டு பானை ஓடுகளுக்குப் புகழ்பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'kodumanal-sangam-archaeological-site'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
