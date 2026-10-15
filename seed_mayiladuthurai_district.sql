-- ===================================================================
-- SEED SCRIPT: MAYILADUTHURAI DISTRICT (MAY)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Mayiladuthurai District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'MAY', 'Mayiladuthurai', 'மயிலாடுதுறை', 'Central', 11.1085, 79.6588,
  'A culturally rich district formed from the Kaveri delta, famous for the ancient port city of Poompuhar, the historic Navagraha temples, and the unique Danish colonial settlement in Tharangambadi.'
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
  'fort-dansborg-tharangambadi',
  'Fort Dansborg, Tharangambadi',
  'டேனிஷ் கோட்டை, தரங்கம்பாடி',
  'Danish Fort, Tranquebar Fort',
  'A 17th-century Danish fort situated on the shores of the Bay of Bengal, reflecting a unique blend of Scandinavian military architecture in South India.',
  'Constructed in 1620 CE by the Danish Admiral Ove Gjedde with the permission of the Raghunatha Nayak of Tanjore, Fort Dansborg served as the base for the Danish East India Company. Tharangambadi (meaning ''Place of the Singing Waves'') became a bustling trading post and the site where the first printing press in India was established by Bartholomaeus Ziegenbalg. The fort features massive stone walls, vaulted brick ceilings, and colonial-era cannons, standing as the second largest Danish fort in the world after Kronborg.',
  c.id, d.id, 'Tharangambadi', 11.028, 79.854,
  'HISTORICAL_FACT', 'Secular / Colonial Heritage',
  'Built in 1620 CE by Danish colonizers following a treaty with the Thanjavur Nayak kingdom.', 'A rare surviving remnant of Danish colonial history in India. It also marks the birthplace of Tamil print media, where the New Testament was first printed in Tamil in 1715.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'danish fort, colonial architecture, tranquebar, tharangambadi, printing press, bay of bengal',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'MAY'
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
  'FORT_DANSBORG_TRANQUEBAR',
  'mayiladuthurai, tharangambadi, tranquebar, danish fort, dansborg, printing press, colonial',
  'HISTORICAL_MONUMENTS',
  'MAY',
  'Fort Dansborg in Tharangambadi (Tranquebar) is a 17th-century Danish fort. It was the headquarters of the Danish East India Company and is historically significant as the site of India''s first printing press.',
  'மயிலாடுதுறை மாவட்டம் தரங்கம்பாடியில் உள்ள டேனிஷ் கோட்டை 17-ஆம் நூற்றாண்டில் கட்டப்பட்டது. இது இந்தியாவில் டேனிஷ் காலனித்துவத்தின் மையமாகவும், இந்தியாவின் முதல் அச்சு இயந்திரம் நிறுவப்பட்ட இடமாகவும் திகழ்கிறது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'fort-dansborg-tharangambadi'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
