-- ===================================================================
-- SEED SCRIPT: THANJAVUR DISTRICT (TNJ)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Thanjavur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TNJ', 'Thanjavur', 'தஞ்சாவூர்', 'Central', 10.787, 79.1378,
  'Known as the ''Rice Bowl of Tamil Nadu'', Thanjavur is the cultural capital of the state. It was the paramount seat of the Chola Empire, leaving behind a legacy of monumental architecture, classical dance, and unique art forms.'
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
  'brihadisvara-temple-thanjavur',
  'Brihadisvara Temple, Thanjavur',
  'தஞ்சைப் பெரிய கோயில்',
  'Peruvudaiyar Kovil, Thanjavur Big Temple, Rajarajesvaram',
  'A majestic 11th-century Chola temple, widely considered the pinnacle of Dravidian architecture, featuring a massive vimana and exquisite frescoes.',
  'Completed in 1010 CE by Emperor Raja Raja Chola I, the Brihadisvara Temple is one of the greatest architectural achievements in Indian history. Part of the ''Great Living Chola Temples'' UNESCO World Heritage Site, it is entirely built of granite. The temple''s towering Vimana stands at 216 feet, topped by an 80-ton monolithic cupola (Kumbam). The complex houses a massive Nandi carved from a single rock, brilliant Chola frescoes, and extensive Tamil inscriptions detailing the empire''s administration, making it a living museum of early medieval South Indian culture.',
  c.id, d.id, 'Thanjavur City', 10.7828, 79.1318,
  'HISTORICAL_FACT', 'Hindu',
  'Built by Emperor Raja Raja Chola I in 1010 CE.', 'A defining symbol of Tamil identity and imperial Chola engineering. It fundamentally influenced Southeast Asian architecture and remains a vibrant center for Shaivite worship and classical arts.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'chola architecture, unesco, big temple, raja raja chola, granite, vimana',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'TNJ'
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
  'TEMPLE_THANJAVUR',
  'thanjavur, big temple, brihadisvara, raja raja chola, peruvudaiyar, unesco, chola, vimana',
  'HISTORICAL_MONUMENTS',
  'TNJ',
  'The Brihadisvara Temple (Big Temple) in Thanjavur was built by Raja Raja Chola I in 1010 CE. This UNESCO World Heritage site is a masterpiece of Dravidian architecture, renowned for its 216-foot tall granite Vimana and massive monolithic Nandi.',
  'தஞ்சைப் பெரிய கோயில் (பிரகதீஸ்வரர் கோயில்) கி.பி. 1010-இல் ராஜராஜ சோழனால் கட்டப்பட்டது. யுனெஸ்கோ உலகப் பாரம்பரிய தளமான இது, 216 அடி உயர கருங்கல் விமானத்திற்கும், பிரம்மாண்டமான நந்தி சிலைக்கும் பெயர் பெற்ற திராவிடக் கட்டிடக்கலையின் உச்சமாகும்.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'brihadisvara-temple-thanjavur'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
