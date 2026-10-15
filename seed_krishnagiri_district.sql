-- ===================================================================
-- SEED SCRIPT: KRISHNAGIRI DISTRICT (KRI)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Krishnagiri District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'KRI', 'Krishnagiri', 'கிருஷ்ணகிரி', 'Western', 12.528, 78.2152,
  'Meaning ''Black Hill'', Krishnagiri is known for its formidable hill forts, rich archaeological significance with numerous megalithic dolmens, and as the primary mango cultivation belt of Tamil Nadu.'
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
  'krishnagiri-fort-and-syed-basha-hills',
  'Krishnagiri Fort and Syed Basha Hills',
  'கிருஷ்ணகிரி கோட்டை மற்றும் சையத் பாஷா மலை',
  'Syed Basha Mountain Fort',
  'A strategic 16th-century hill fort built by the Vijayanagara Empire that later became a critical stronghold for Tipu Sultan.',
  'Perched atop a massive black granite hill, the Krishnagiri Fort is one of the strongest defensive structures in the region. Built initially by the Vijayanagara emperor Krishnadevaraya, it subsequently served as the capital of the Bara Mahal (twelve forts) region. The fort saw intense battles between the British East India Company and the troops of Hyder Ali and Tipu Sultan. Today, it remains an excellent example of medieval military architecture, requiring a steep climb of stone steps to reach the summit, which offers panoramic views and houses ancient granaries and armories.',
  c.id, d.id, 'Krishnagiri Town', 12.5367, 78.2144,
  'HISTORICAL_FACT', 'Secular / Military Heritage',
  'Constructed in the 16th century by Vijayanagara rulers; fortified further by Hyder Ali in the late 18th century.', 'A testament to the shifting martial powers in South India, highlighting medieval defensive architecture, water harvesting on rocky terrain, and the era of the Anglo-Mysore Wars.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 1, 4.8, 180, 750, 'hill fort, vijayanagara, tipu sultan, bara mahal, military architecture, trekking',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'KRI'
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
  'KRISHNAGIRI_FORT',
  'krishnagiri, fort, syed basha hill, vijayanagara, tipu sultan, bara mahal, hill fort',
  'HISTORICAL_MONUMENTS',
  'KRI',
  'The Krishnagiri Fort, located on the Syed Basha Hill, is a 16th-century defensive structure originally built by the Vijayanagara Empire. It was a key military stronghold during the era of Tipu Sultan and the Anglo-Mysore wars.',
  'சையத் பாஷா மலையில் அமைந்துள்ள கிருஷ்ணகிரி கோட்டை 16-ஆம் நூற்றாண்டில் விஜயநகரப் பேரரசால் கட்டப்பட்டது. இது திப்பு சுல்தான் மற்றும் ஆங்கிலேய-மைசூர் போர்களின் போது ஒரு முக்கிய ராணுவத் தளமாக விளங்கியது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'krishnagiri-fort-and-syed-basha-hills'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
