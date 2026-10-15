-- ===================================================================
-- SEED SCRIPT: KANCHIPURAM DISTRICT (KCH)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Kanchipuram District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'KCH', 'Kanchipuram', 'காஞ்சிபுரம்', 'Northern', 12.8185, 79.6947,
  'Known as the ''City of Thousand Temples'', Kanchipuram is a sacred pilgrimage center for both Shaivites and Vaishnavites, historically the Pallava capital, and globally renowned for its exquisite hand-woven silk sarees.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Kanchipuram
-- Entry 1: Kanchipuram Silk Weaving Tradition
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kanchipuram-silk-weaving-tradition',
  'Kanchipuram Silk Weaving Tradition',
  'காஞ்சிபுரம் பட்டு நெசவு மரபு',
  'Kanjivaram Silk, Kanchi Pattu',
  'A world-renowned traditional handloom industry producing luxurious silk sarees characterized by pure mulberry silk and heavy zari work.',
  'The Kanchipuram silk weaving tradition traces its roots back to the Chola and Pallava periods, heavily influenced by the Devanga and Saligar weaving communities. A genuine Kanjivaram saree uses pure mulberry silk thread dipped in liquid gold and silver (zari). They are distinguished by the ''Korvai'' technique, where the border and body are woven separately and intricately joined. The motifs—such as peacocks, yalis, temple borders, and mangoes—are deeply inspired by the region''s temple architecture.',
  c.id, d.id, 'Kanchipuram City', 12.8185, 79.6947,
  'COMMUNITY_ORAL_HISTORY', 'Weaving Communities (Devanga/Saligar)',
  'Developed under royal patronage over 400 years ago; weavers migrated from Andhra Pradesh under the reign of Krishna Deva Raya.',
  'A Geographical Indication (GI) tagged craft that forms the backbone of South Indian bridal and ceremonial attire, preserving ancient handloom techniques.',
  'South Indian weddings, Margazhi music concerts, Diwali, Pongal festival celebrations',
  'Korvai joint weaving, Petni warp attachment, pure silver-gold zari craft',
  'Kanjivaram silk saree with contrast border and temple spires',
  'Kovakkai Poriyal, Kanchipuram Idli (steamed in mandharai leaves with pepper and cumin)',
  '/images/placeholders/place.svg',
  'Geographical Indications Registry (GI Tag No. 47); Department of Handlooms, Government of Tamil Nadu',
  'APPROVED', 1, 0, 4.9, 420, 1850, 'silk saree, handloom, kanjivaram, textiles, zari, wedding, kanchipuram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_DRESS' AND d.code = 'KCH'
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

-- Entry 2: Kanchi Kailasanathar Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kanchi-kailasanathar-temple',
  'Kanchi Kailasanathar Temple',
  'காஞ்சி கைலாசநாதர் கோயில்',
  'Rajasimhesvara Temple',
  'The oldest structural stone temple in Kanchipuram built by Pallava King Rajasimha, renowned for sandstone rock relief carvings and 58 sub-shrines.',
  'Built between 685–705 CE by Pallava King Narasimhavarman II (Rajasimha) and completed by his son Mahendravarman III, Kailasanathar Temple is the oldest surviving sandstone structural temple in Kanchipuram. The complex features a four-storey pyramidal vimana surrounded by 58 miniature cloister shrines dedicated to various forms of Shiva, showcasing exquisite Somaskanda panels, dancing ganas, and Pallava calligraphic inscriptions. It served as the architectural benchmark for the Brihadisvara Temple at Thanjavur.',
  c.id, d.id, 'Kanchipuram', 12.8423, 79.6897,
  'HISTORICAL_FACT', 'Hindu (Shaivism)',
  'Constructed 685-705 CE under Pallava King Rajasimha; recorded in contemporary Pallava epigraphs.',
  'The pinnacle of early Dravidian stone architecture, illustrating the transition from rock-cut cave shrines to freestanding stone temples.',
  'Maha Shivaratri, Heritage architecture walks',
  'Sandstone sculpture, Pallava Grantha calligraphy',
  'Traditional white veshti and silk angavastram',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India (ASI); Pallava Architecture by A.H. Longhurst',
  'APPROVED', 0, 0, 4.9, 230, 910, 'pallava, kailasanathar, shiva, monument, architecture, sandstone, kanchipuram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'KCH'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Ekambareswarar Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'ekambareswarar-temple',
  'Ekambareswarar Temple',
  'ஏகாம்பரேஸ்வரர் திருக்கோயில்',
  'Periya Kovil of Kanchi, Prithvi Stalam',
  'One of the Pancha Bhoota Stalams representing the Earth element (Prithvi), with a 59-meter Vijayanagara gopuram and a sacred 3,500-year-old mango tree.',
  'Spanning 25 acres, Ekambareswarar Temple is the largest temple in Kanchipuram, revered as the Prithvi (Earth) element temple among the five elemental Shiva shrines (Pancha Bhoota Sthalas). According to legend, Goddess Parvati worshipped a Shivalingam sculpted out of sand (Prithvi Lingam) beneath a sacred mango tree. The inner courtyard features a revered ancient mango tree with four main branches representing the four Vedas, said to bear fruits of four different tastes. The magnificent 59-meter Raja Gopuram was commissioned by Vijayanagara Emperor Krishnadevaraya in 1509 CE.',
  c.id, d.id, 'Kanchipuram', 12.8475, 79.6999,
  'HISTORICAL_FACT', 'Hindu (Shaivism)',
  'Pre-6th century CE origins documented in Tevaram hymns; monumental gopuram added by Krishnadevaraya in 1509 CE.',
  'Supreme cosmic symbol of the Earth element in Tamil Shaivism; praised in hymns by all three primary Nayanmars (Appar, Sambandar, Sundarar).',
  'Panguni Uthiram celestial wedding festival, Ani Tirumanjanam, Maha Shivaratri',
  'Tevaram chanting, temple brass chariot processions',
  'Dhoti, angavastram, sacred ash (vibhuti)',
  'Kanchipuram Idli (spiced with whole peppercorns and dry ginger), Kovil Sakkarai Pongal',
  '/images/placeholders/place.svg',
  'Tevaram hymns; Epigraphia Indica; Tamil Nadu HR&CE Department',
  'APPROVED', 0, 0, 4.8, 310, 1250, 'pancha bhoota stalam, earth element, prithvi, ekambareswarar, shiva, gopuram, kanchipuram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'KCH'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge Topics for Kanchipuram
INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'KANCHIPURAM_SILK',
  'kanchipuram, kanchi pattu, kanjivaram, silk saree, weaving, handloom, zari, korvai',
  'TRADITIONAL_DRESS',
  'KCH',
  'Kanchipuram is globally famous for its hand-woven silk sarees (Kanjivaram). Woven from pure mulberry silk and silver/gold zari, these sarees use the ''Korvai'' technique and feature motifs inspired by local temple architecture.',
  'காஞ்சிபுரம் பட்டுப் புடவைகள் (காஞ்சிப் பட்டு) உலகப் புகழ் பெற்றவை. தூய மல்பெரி பட்டு மற்றும் சரிகையால் கையால் நெய்யப்படும் இப்புடவைகள், கோயில்களின் சிற்பங்களை அடிப்படையாகக் கொண்ட வடிவமைப்புகளைக் கொண்டுள்ளன.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'kanchipuram-silk-weaving-tradition'
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
  'KANCHI_KAILASANATHAR',
  'kailasanathar, kanchipuram, rajasimha, pallava, stone temple, sandstone, somaskanda',
  'HISTORICAL_MONUMENTS',
  'KCH',
  'Kanchi Kailasanathar Temple is the oldest surviving stone temple in Kanchipuram, built in 685-705 CE by Pallava King Rajasimha, celebrated for its 58 ornate sub-shrines and intricate sandstone carvings.',
  'காஞ்சி கைலாசநாதர் கோயில் கி.பி 685-705 இல் பல்லவ மன்னர் ராஜசிம்மனால் கட்டப்பட்ட காஞ்சிபுரத்தின் மிக பழமையான கற்றளியாகும். இது 58 துணை சன்னதிகள் மற்றும் மணற்கல் சிற்பங்களுக்குப் புகழ்பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'kanchi-kailasanathar-temple'
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
  'EKAMBARESWARAR_TEMPLE',
  'ekambareswarar, kanchipuram, prithvi lingam, earth element, pancha bhoota, mango tree, krishnadevaraya',
  'HINDU_HERITAGE',
  'KCH',
  'Ekambareswarar Temple in Kanchipuram is the Earth (Prithvi) element shrine of the Pancha Bhoota Stalams, featuring a towering 59-meter gopuram built by Krishnadevaraya and a sacred 3,500-year-old mango tree.',
  'காஞ்சிபுரம் ஏகாம்பரேஸ்வரர் திருக்கோயில் பஞ்சபூதத் தலங்களில் நிலத்திற்குரிய (பிருத்வி) தலமாகும். இங்கு கிருஷ்ணதேவராயரால் கட்டப்பட்ட 59 மீட்டர் ராஜகோபுரமும், 3500 ஆண்டுகள் பழமையான புனித மாமரமும் உள்ளன.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'ekambareswarar-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
