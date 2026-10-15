-- ===================================================================
-- SEED SCRIPT: MADURAI DISTRICT (MDU)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Madurai District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'MDU', 'Madurai', 'மதுரை', 'Southern', 9.9252, 78.1198,
  'One of the oldest continuously inhabited cities in the world, the ''Athens of the East''. Madurai was the seat of the Pandya dynasty, the home of the Tamil Sangams, and revolves around the magnificent Meenakshi Amman Temple.'
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
  'thirumalai-nayakkar-mahal',
  'Thirumalai Nayakkar Mahal',
  'திருமலை நாயக்கர் மகால்',
  'Nayakkar Palace, Madurai Mahal',
  'A grand 17th-century palace blending Dravidian and Rajput architectural styles, famous for its massive stucco-covered pillars and sweeping arches.',
  'Erected in 1636 CE by King Thirumalai Nayak, this palace is a classic fusion of Dravidian and Rajput architectural styles with Islamic influences (Indo-Saracenic). Originally four times larger than what remains today, its surviving courtyard (Swarga Vilasam) is celebrated for its colossal circular pillars, which are 82 feet high and 19 feet wide, coated in a smooth finish of ''chunam'' (shell lime, egg white, and jaggery). The palace reflects the zenith of the Madurai Nayak dynasty''s wealth and patronage of the arts.',
  c.id, d.id, 'Madurai City', 9.9148, 78.1235,
  'HISTORICAL_FACT', 'Secular / Royal Heritage',
  'Designed by an Italian architect for King Thirumalai Nayak in 1636 CE.', 'A premier example of secular Nayak architecture in South India, illustrating cultural cross-pollination between Southern empires, Northern Rajput styles, and European architectural techniques.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'palace, nayak dynasty, indo-saracenic, pillars, madurai, heritage',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'MDU'
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
  'THIRUMALAI_NAYAKKAR_MAHAL',
  'madurai, thirumalai nayakkar mahal, palace, nayak dynasty, pillars, swarga vilasam, architecture',
  'ARCHITECTURE_SCULPTURE',
  'MDU',
  'The Thirumalai Nayakkar Mahal in Madurai is a 17th-century palace built by King Thirumalai Nayak. It is renowned for its Indo-Saracenic architecture, featuring massive circular pillars and a stunning central courtyard.',
  'மதுரையில் உள்ள திருமலை நாயக்கர் மகால், 17-ஆம் நூற்றாண்டில் மன்னர் திருமலை நாயக்கரால் கட்டப்பட்டது. பிரம்மாண்டமான தூண்களையும், திராவிட மற்றும் ராஜபுத்திர கட்டிடக்கலை கலவையையும் கொண்ட இந்த அரண்மனை மிகவும் புகழ் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'thirumalai-nayakkar-mahal'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
