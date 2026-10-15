-- ===================================================================
-- SEED SCRIPT: TIRUVANNAMALAI DISTRICT (TVM)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tiruvannamalai District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TVM', 'Tiruvannamalai', 'திருவண்ணாமலை', 'Northern', 12.2253, 79.0747,
  'A globally recognized spiritual destination centered around the Arunachala hill. It is the earthly abode of the Agni (Fire) element in Shaivism and the ashram of Sri Ramana Maharshi.'
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
  'arunachaleswarar-temple',
  'Arunachaleswarar Temple',
  'அருணாசலேஸ்வரர் கோயில்',
  'Annamalaiyar Temple, Thiruvannamalai Temple',
  'One of the Pancha Bhoota Stalams representing Fire (Agni), situated at the base of the sacred Annamalai hill, famous for the Karthigai Deepam festival.',
  'The Arunachaleswarar Temple is a colossal, 24-acre Dravidian temple complex dedicated to Lord Shiva, worshipped here as an Agni Lingam (element of Fire). The temple sits at the foot of the Arunachala hill, which itself is considered a manifestation of Shiva. It features four massive Gopurams, the eastern one being one of the tallest in India at 216 feet, built by Krishnadevaraya. The temple is world-famous for the ''Girivalam'' (circumambulation of the hill) during full moons and the spectacular ''Karthigai Deepam'', where a massive fire is lit atop the mountain.',
  c.id, d.id, 'Tiruvannamalai City', 12.2319, 79.0677,
  'HISTORICAL_FACT', 'Hindu',
  'Ancient origins; major expansions by the Chola, Hoysala, and Vijayanagara empires from the 9th to 16th centuries.', 'A global epicenter for Advaita Vedanta and Shaiva Siddhanta philosophies. The Karthigai Deepam is one of the oldest and largest continuous religious festivals in Tamil Nadu.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 190, 800, 'pancha bhoota stalam, agni, arunachala, girivalam, karthigai deepam, shiva',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'TVM'
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
  'ARUNACHALESWARAR_TEMPLE',
  'tiruvannamalai, arunachaleswarar, annamalaiyar, fire element, agni, girivalam, karthigai deepam, ramana maharshi',
  'HINDU_HERITAGE',
  'TVM',
  'The Arunachaleswarar Temple in Tiruvannamalai represents the Fire element (Agni). Located at the base of the sacred Arunachala hill, it is famous for the Girivalam (hill circumambulation) and the grand Karthigai Deepam festival.',
  'திருவண்ணாமலை அருணாசலேஸ்வரர் கோயில் பஞ்ச பூதத் தலங்களில் அக்னி (நெருப்பு) தலமாகும். அண்ணாமலையின் அடிவாரத்தில் அமைந்துள்ள இக்கோயில், பௌர்ணமி கிரிவலம் மற்றும் மலை உச்சியில் ஏற்றப்படும் கார்த்திகை மகா தீபத்திற்கு உலகப் புகழ் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'arunachaleswarar-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
