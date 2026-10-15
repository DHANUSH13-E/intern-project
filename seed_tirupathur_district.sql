-- ===================================================================
-- SEED SCRIPT: TIRUPATHUR DISTRICT (TPR)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tirupathur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TPR', 'Tirupathur', 'திருப்பத்தூர்', 'Northern', 12.4934, 78.5661,
  'Known as the ''Sandalwood City'', Tirupathur is renowned for the Yelagiri hill station, serene lakes, and the Vainu Bappu Observatory in Kavalur.'
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
  'yelagiri-hills-and-tribal-culture',
  'Yelagiri Hills and Tribal Culture',
  'ஏலகிரி மலை மற்றும் பழங்குடி பண்பாடு',
  'Elagiri',
  'A cluster of 14 tribal villages nestled among 4 emerald green hills, offering a quiet, non-commercialized hill station experience.',
  'Yelagiri is a peaceful hill station situated at an altitude of 1,410 meters. Unlike the highly commercialized Ooty or Kodaikanal, Yelagiri retains a pristine charm. It comprises 14 hamlets inhabited primarily by the Malayali tribal community, who engage in agriculture and orcharding (jackfruit, honey, and hill bananas). The Punganoor Lake Park, Jalagamparai Waterfalls, and the Swamimalai Trek are key highlights. The local tribal communities preserve indigenous farming techniques and host an annual summer festival showcasing their traditional music and dances.',
  c.id, d.id, 'Yelagiri', 12.576, 78.6385,
  'COMMUNITY_ORAL_HISTORY', 'Tribal / Malayali Community',
  'Historically a private estate of the Yelagiri Zamindar, taken over by the Government in the 1950s.', 'A model of eco-tourism where indigenous tribal village administration (Panchayat) works in harmony with modern tourism, preserving local agrarian cultures.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 0, 4.8, 190, 800, 'hill station, yelagiri, tribal, eco tourism, trekking, lake',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'TPR'
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
  'YELAGIRI_HILLS',
  'tirupathur, yelagiri, elagiri, hill station, tribal, punganoor lake, malayali tribe, trekking',
  'VILLAGE_CUSTOMS',
  'TPR',
  'Yelagiri in Tirupathur district is a tranquil hill station comprising 14 tribal villages. It is known for the Punganoor lake, trekking routes, and the preserved agrarian culture of the local Malayali tribes.',
  'திருப்பத்தூர் மாவட்டத்தில் உள்ள ஏலகிரி 14 பழங்குடி கிராமங்களைக் கொண்ட அமைதியான மலைவாசஸ்தலமாகும். இது புங்கனூர் ஏரி, மலையேற்றப் பாதைகள் மற்றும் அங்குள்ள மலையாளி பழங்குடியினரின் பாரம்பரிய விவசாயப் பண்பாட்டிற்குப் பெயர் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'yelagiri-hills-and-tribal-culture'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
