-- ===================================================================
-- SEED SCRIPT: RAMANATHAPURAM DISTRICT (RAM)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Ramanathapuram District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'RAM', 'Ramanathapuram', 'ராமநாதபுரம்', 'Southern', 9.3626, 78.8354,
  'A coastal district that serves as the gateway to Rameswaram. Historically ruled by the Sethupathi kings, it is famous for its sacred pilgrimage sites, coral reefs in the Gulf of Mannar, and the Pamban Bridge.'
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
  'ramanathaswamy-temple-rameswaram',
  'Ramanathaswamy Temple, Rameswaram',
  'ராமநாதசுவாமி கோயில், ராமேஸ்வரம்',
  'Rameswaram Jyotirlinga',
  'One of the Char Dham pilgrimage sites and a Jyotirlinga, world-renowned for its magnificent pillared corridors which are the longest in the world.',
  'Located on Pamban Island, the Ramanathaswamy Temple is one of the holiest shrines in Hinduism, intimately connected to the Ramayana. Legend states that the Shivalingam here was established by Lord Rama to absolve himself of the sin of defeating Ravana. The temple is an architectural marvel of the Dravidian style, most famous for its stunning outer corridor (Prakaram)—the longest in the world, stretching over 1.2 kilometers and featuring thousands of intricately carved pillars gracefully painted and aligned in breathtaking symmetry.',
  c.id, d.id, 'Rameswaram', 9.2881, 79.3174,
  'HISTORICAL_FACT', 'Hindu',
  'Original sanctum linked to epic antiquity; massive corridors expanded by the Sethupathi kings of Ramanathapuram in the 17th century.', 'A paramount pilgrimage destination bringing together Shaivite and Vaishnavite traditions. Its architectural scale represents the zenith of royal Sethupathi patronage.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'jyotirlinga, char dham, rameswaram, corridor, lord rama, sethupathi',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'RAM'
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
  'RAMANATHASWAMY_RAMESWARAM',
  'ramanathapuram, rameswaram, ramanathaswamy, jyotirlinga, longest corridor, char dham, lord rama',
  'HINDU_HERITAGE',
  'RAM',
  'The Ramanathaswamy Temple in Rameswaram is a Jyotirlinga and Char Dham site. According to legend, the Lingam was installed by Lord Rama. It is architecturally world-famous for possessing the longest temple corridor in the world.',
  'ராமேஸ்வரத்தில் உள்ள ராமநாதசுவாமி கோயில் ஜோதிர்லிங்கத் தலங்களில் ஒன்றாகும். ஸ்ரீ ராமர் இங்கு சிவலிங்கத்தை பிரதிஷ்டை செய்ததாகப் புராணங்கள் கூறுகின்றன. இக்கோயிலின் பிரகாரம் (தாழ்வாரம்) உலகின் மிக நீளமான கோயில் பிரகாரமாக உலகப் புகழ் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'ramanathaswamy-temple-rameswaram'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
