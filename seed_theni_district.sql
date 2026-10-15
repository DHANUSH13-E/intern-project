-- ===================================================================
-- SEED SCRIPT: THENI DISTRICT (THN)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Theni District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'THN', 'Theni', 'தேனி', 'Southern', 10.0104, 77.4768,
  'A picturesque district nestled in the Western Ghats, famous for its sprawling cardamom and tea plantations, the Vaigai Dam, and lush mountain retreats.'
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
  'meghamalai-high-wavy-mountains',
  'Meghamalai - High Wavy Mountains',
  'மேகமலை',
  'High Wavy Mountains, Paccha Kumachi',
  'A pristine and relatively unexplored hill range in the Western Ghats, known for its extensive tea estates, rich wildlife, and cloud-covered peaks.',
  'Meghamalai, popularly called the ''High Wavy Mountains'', is a cool and misty mountain range situated at an elevation of 1,500 meters. Covered in undulating tea, coffee, and cardamom estates, the region is a crucial biodiversity hotspot forming the Meghamalai Wildlife Sanctuary. It serves as a vital corridor for elephants and the endangered Grizzled Giant Squirrel. Untouched by heavy commercial tourism, it remains one of Tamil Nadu''s best-kept secrets for ecological and nature-based exploration.',
  c.id, d.id, 'Meghamalai', 9.7155, 77.4093,
  'COMMUNITY_ORAL_HISTORY', 'Secular / Natural Heritage',
  'Historically inhabited by indigenous tribes and later developed into tea estates by the British.', 'Represents a crucial ecological buffer zone in the Western Ghats, preserving the delicate balance between sustainable plantation agriculture and wildlife conservation.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 1, 4.8, 180, 750, 'hill station, tea estate, wildlife, western ghats, meghamalai, nature',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'THN'
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
  'MEGHAMALAI_HILLS',
  'theni, meghamalai, high wavy mountains, tea estate, hidden gem, wildlife, hill station',
  'HIDDEN_GEMS',
  'THN',
  'Meghamalai, also known as the High Wavy Mountains, is a serene and relatively unexplored hill station in Theni district. It is famous for its misty tea estates, cardamom plantations, and rich wildlife sanctuary.',
  'தேனி மாவட்டத்தில் உள்ள மேகமலை ''High Wavy Mountains'' என்று அழைக்கப்படுகிறது. இது தேயிலை மற்றும் ஏலக்காய் தோட்டங்களுக்கும், மேகங்கள் தவழும் மலை முகடுகளுக்கும், வனவிலங்கு சரணாலயத்திற்கும் பெயர் பெற்ற அழகிய மலைவாசஸ்தலமாகும்.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'meghamalai-high-wavy-mountains'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
