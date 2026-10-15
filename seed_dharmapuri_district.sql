-- ===================================================================
-- SEED SCRIPT: DHARMAPURI DISTRICT (DHP)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Dharmapuri District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'DHP', 'Dharmapuri', 'தருமபுரி', 'Western', 12.1211, 78.1582,
  'Known for its scenic landscapes and the spectacular Hogenakkal Falls on the Kaveri river, Dharmapuri has a rich history dating back to the Sangam era under the rule of Adhiyaman.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Dharmapuri
-- Entry 1: Hogenakkal Falls and Coracle Rides
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'hogenakkal-falls-and-coracle-rides',
  'Hogenakkal Falls and Coracle Rides',
  'ஒகேனக்கல் அருவி மற்றும் பரிசல் பயணம்',
  'Niagara of India, Hogenakal',
  'A spectacular waterfall on the Kaveri river, famous for its medicinal baths, carbonatite rocks, and traditional circular coracle boat rides.',
  'Often referred to as the ''Niagara of India'', Hogenakkal is where the Kaveri river enters Tamil Nadu. The name means ''Smoking Rocks'' in Kannada, referring to the mist created by the plunging water. The site is uniquely known for its ancient carbonatite rocks, considered some of the oldest in South Asia, and the traditional parisal (coracle) rides piloted by local boatmen through the river''s gorges.',
  c.id, d.id, 'Hogenakkal', 12.1187, 77.7714,
  'COMMUNITY_ORAL_HISTORY', 'All Communities',
  'Geological formations date back millennia; traditional coracle navigation has been practiced here for centuries.',
  'A vital ecological and cultural tourism site supporting the traditional livelihoods of local coracle operators and fisherfolk.',
  'Aadi Perukku river festival, winter boating season',
  'Traditional bamboo coracle making (parisal craft)',
  'Freshly fried river fish with spicy masalas, ragi kali, meen kulambu',
  '/images/placeholders/place.svg',
  'Tamil Nadu Tourism Development Corporation; Geological Survey of India reports',
  'APPROVED', 1, 0, 4.8, 175, 620, 'waterfall, kaveri river, coracle, nature, geological site, dharmapuri, hogenakkal',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'DHP'
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

-- Entry 2: Adhiyaman Kottai
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'adhiyaman-kottai',
  'Adhiyaman Kottai',
  'அதியமான் கோட்டை',
  'Thagadur Fort, Adhiyaman Nedumaan Anji Fortress',
  'Historic fortress remains linked to the legendary Sangam-era chieftain Adhiyaman Nedumaan Anji of Thagadur.',
  'Adhiyaman Kottai is an ancient circular earthen fortress that served as the citadel of King Adhiyaman Nedumaan Anji, one of the seven great philanthropists (Kadai Ezhu Vallalgal) celebrated in classical Sangam literature (Purananuru). Adhiyaman is immortalized for gifting the rare celestial black gooseberry (nelli kani)—believed to grant longevity—to the revered poetess Avvaiyar. The site preserves ancient temple shrines and defensive moats.',
  c.id, d.id, 'Adhiyamankottai', 12.0900, 78.1000,
  'HISTORICAL_FACT', 'General / Sangam Heritage',
  'Sangam period (circa 1st - 3rd century CE); praised extensively in Purananuru verse 91.',
  'Keeps alive the memory of classical Tamil chieftaincy, generous patron-poet friendship, and Sangam military heritage.',
  'Avvaiyar literary commemorations and local temple festivals',
  'Sangam poetry recitation, Purananuru literature',
  '/images/placeholders/place.svg',
  'Purananuru Sangam poetry; Tamil Nadu State Department of Archaeology',
  'APPROVED', 0, 1, 4.7, 82, 310, 'sangam, adhiyaman, avvaiyar, fort, thagadur, dharmapuri, hidden-gem',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'DHP'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Theerthamalai Theerthagiriswarar Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'theerthamalai-theerthagiriswarar-temple',
  'Theerthamalai Theerthagiriswarar Temple',
  'தீர்த்தமலை தீர்த்தகிரீஸ்வரர் கோயில்',
  'Theerthagiri Shiva Temple',
  'Ancient hilltop Shiva temple near Harur renowned for its perennial sacred natural springs cascading down the cliffs.',
  'Situated on a scenic hill near Harur, the Theerthagiriswarar Temple is believed to have Chola and Vijayanagara foundations. The temple is famed for five perennial holy water springs (theerthams)—including Agasthya Theertham, Rama Theertham, and Vasishta Theertham—flowing perpetually from the clefts of the living rockface. Pilgrims trek up the hill to bathe in the cool medicinal waters and worship Lord Shiva.',
  c.id, d.id, 'Theerthamalai, Harur', 12.0800, 78.4800,
  'HISTORICAL_FACT', 'Hindu (Shaivism)',
  'Medieval origin with inscriptional records dating to the Chola, Hoysala, and Vijayanagara eras.',
  'A prominent regional pilgrimage center integrating nature, sacred mountain worship, and the healing powers of natural spring waters.',
  'Maha Shivaratri, Aadi Amavasya, Panguni Uthiram',
  'Tevaram chanting, temple architecture',
  'Simple pilgrim dhotis and sarees',
  'Temple prasadam',
  '/images/placeholders/place.svg',
  'Tamil Nadu HR&CE Department; District Inscription Volumes',
  'APPROVED', 0, 1, 4.8, 90, 340, 'shiva, hill temple, spring, pilgrimage, theerthamalai, dharmapuri, hidden-gem',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'DHP'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge for Dharmapuri
INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'HOGENAKKAL_FALLS',
  'dharmapuri, hogenakkal, falls, kaveri, coracle, parisal, niagara of india',
  'HIDDEN_GEMS',
  'DHP',
  'Hogenakkal Falls in Dharmapuri district is formed by the Kaveri river. Known as the ''Niagara of India'', it is famous for its mist-shrouded rocks, medicinal waters, and traditional coracle (parisal) boat rides.',
  'தருமபுரி மாவட்டத்தில் காவிரி ஆற்றின் மூலம் உருவாகும் ஒகேனக்கல் அருவி ''இந்தியாவின் நயாகரா'' என்று அழைக்கப்படுகிறது. இது மூலிகை குளியல் மற்றும் பாரம்பரிய பரிசல் பயணத்திற்கு மிகவும் புகழ்பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'hogenakkal-falls-and-coracle-rides' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'DHARMAPURI_OVERVIEW',
  'dharmapuri, overview, about dharmapuri, hogenakkal, adhiyaman, thagadur',
  'HIDDEN_GEMS',
  'DHP',
  'Dharmapuri is a scenic western district of Tamil Nadu on the Kaveri river, renowned for Hogenakkal Falls, Sangam-era Adhiyaman Kottai, and Theerthamalai hilltop temple.',
  'தருமபுரி மாவட்டம் ஒகேனக்கல் நீர்வீழ்ச்சி, சங்க கால மன்னர் அதியமான் கோட்டை மற்றும் தீர்த்தமலை கோயிலுக்குப் பெயர் பெற்ற வரலாற்றுச் சிறப்புமிக்க மேற்கு மாவட்டமாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'hogenakkal-falls-and-coracle-rides' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'ADHIYAMAN_KOTTAI',
  'adhiyaman, avvaiyar, thagadur, purananuru, fort, nelli kani, sangam king',
  'HISTORICAL_MONUMENTS',
  'DHP',
  'Adhiyaman Kottai in Dharmapuri is the ancient fort of King Adhiyaman Nedumaan Anji of Thagadur, who famously presented the immortal black gooseberry (nelli kani) to the poetess Avvaiyar.',
  'அதியமான் கோட்டை, சங்க கால தகடூர் மன்னர் அதியமான் அவ்வைக்கு அரிய நெல்லிக்கனியை ஈந்த வரலாற்றுப் பெருமை கொண்ட இடமாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'adhiyaman-kottai' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'THEERTHAMALAI_TEMPLE',
  'theerthamalai, theerthagiriswarar, sacred springs, harur, hill temple shiva',
  'HINDU_HERITAGE',
  'DHP',
  'Theerthamalai Theerthagiriswarar Temple near Harur in Dharmapuri is a sacred hilltop Shiva shrine celebrated for its perennial natural springs flowing directly from the rocks.',
  'தருமபுரி மாவட்டம் அரூர் அருகே உள்ள தீர்த்தமலை, பாறையிலிருந்து தொடர்ந்து ஊற்றெடுக்கும் புனித தீர்த்தங்களுக்கும் பழமையான சிவன் கோயிலுக்கும் புகழ்பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'theerthamalai-theerthagiriswarar-temple' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);
