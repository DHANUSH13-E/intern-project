-- ===================================================================
-- SEED SCRIPT: THOOTHUKUDI DISTRICT (TUT)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Thoothukudi District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TUT', 'Thoothukudi', 'தூத்துக்குடி', 'Southern', 8.7642, 78.1348,
  'Known as the ''Pearl City'' due to its historic pearl fishing industry, this coastal district is an active major seaport and the site of significant archaeological finds like Adichanallur.'
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
  'kazhugumalai-vettuvan-koil-and-jain-beds',
  'Kazhugumalai Vettuvan Koil and Jain Beds',
  'கழுகுமலை வெட்டுவான் கோயில் மற்றும் சமணர் படுக்கைகள்',
  'Vettuvan Koil, Sculptor''s Paradise',
  'An 8th-century monolithic Pandya temple carved top-down from a single rock, accompanied by extensive rock-cut Jain bas-reliefs.',
  'Kazhugumalai is a remarkable archaeological site showcasing early Pandya rock-cut architecture. The centerpiece is the ''Vettuvan Koil'' (Temple of the Slayer), an unfinished monolithic Shiva temple carved entirely from the top down into a solid granite hillside, drawing comparisons to Ellora''s Kailasanatha temple. Just steps away are over 100 exquisite Jain rock-cut sculptures and stone beds dating back to the 8th and 9th centuries, highlighting a period of profound religious coexistence and artisanal mastery.',
  c.id, d.id, 'Kazhugumalai', 9.1419, 77.7126,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Hindu & Jain',
  'Commissioned by Pandya kings in the 8th century CE.', 'A rare architectural marvel demonstrating the ''top-down'' monolithic carving technique in South India, while serving as a vital record of Jainism''s influence in the Pandya kingdom.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 1, 4.8, 180, 750, 'monolithic, rock-cut, jain heritage, vettuvan koil, pandya architecture, sculpture',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'TUT'
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
  'KAZHUGUMALAI_MONUMENTS',
  'thoothukudi, kazhugumalai, vettuvan koil, jain beds, monolithic, pandya, rock cut',
  'HIDDEN_GEMS',
  'TUT',
  'Kazhugumalai in Thoothukudi district features the Vettuvan Koil, an 8th-century unfinished monolithic Shiva temple carved top-down from a single rock by the Pandyas, along with exquisite rock-cut Jain sculptures.',
  'தூத்துக்குடி மாவட்டத்தில் உள்ள கழுகுமலையில், பாண்டியர்களால் மலையை மேலிருந்து கீழாகக் குடைந்து உருவாக்கப்பட்ட 8-ஆம் நூற்றாண்டு ஒற்றைக்கல் சிவன்கோயிலான வெட்டுவான் கோயிலும், எண்ணற்ற சமணச் சிற்பங்களும் அமைந்துள்ளன.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'kazhugumalai-vettuvan-koil-and-jain-beds'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
