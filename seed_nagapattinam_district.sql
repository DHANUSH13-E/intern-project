-- ===================================================================
-- SEED SCRIPT: NAGAPATTINAM DISTRICT (NGP)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Nagapattinam District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'NGP', 'Nagapattinam', 'நாகப்பட்டினம்', 'Central', 10.7656, 79.8424,
  'A prominent coastal district known for its deep-rooted religious harmony, housing the Velankanni Church, Nagore Dargah, and ancient Chola era ports, alongside the rich biodiversity of Point Calimere.'
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
  'point-calimere-and-chola-lighthouse',
  'Point Calimere and Chola Lighthouse',
  'கோடியக்கரை மற்றும் சோழர் கால கலங்கரை விளக்கம்',
  'Kodiakkarai, Chola Lighthouse',
  'A coastal headland featuring a wildlife sanctuary and the ruins of an ancient brick lighthouse built during the Chola dynasty.',
  'Located at the apex of the Kaveri delta, Point Calimere (Kodiakkarai) is renowned both for its ecological sanctuary—hosting migratory flamingos and the endangered blackbuck—and its profound historical footprint. The site features the remnants of an ancient brick lighthouse dating back to the reign of Raja Raja Chola I (approx. 1000 CE), which guided merchant ships trading with Southeast Asia. The area is also steeped in myth, believed to be the spot where Lord Rama scouted Sri Lanka.',
  c.id, d.id, 'Kodiakkarai', 10.2942, 79.8459,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Secular / Chola Maritime',
  'The lighthouse ruins date back to the 11th-century Chola period; the region has Sangam era maritime references.', 'Demonstrates the advanced maritime navigational infrastructure of the Chola Empire, blending rich biodiversity with medieval nautical archaeology.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 1, 4.8, 180, 750, 'chola empire, lighthouse, kodiakkarai, maritime history, wildlife, point calimere',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'NGP'
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
  'POINT_CALIMERE_CHOLA',
  'nagapattinam, kodiakkarai, point calimere, chola lighthouse, maritime, birds, raja raja chola',
  'ARCHAEOLOGICAL_INSCRIPTIONS',
  'NGP',
  'Point Calimere (Kodiakkarai) in Nagapattinam is famous for its wildlife sanctuary and the ruins of an ancient brick lighthouse built by the Chola dynasty around 1000 CE to guide maritime trade vessels.',
  'நாகப்பட்டினம் மாவட்டத்தில் உள்ள கோடியக்கரை, பறவைகள் சரணாலயத்திற்கும், சோழர் காலத்தில் (சுமார் கி.பி. 1000) வணிகக் கப்பல்களுக்கு வழிகாட்ட கட்டப்பட்ட பழமையான செங்கல் கலங்கரை விளக்கத்தின் இடிபாடுகளுக்கும் பெயர் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'point-calimere-and-chola-lighthouse'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
