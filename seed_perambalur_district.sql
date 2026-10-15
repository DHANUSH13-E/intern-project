-- ===================================================================
-- SEED SCRIPT: PERAMBALUR DISTRICT (PBL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Perambalur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'PBL', 'Perambalur', 'பெரம்பலூர்', 'Central', 11.2342, 78.8821,
  'Located in the central part of Tamil Nadu, Perambalur is an agrarian district rich in paleontology—famous for its ancient marine fossils and the historic Ranjankudi Fort.'
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
  'ranjankudi-fort',
  'Ranjankudi Fort',
  'ரஞ்சன்குடி கோட்டை',
  'Nawab''s Fort, Ranjankudi Kottai',
  'A 17th-century fortress built by the Jagirdar of the Nawab of Carnatic, showcasing exquisite Islamic military architecture.',
  'Built in the 17th century by a Jagirdar under the Nawab of Carnatic, Ranjankudi Fort is a remarkable example of Islamic military architecture in Tamil Nadu. The fort features three defensive tiers—a lower tier, a middle tier, and the citadel—constructed with cut stone blocks. It includes semi-circular bastions, a moat, a palace area, underground chambers, and a mosque. The fort was the site of the pivotal Battle of Valikondah in 1751 during the Carnatic Wars between the British and the French.',
  c.id, d.id, 'Ranjankudi', 11.3259, 78.9329,
  'HISTORICAL_FACT', 'Islamic / Secular Military',
  'Constructed in the 17th century during the rule of the Nawabs of Carnatic.', 'A crucial military monument that played a significant role in the Second Carnatic War, illustrating the era''s sophisticated defensive architecture and water management systems.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 1, 4.8, 180, 750, 'fort, carnatic wars, nawab, ranjankudi, military architecture, islamic heritage',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'PBL'
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
  'RANJANKUDI_FORT',
  'perambalur, ranjankudi, fort, nawab of carnatic, battle of valikondah, islamic architecture',
  'HISTORICAL_MONUMENTS',
  'PBL',
  'The Ranjankudi Fort in Perambalur district is a 17th-century fortress built by the Nawabs of Carnatic. It is famous for its three-tiered defensive architecture and its historical role in the Carnatic Wars of 1751.',
  'பெரம்பலூர் மாவட்டத்தில் உள்ள ரஞ்சன்குடி கோட்டை 17-ஆம் நூற்றாண்டில் கர்நாடக நவாப்களால் கட்டப்பட்டது. இது மூன்று அடுக்கு பாதுகாப்பு கட்டமைப்புகளையும், 1751 கர்நாடகப் போரில் முக்கியப் பங்காற்றிய வரலாற்றையும் கொண்டது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'ranjankudi-fort'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
