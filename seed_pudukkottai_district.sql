-- ===================================================================
-- SEED SCRIPT: PUDUKKOTTAI DISTRICT (PDK)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Pudukkottai District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'PDK', 'Pudukkottai', 'புதுக்கோட்டை', 'Central', 10.3797, 78.8208,
  'Formerly a princely state, Pudukkottai is an archaeological treasure trove featuring Jain cave frescoes, early Chola structural temples, and megalithic burial sites.'
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
  'thirumayam-fort-and-cave-temples',
  'Thirumayam Fort and Cave Temples',
  'திருமயம் கோட்டை மற்றும் குடைவரைக் கோயில்கள்',
  'Oomayan Kottai',
  'A massive 17th-century rock fort known for its association with the Polygar Wars, surrounded by two ancient rock-cut cave temples dedicated to Shiva and Vishnu.',
  'Constructed in 1687 CE by Sethupathi Vijaya Raghunatha Tevan of Ramanathapuram, the Thirumayam Fort is of immense historical importance. It is locally known as ''Oomayan Kottai'' because Oomathurai, the deaf-mute brother of the legendary freedom fighter Veerapandiya Kattabomman, was captured here by the British. At the foot of the fort rock lie two stunning Pallava/Pandya era rock-cut cave temples (7th-8th century): the Satyagirisathar (Shiva) temple and the Sathyamurthi Perumal (Vishnu) temple, showcasing remarkable early Dravidian rock-cut architecture.',
  c.id, d.id, 'Thirumayam', 10.2452, 78.7516,
  'HISTORICAL_FACT', 'Hindu / Secular Military',
  'Cave temples carved in the 7th/8th centuries; Fort built in 1687 CE by Sethupathi kings.', 'A unique site integrating early rock-cut religious shrines with late-medieval military fortifications. It symbolizes the fierce resistance of Tamil chieftains (Polygars) against British colonial rule.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'thirumayam, oomathurai, rock fort, cave temples, polygar wars, sethupathi',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'PDK'
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
  'THIRUMAYAM_FORT_CAVES',
  'pudukkottai, thirumayam, fort, oomathurai, cave temple, sethupathi, kattabomman, rock cut',
  'HISTORICAL_MONUMENTS',
  'PDK',
  'Thirumayam Fort in Pudukkottai is a 17th-century stronghold associated with freedom fighter Oomathurai. It sits atop a hill that houses two ancient 8th-century rock-cut cave temples dedicated to Lord Shiva and Lord Vishnu.',
  'புதுக்கோட்டையில் உள்ள திருமயம் கோட்டை 17-ஆம் நூற்றாண்டில் கட்டப்பட்டது. இது சுதந்திரப் போராட்ட வீரர் ஊமைத்துரையுடன் தொடர்புடையது. இக்கோட்டை அமைந்துள்ள மலையின் அடிவாரத்தில் 8-ஆம் நூற்றாண்டைச் சேர்ந்த பழமையான சிவன் மற்றும் விஷ்ணு குடைவரைக் கோயில்கள் உள்ளன.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'thirumayam-fort-and-cave-temples'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
