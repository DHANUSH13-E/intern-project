-- ===================================================================
-- SEED SCRIPT: TIRUCHIRAPPALLI DISTRICT (TRC)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tiruchirappalli District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TRC', 'Tiruchirappalli', 'திருச்சிராப்பள்ளி', 'Central', 10.7905, 78.7047,
  'Centered geographically in Tamil Nadu, ''Trichy'' is dominated by its iconic Rockfort, divided by the Kaveri river, and is home to the world''s largest functioning Hindu temple in Srirangam.'
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
  'sri-ranganathaswamy-temple-srirangam',
  'Sri Ranganathaswamy Temple, Srirangam',
  'ஸ்ரீ ரங்கநாதசுவாமி கோயில், ஸ்ரீரங்கம்',
  'Srirangam Temple, Thiruvarangam',
  'The largest functioning Hindu temple in the world, spanning 156 acres on a river island, dedicated to Lord Vishnu resting on the serpent Adisesha.',
  'Located on a picturesque island formed by the Kaveri and Kollidam rivers, the Sri Ranganathaswamy Temple is the foremost of the 108 Divya Desams (sacred Vishnu temples). Encompassing 156 acres, it is the largest functioning religious complex globally. The temple features seven concentric rectangular enclosures (prakarams) with massive walls, and 21 stunning gopurams, the tallest being the Rajagopuram at 236 feet. It boasts a rich history enriched by the Cholas, Pandyas, Hoysalas, and Vijayanagara empires, acting as the spiritual heart of the Sri Vaishnava community.',
  c.id, d.id, 'Srirangam, Trichy', 10.8623, 78.6872,
  'HISTORICAL_FACT', 'Hindu - Vaishnavite',
  'Ancient origins mentioned in Sangam literature; current sprawling layout developed between the 9th and 16th centuries.', 'The spiritual headquarters of Sri Vaishnavism, central to the philosophy of Ramanuja. It represents the ultimate fusion of town planning, temple architecture, and living religious tradition in South India.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'vishnu, divya desam, srirangam, rajagopuram, kaveri, largest temple',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'TRC'
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
  'SRIRANGAM_TEMPLE',
  'trichy, tiruchirappalli, srirangam, ranganathaswamy, vishnu, largest temple, rajagopuram, divya desam',
  'HINDU_HERITAGE',
  'TRC',
  'The Sri Ranganathaswamy Temple in Srirangam, Trichy, is the largest functioning Hindu temple in the world. Situated on an island in the Kaveri river, it boasts seven concentric enclosures and a 236-foot tall Rajagopuram.',
  'திருச்சிராப்பள்ளி ஸ்ரீரங்கத்தில் அமைந்துள்ள ஸ்ரீ ரங்கநாதசுவாமி கோயில், உலகின் மிகப் பெரிய செயல்படும் இந்து கோயிலாகும். காவேரி ஆற்றின் நடுவே அமைந்துள்ள இக்கோயில் ஏழு பிரகாரங்களையும், 236 அடி உயர ராஜகோபுரத்தையும் கொண்டுள்ளது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'sri-ranganathaswamy-temple-srirangam'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
