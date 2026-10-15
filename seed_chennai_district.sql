-- ===================================================================
-- SEED SCRIPT: CHENNAI DISTRICT (CHN)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Chennai District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'CHN', 'Chennai', 'சென்னை', 'Northern', 13.0827, 80.2707,
  'The capital city of Tamil Nadu, formerly known as Madras. It is a major cultural hub renowned for its colonial heritage, classical Carnatic music season, bustling beaches, and ancient neighborhood temples like Mylapore.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Chennai
-- Entry 1: Kapaleeshwarar Temple, Mylapore
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kapaleeshwarar-temple-mylapore',
  'Kapaleeshwarar Temple, Mylapore',
  'கபாலீஸ்வரர் கோயில், மயிலாப்பூர்',
  'Kapaleeswarar Kovil, Mylapore Shiva Temple',
  'An iconic Dravidian-style temple dedicated to Lord Shiva, renowned for its towering gopuram and the grand annual Arupathumoovar festival.',
  'Located in the historic neighborhood of Mylapore, the Kapaleeshwarar Temple is a masterpiece of Dravidian architecture. Originally built around the 7th century CE by the Pallavas and later rebuilt by the Vijayanagara kings in the 16th century after the original was destroyed, it remains the cultural epicenter of Chennai. The temple is intricately linked to the Tamil Shaivite saints (Nayanmars) and hosts the spectacular Panguni Peruvizha, highlighted by the Arupathumoovar procession.',
  c.id, d.id, 'Mylapore, Chennai', 13.0335, 80.2698,
  'HISTORICAL_FACT', 'Hindu',
  'Original structure dates to the 7th century Pallava era; current structure rebuilt in the 16th century Vijayanagara style.',
  'A vibrant center for Tamil Hindu traditions, Carnatic music, and the annual Panguni festival which draws thousands of devotees to witness the chariot procession.',
  'Panguni Peruvizha with the 63 Nayanmars (Arupathumoovar) procession; Maha Shivaratri, Navaratri',
  'Carnatic music concerts, Bharatanatyam, Tevaram hymns',
  'Silk sarees for women, traditional veshti and angavastram for men',
  'Mylapore filter coffee, traditional temple prasadam, medu vada, pongal',
  '/images/placeholders/place.svg',
  'Tevaram Hymns; Tamil Nadu HR&CE Department records; Archaeological Survey of India',
  'APPROVED', 1, 0, 4.9, 180, 620, 'dravidian architecture, chennai heritage, mylapore, shiva temple, nayanmars, carnatic, chennai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'CHN'
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

-- Entry 2: San Thome Basilica
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'san-thome-basilica',
  'San Thome Basilica',
  'சாந்தோம் பேராலயம்',
  'St. Thomas Cathedral Basilica, San Thome Church',
  'Neo-Gothic Roman Catholic minor basilica built over the reputed tomb of St. Thomas the Apostle.',
  'Constructed in 1893 by the British over earlier 16th-century Portuguese church foundations, San Thome Basilica is one of only three known basilicas in the world built directly over the tomb of an apostle of Jesus Christ. Built in striking Neo-Gothic style with towering white spires, stained-glass windows depicting the life of Christ, and a subterranean tomb chapel and museum, it is a foremost pilgrimage center for Christians across India.',
  c.id, d.id, 'Mylapore / Santhome, Chennai', 13.0334, 80.2785,
  'HISTORICAL_FACT', 'Christian (Catholic)',
  'Built in 1893 on the site of earlier 16th-century Portuguese churches; tradition holds that St. Thomas reached the Coromandel Coast in 52 CE.',
  'A landmark of Chennai''s multi-faith coastal heritage and an internationally revered pilgrimage center.',
  'Feast of St. Thomas (July 3), Christmas Midnight Mass, Easter celebrations',
  'Sacred choral music, Christian hymnology, ecclesiastical architecture',
  'Sunday choir vestments, traditional festival attire',
  'Anglo-Indian and coastal Christian cuisine',
  '/images/placeholders/place.svg',
  'Archdiocese of Madras-Mylapore records; Archaeological Survey of India',
  'APPROVED', 1, 0, 4.8, 142, 490, 'christian, basilica, st thomas, chennai, neo gothic, santhome',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'CHRISTIAN_HERITAGE' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Fort St. George & St. Mary's Church
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'fort-st-george-st-marys-church',
  'Fort St. George & St. Mary''s Church',
  'புனித ஜார்ஜ் கோட்டை மற்றும் புனித மேரி தேவாலயம்',
  'Fort St. George, Seat of Tamil Nadu Government',
  'The first English fortress in India, founded in 1640, now housing the Tamil Nadu Secretariat and Archaeological Museum.',
  'Erected by the British East India Company in 1639-40, Fort St. George formed the nucleus around which the modern metropolis of Madras grew. Inside its granite ramparts stands St. Mary''s Church (the oldest Anglican church east of Suez, consecrated in 1680), Clive House, and the Fort Museum displaying colonial weaponry, coins, uniforms, and original letters. Today, it serves as the official administrative seat of the Government of Tamil Nadu.',
  c.id, d.id, 'Rajaji Salai, Chennai', 13.0797, 80.2876,
  'HISTORICAL_FACT', 'General / Secular',
  'Constructed by Francis Day and Andrew Cogan of the British East India Company beginning in 1639.',
  'The birthplace of modern urban Chennai and the epicenter of Tamil Nadu''s democratic governance.',
  'Independence Day and Republic Day ceremonial flag-hoisting',
  'Colonial military architecture, archival museology',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India Fort Museum; Government of Tamil Nadu Archives',
  'APPROVED', 0, 0, 4.7, 98, 350, 'colonial, fort, east india company, chennai, history, secretariat',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 4: Chennai Margazhi Carnatic Music Season
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'chennai-margazhi-carnatic-music-season',
  'Chennai Margazhi Carnatic Music Season',
  'சென்னை மார்கழி கர்நாடக இசைப் பெருவிழா',
  'Madras Music Season, Margazhi Utsavam',
  'One of the world''s largest cultural music festivals, featuring hundreds of Carnatic concerts across historic Chennai Sabhas.',
  'Originating in 1927 to commemorate the founding of the Madras Music Academy, the Margazhi Music Season spans mid-December to mid-January. Over a thousand Carnatic vocalists, veena, violin, and mridangam artists, and Bharatanatyam exponents perform across prestigious cultural institutions (Sabhas) such as the Music Academy, Narada Gana Sabha, and Krishna Gana Sabha, accompanied by traditional Sabha canteen delicacies.',
  c.id, d.id, 'Mylapore & T. Nagar, Chennai', 13.0428, 80.2520,
  'COMMUNITY_ORAL_HISTORY', 'General / Art Community',
  'Inaugurated in December 1927 alongside the All India Congress Session, evolving into an annual tradition.',
  'Celebrated globally as one of the world''s largest classical music festivals, preserving centuries-old Carnatic ragas and compositions of the Trimurti.',
  'Margazhi morning bhajans, daily sabha concerts, lecture-demonstrations',
  'Carnatic vocal, Veena, Mridangam, Ghatam, Bharatanatyam',
  'Silk sarees with temple borders, traditional veshti and angavastram',
  'Sabha canteen delicacies: Asoka halwa, Keerai vadai, Elaneer payasam, Madras filter coffee',
  '/images/placeholders/music.svg',
  'The Music Academy Madras historical archives; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 5.0, 165, 540, 'carnatic, music season, margazhi, sabha, bharatanatyam, chennai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge for Chennai
INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'KAPALEESHWARAR_TEMPLE',
  'kapaleeshwarar, mylapore, shiva temple, arupathumoovar, panguni peruvizha, chennai temple',
  'HINDU_HERITAGE',
  'CHN',
  'Kapaleeshwarar Temple in Mylapore, Chennai, is an ancient Dravidian-style Shiva temple originally built by the Pallavas and rebuilt in the 16th century Vijayanagara style, famed for its towering gopuram and the annual Arupathumoovar festival.',
  'மயிலாப்பூரில் உள்ள கபாலீஸ்வரர் கோயில், பல்லவர் மற்றும் விஜயநகர கலைப் பாணியில் அமைந்த புகழ்பெற்ற சிவன் கோயிலாகும்; இதன் அறுபத்துமூவர் திருவிழா மிகவும் பிரசித்தி பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'kapaleeshwarar-temple-mylapore' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'CHENNAI_OVERVIEW',
  'chennai, madras, capital, overview, about chennai, mylapore, marina',
  'HISTORICAL_MONUMENTS',
  'CHN',
  'Chennai is the capital city of Tamil Nadu, known for its rich cultural mix of ancient temples like Kapaleeshwarar in Mylapore, San Thome Basilica, Fort St. George, Marina Beach, and the world-renowned Margazhi Carnatic Music Season.',
  'தமிழ்நாட்டின் தலைநகரான சென்னை, மயிலாப்பூர் கபாலீஸ்வரர் கோயில், சாந்தோம் பேராலயம், புனித ஜார்ஜ் கோட்டை மற்றும் மார்கழி இசை விழாவிற்குப் புகழ்பெற்ற பண்பாட்டு மையம்.',
  1,
  id
FROM cultural_entries WHERE slug = 'kapaleeshwarar-temple-mylapore' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'SAN_THOME_BASILICA',
  'san thome, basilica, st thomas, cathedral, mylapore church, chennai christian',
  'CHRISTIAN_HERITAGE',
  'CHN',
  'San Thome Basilica in Chennai is a Neo-Gothic Roman Catholic minor basilica built over the reputed tomb of St. Thomas the Apostle, one of only three such apostolic churches worldwide.',
  'சென்னையில் உள்ள சாந்தோம் பேராலயம் புனித தோமையாரின் கல்லறையின் மீது கட்டப்பட்ட உலகப் புகழ்பெற்ற நியோ-கோதிக் பாணி கிறிஸ்தவ பேராலயமாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'san-thome-basilica' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'FORT_ST_GEORGE',
  'fort st george, colonial, british fort, east india company, secretarial, chennai fort',
  'HISTORICAL_MONUMENTS',
  'CHN',
  'Fort St. George, built in 1640 by the British East India Company, is the first English fortress in India and currently houses the Tamil Nadu Legislative Assembly and Secretariat.',
  '1640-ல் ஆங்கிலேயர்களால் கட்டப்பட்ட புனித ஜார்ஜ் கோட்டை, இந்தியாவின் முதல் ஆங்கிலேயக் கோட்டையாகும்; தற்போது தமிழக தலைமைச் செயலகமாக செயல்படுகிறது.',
  1,
  id
FROM cultural_entries WHERE slug = 'fort-st-george-st-marys-church' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'CHENNAI_MUSIC_SEASON',
  'margazhi, music season, carnatic, sabha, chennai concerts, music academy',
  'MUSIC_TRADITIONS',
  'CHN',
  'The Chennai Margazhi Music Season, held every December-January since 1927, is one of the world''s largest classical music festivals featuring hundreds of Carnatic music and Bharatanatyam performances.',
  'சென்னையில் ஆண்டுதோறும் மார்கழி மாதத்தில் நடைபெறும் இசைப் பெருவிழா, உலகின் மிகப்பெரிய பாரம்பரிய கர்நாடக இசை மற்றும் பரதநாட்டிய விழாக்களில் ஒன்றாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'chennai-margazhi-carnatic-music-season' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);
