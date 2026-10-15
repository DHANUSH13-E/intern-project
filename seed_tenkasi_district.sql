-- ===================================================================
-- SEED SCRIPT: TENKASI DISTRICT (TEN)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tenkasi District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TEN', 'Tenkasi', 'தென்காசி', 'Southern', 8.9595, 77.3161,
  'Meaning ''Kasi of the South'', Tenkasi is nestled at the foothills of the Western Ghats. It is famed for the magnificent Kasi Viswanathar Temple and the rejuvenating Courtallam waterfalls.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entry
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'courtallam-waterfalls-spa-of-the-south',
  'Courtallam Waterfalls - Spa of the South',
  'குற்றாலம் அருவிகள் - தென்னகத்தின் ஸ்பா',
  'Kutralam Falls, Spa of South India',
  'A series of spectacular waterfalls descending from the Agasthyamalai hills, revered for their natural beauty and the medicinal properties of the waters.',
  'Courtallam (Kutralam) is a major natural and cultural landmark in Tamil Nadu. The Chittar River cascades down the Agasthyamalai ranges of the Western Ghats, forming nine distinct waterfalls, including the Main Falls (Peraruvi), Five Falls (Aintharuvi), and Old Falls (Pazhaya Courtallam). Flowing through dense forests rich in medicinal herbs, the water is believed to have therapeutic properties, earning it the title ''Spa of the South''. The area is also home to the ancient Kutralanathar Temple (dedicated to Lord Shiva), establishing a deep cultural link between the waterfalls and Tamil Shaivite traditions.',
  c.id, d.id, 'Courtallam', 8.9288, 77.2687,
  'COMMUNITY_ORAL_HISTORY', 'All Communities',
  'Natural formation; the adjacent Kutralanathar temple has Chola and Pandya inscriptions.', 'A vital eco-tourism and pilgrimage center. The ''Saral'' (drizzling season) from June to September dictates local cultural rhythms, drawing people seeking both physical rejuvenation and spiritual solace.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'waterfalls, courtallam, kutralam, spa, western ghats, medicinal herbs',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'TEN'
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

-- 3. Insert Chatbot Knowledge Topic
INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'COURTALLAM_FALLS',
  'tenkasi, courtallam, kutralam, falls, waterfalls, spa of south, medicinal water, five falls',
  'HIDDEN_GEMS',
  'TEN',
  'Courtallam (Kutralam) in Tenkasi district is known as the ''Spa of South India''. It features nine spectacular waterfalls originating from the Western Ghats, carrying waters enriched by medicinal herbs from the Agasthyamalai hills.',
  'தென்காசி மாவட்டத்தில் உள்ள குற்றாலம் ''தென்னகத்தின் ஸ்பா'' என்று அழைக்கப்படுகிறது. மேற்குத் தொடர்ச்சி மலையில் இருந்து உற்பத்தியாகும் இங்குள்ள அருவிகளின் நீர், பல்வேறு மூலிகைகளின் மருத்துவ குணங்களைக் கொண்டுள்ளதாகக் கருதப்படுகிறது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'courtallam-waterfalls-spa-of-the-south'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
