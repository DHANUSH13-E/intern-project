-- ===================================================================
-- SEED SCRIPT: CUDDALORE DISTRICT (CDM)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Cuddalore District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'CDM', 'Cuddalore', 'கடலூர்', 'Central', 11.7480, 79.7714,
  'A historic coastal district known for its ancient port cities, the sprawling Pichavaram mangrove forests, and the world-renowned Chidambaram Nataraja Temple, which represents the cosmic dance of Lord Shiva.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Cuddalore
-- Entry 1: Thillai Nataraja Temple, Chidambaram
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thillai-nataraja-temple-chidambaram',
  'Thillai Nataraja Temple, Chidambaram',
  'தில்லை நடராஜர் கோயில், சிதம்பரம்',
  'Chidambaram Temple, Thillai Ambalam',
  'One of the holiest Shiva temples representing the element of space (Akasha), famous for the cosmic dance of Lord Nataraja and the ''Chidambara Rahasyam''.',
  'The Thillai Nataraja Temple is a masterpiece of Dravidian architecture and a profound spiritual center in Shaivism. Unlike most Shiva temples where the primary deity is a Lingam, here Shiva is worshipped in his anthropomorphic form as Nataraja, the Lord of Dance, performing the Ananda Tandava. The temple is one of the Pancha Bhoota Stalams, representing Akasha (Space). The east and west temple gopurams are carved with the 108 karanas (dance postures) of the Natya Shastra, establishing its deep connection to Bharatanatyam.',
  c.id, d.id, 'Chidambaram', 11.3996, 79.6936,
  'HISTORICAL_FACT', 'Hindu',
  'Ancient origins with major renovations by the Chola, Pandya, Vijayanagara, and Chera dynasties from the 10th century onwards.',
  'The spiritual home of Bharatanatyam. It hosts the annual Natyanjali dance festival where classical dancers from across the world perform as an offering to Lord Nataraja.',
  'Ani Thirumanjanam, Margazhi Arudra Darshan, annual Natyanjali Dance Festival during Maha Shivaratri',
  'Bharatanatyam (108 Natya Shastra Karanas), Tevaram singing, Chola bronze casting',
  'Silk dance costumes, traditional temple veshti and angavastram',
  'Chidambaram Kathirikai Gothsu, Kovakkai poriyal, temple prasadam',
  '/images/placeholders/place.svg',
  'Tevaram Hymns; Archaeological Survey of India; Natya Shastra dance epigraphy records',
  'APPROVED', 1, 0, 4.9, 190, 680, 'nataraja, pancha bhoota stalam, akasha, bharatanatyam, chola architecture, cosmic dance, chidambaram, cuddalore',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'CDM'
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

-- Entry 2: Vadalur Sathya Gnana Sabha
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'vadalur-sathya-gnana-sabha',
  'Vadalur Sathya Gnana Sabha',
  'வடலூர் சத்திய ஞான சபை',
  'Vallalar Temple of Light, Samarasa Suddha Sanmarga Nilayam',
  'Spiritual sanctuary founded by Saint Ramalinga Adigalar (Vallalar), famed for the eternal flame of light and 150+ years of uninterrupted free feeding.',
  'Established in 1872 by the revered Tamil saint-poet Ramalinga Swamigal (Vallalar), the Sathya Gnana Sabha in Vadalur is an octagonal hall of universal compassion. Rejecting caste discrimination and animal sacrifice, Vallalar instituted the worship of God as ''Arutperunjothi'' (Supreme Grace Light). Next to the Sabha stands the Sathya Dharma Salai, where the sacrificial kitchen fire lit by Vallalar in 1867 has been kept burning without interruption for over 150 years, providing free vegetarian food daily to thousands of poor pilgrims.',
  c.id, d.id, 'Vadalur', 11.5390, 79.5330,
  'HISTORICAL_FACT', 'Vallalar Tradition (Samarasa Suddha Sanmarga)',
  'Founded in 1867 (Dharma Salai) and 1872 (Gnana Sabha) by Ramalinga Adigalar.',
  'A pioneering social and spiritual revolution in Tamil Nadu advocating universal human equality, non-violence (Jeevakarunyam), and spiritual illumination.',
  'Thai Poosam Jothi Darshan (revelation of the sacred flame through seven colorful veils)',
  'Thiruvarutpa devotional singing, vegetarian culinary culture',
  'Simple white cotton dhoti and upper cloth',
  'Sanmarga satvik vegetarian meals, kanji, sambar sadam',
  '/images/placeholders/place.svg',
  'Thiruvarutpa texts; Government of Tamil Nadu HR&CE Department',
  'APPROVED', 1, 0, 4.9, 140, 480, 'vallalar, compassion, jothi, free food, vadalur, sanmarga, cuddalore',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'RELIGIOUS_HERITAGE' AND d.code = 'CDM'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Pichavaram Mangrove Forest
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'pichavaram-mangrove-forest',
  'Pichavaram Mangrove Forest',
  'பிச்சாவரம் அலையாத்திக் காடுகள்',
  'Pichavaram Mangrove Wetland, World''s Second Largest Mangrove',
  'One of the world''s largest mangrove forest ecosystems, featuring over 4,400 interconnected tidal canals between the Vellar and Coleroon estuaries.',
  'Covering roughly 1,100 hectares, the Pichavaram mangrove wetland is a coastal wonderland of Avicennia and Rhizophora trees whose stilt roots rise out of shallow brackish waters. Separated from the Bay of Bengal by a sandbar, the intricate network of water channels supports over 170 species of birds, otters, and marine life. The forest famously acted as a natural bio-shield that buffered and saved surrounding villages during the 2004 Indian Ocean tsunami.',
  c.id, d.id, 'Pichavaram, near Chidambaram', 11.4300, 79.7830,
  'HISTORICAL_FACT', 'General / Coastal Community',
  'Natural coastal estuarine wetland nurtured by Irula tribal and fishing communities for generations; declared a protected forest in 1893.',
  'Demonstrates the essential role of estuarine mangrove ecosystems in coastal ecology and traditional sustainable fisheries.',
  'Seasonal eco-tourism, boating tours in winter months',
  'Traditional wooden rowboat carving',
  'Coastal seafood specialties, mud crab curry, prawn roast',
  '/images/placeholders/place.svg',
  'Tamil Nadu Forest Department; M.S. Swaminathan Research Foundation Mangrove Studies',
  'APPROVED', 0, 1, 4.8, 125, 420, 'mangrove, backwater, ecotourism, wetland, pichavaram, hidden-gem, cuddalore',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'CDM'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge for Cuddalore
INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'CHIDAMBARAM_NATARAJA',
  'cuddalore, chidambaram, nataraja, thillai, akasha lingam, chidambara rahasyam, natyanjali, space element',
  'HINDU_HERITAGE',
  'CDM',
  'The Thillai Nataraja Temple in Chidambaram (Cuddalore district) is a major Hindu pilgrimage site representing the element of Space (Akasha). It is famous for Lord Nataraja''s cosmic dance and features carvings of the 108 Bharatanatyam dance postures.',
  'கடலூர் மாவட்டத்தில் உள்ள சிதம்பரம் தில்லை நடராஜர் கோயில், பஞ்ச பூதத் தலங்களில் ஆகாயத்தைக் குறிக்கும் சிறப்புமிக்க சிவன்கோயிலாகும். நடராஜரின் பிரபஞ்ச நடனத்திற்கும், பரதநாட்டியத்தின் 108 கரணங்களை விளக்கும் கோபுரச் சிற்பங்களுக்கும் இது புகழ்பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'thillai-nataraja-temple-chidambaram' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'CUDDALORE_OVERVIEW',
  'cuddalore, overview, about cuddalore, chidambaram, vadalur, pichavaram, coast',
  'HINDU_HERITAGE',
  'CDM',
  'Cuddalore is a historic coastal district of Tamil Nadu known for the Thillai Nataraja Temple in Chidambaram, the sprawling Pichavaram mangrove forest backwaters, and Saint Vallalar''s Sathya Gnana Sabha in Vadalur.',
  'கடலூர் மாவட்டம் உலகப் புகழ்பெற்ற சிதம்பரம் தில்லை நடராஜர் கோயில், பிச்சாவரம் அலையாத்திக் காடுகள் மற்றும் வள்ளலாரின் வடலூர் சத்திய ஞான சபைக்குப் பெயர் பெற்ற பண்பாட்டுத் தலமாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'thillai-nataraja-temple-chidambaram' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'VADALUR_VALLALAR',
  'vadalur, vallalar, ramalinga adigalar, jothi darshan, sathya gnana sabha, free food, sanmarga',
  'RELIGIOUS_HERITAGE',
  'CDM',
  'Vadalur Sathya Gnana Sabha, founded in 1872 by Saint Vallalar (Ramalinga Adigalar), is known for the worship of divine light (Arutperunjothi) and serving free food continuously for over 150 years.',
  'வள்ளலார் அவர்களால் 1872-ல் நிறுவப்பட்ட வடலூர் சத்திய ஞான சபை, ஜோதி வழிபாட்டிற்கும் 150 ஆண்டுகளுக்கும் மேலாக அணையா அடுப்பில் அன்னதானம் வழங்கி வருவதற்கும் புகழ்பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'vadalur-sathya-gnana-sabha' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'PICHAVARAM_MANGROVES',
  'pichavaram, mangrove, boating, backwaters, forest, chidambaram boating',
  'HIDDEN_GEMS',
  'CDM',
  'Pichavaram Mangrove Forest near Chidambaram is one of the largest mangrove ecosystems in India, featuring over 4,400 interconnected water channels and diverse bird species.',
  'சிதம்பரம் அருகே உள்ள பிச்சாவரம் அலையாத்திக் காடுகள், 4,400-க்கும் மேற்பட்ட கால்வாய்களைக் கொண்ட இந்தியாவின் மிகப்பெரிய இயற்கை சதுப்புநில அலையாத்திக் காடுகளில் ஒன்றாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'pichavaram-mangrove-forest' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);
