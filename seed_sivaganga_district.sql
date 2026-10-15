-- ===================================================================
-- SEED SCRIPT: SIVAGANGA DISTRICT (SVG)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Sivaganga District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'SVG', 'Sivaganga', 'சிவகங்கை', 'Southern', 9.8433, 78.4809,
  'The heartland of Chettinad culture, Sivaganga is distinguished by its palatial mansions, fiery culinary heritage, and groundbreaking archaeological discoveries that push back the antiquity of the Sangam era.'
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
  'keeladi-excavations-sangam-era-civilization',
  'Keeladi Excavations - Sangam Era Civilization',
  'கீழடி அகழாய்வு - சங்க கால நாகரிகம்',
  'Keezhadi Archaeological Site',
  'An ongoing archaeological excavation on the banks of the Vaigai river revealing an advanced urban, literate Sangam-era settlement dating back to the 6th century BCE.',
  'Located along the Vaigai river, Keeladi is a watershed archaeological site that has profoundly reshaped the understanding of South Indian history. Excavations have unearthed a thriving, secular, and literate urban civilization dating as far back as 580 BCE. Findings include advanced brick structures, closed drainage systems, ring wells, exquisite pottery with Tamil-Brahmi inscriptions, weaving tools, and carnelian beads indicating trade with Rome and the Indus Valley. It provides hard evidence for the urbanized nature of the classical Sangam period.',
  c.id, d.id, 'Keeladi', 9.8617, 78.1969,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Secular / Ancient Tamil',
  'Carbon dated to the 6th century BCE, active during the Sangam period.', 'Bridges the historical gap between the Indus Valley Civilization and the Sangam era, proving that a literate, industrialized urban society existed in Tamil Nadu over 2600 years ago.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'archaeology, keeladi, sangam era, vaigai, tamil brahmi, urbanization',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'SVG'
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
  'KEELADI_EXCAVATION',
  'sivaganga, keeladi, keezhadi, archaeology, sangam, vaigai, tamil brahmi, excavations',
  'ARCHAEOLOGICAL_INSCRIPTIONS',
  'SVG',
  'Keeladi in Sivaganga district is an ancient archaeological site on the Vaigai river. Excavations have revealed a highly advanced, literate Sangam-era urban civilization dating back to 580 BCE, featuring Tamil-Brahmi inscribed pottery and brick structures.',
  'சிவகங்கை மாவட்டத்தில் வைகை ஆற்றங்கரையில் அமைந்துள்ள கீழடி அகழாய்வு, சங்க காலத் தமிழர்களின் வளமான நாகரிகத்தை வெளிப்படுத்தியுள்ளது. இங்கு கி.மு. 6-ஆம் நூற்றாண்டைச் சேர்ந்த தமிழ் பிராமி எழுத்துக்கள், செங்கல் கட்டிடங்கள் மற்றும் நகர நாகரிகத்தின் சான்றுகள் கிடைத்துள்ளன.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'keeladi-excavations-sangam-era-civilization'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
