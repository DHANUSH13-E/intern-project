-- ===================================================================
-- SEED SCRIPT: NAMAKKAL DISTRICT (NAM)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Namakkal District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'NAM', 'Namakkal', 'நாமக்கல்', 'Western', 11.2189, 78.1674,
  'Known as the ''Transport and Poultry Hub'' of Tamil Nadu, Namakkal is geographically distinguished by a massive monolithic rock at its center, topped with a historic fort and ancient rock-cut cave temples.'
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
  'namakkal-anjaneyar-temple-and-rock-fort',
  'Namakkal Anjaneyar Temple and Rock Fort',
  'நாமக்கல் ஆஞ்சநேயர் கோயில் மற்றும் மலைக்கோட்டை',
  'Namakkal Hanuman Temple, Namakkal Fort',
  'An 18-foot monolithic statue of Lord Hanuman standing open to the sky, facing the ancient Narasimhaswamy rock-cut temple beneath a 17th-century hill fort.',
  'The Namakkal Anjaneyar Temple features an awe-inspiring 18-foot tall monolithic statue of Lord Hanuman, carved from a single piece of stone, uniquely situated without a roof. According to legend, Hanuman was carrying the Sanjeevani hill and stopped here, dropping a piece that became the massive 65-meter high Namakkal rock. Directly facing Hanuman is the Pallava-era rock-cut Narasimhaswamy temple. Atop the rock sits a fort built by the Madurai Nayaks, later utilized by Hyder Ali and Tipu Sultan.',
  c.id, d.id, 'Namakkal Town', 11.2223, 78.167,
  'HISTORICAL_FACT', 'Hindu',
  'Cave temples date to the 8th century Pallava/Adhiyaman period; Fort built by Nayaks in the 17th century.', 'A rare confluence of 8th-century rock-cut architecture, open-air colossal religious sculpture, and medieval military fortifications, dominating the district''s cultural landscape.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'hanuman, anjaneyar, rock fort, monolith, pallava architecture, nayak fort',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'NAM'
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
  'NAMAKKAL_ANJANEYAR_FORT',
  'namakkal, anjaneyar, hanuman temple, rock fort, narasimhaswamy, monolith, open sky',
  'HINDU_HERITAGE',
  'NAM',
  'The Namakkal Anjaneyar Temple features an 18-foot monolithic statue of Lord Hanuman that stands without a roof. It faces the 8th-century rock-cut Narasimhaswamy temple, located at the base of the historic Namakkal Rock Fort.',
  'நாமக்கல் ஆஞ்சநேயர் கோயிலில் கூரையில்லாமல் திறந்தவெளியில் அமைந்துள்ள 18 அடி உயர ஒற்றைக்கல் ஆஞ்சநேயர் சிலை புகழ்பெற்றது. இது வரலாற்று சிறப்புமிக்க நாமக்கல் மலைக்கோட்டையின் அடிவாரத்தில் உள்ள நரசிம்மசுவாமி குடைவரைக் கோயிலை நோக்கி அமைந்துள்ளது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'namakkal-anjaneyar-temple-and-rock-fort'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
