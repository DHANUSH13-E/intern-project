-- ===================================================================
-- SEED SCRIPT: THE NILGIRIS DISTRICT (NIL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure The Nilgiris District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'NIL', 'The Nilgiris', 'நீலகிரி', 'Western', 11.41, 76.69,
  'Meaning ''Blue Mountains'', this district is nested in the Western Ghats. It is globally acclaimed for its sprawling tea estates, unique indigenous tribes like the Todas, and colonial-era hill station architecture.'
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
  'nilgiri-mountain-railway',
  'Nilgiri Mountain Railway',
  'நீலகிரி மலை இரயில்வே',
  'Ooty Toy Train, NMR',
  'A UNESCO World Heritage narrow-gauge railway built by the British, operating on a unique rack and pinion system through the steep mountains.',
  'Constructed between 1891 and 1908 by the British, the Nilgiri Mountain Railway (NMR) connects Mettupalayam to Udhagamandalam (Ooty). Spanning 46 kilometers, it is the only rack railway in India. The train uses the ''Abt rack and pinion'' system to climb the steep gradients of the Western Ghats, being pushed by historic Swiss-built steam locomotives. The journey crosses over 250 bridges and through 16 tunnels, offering unparalleled views of tea estates, dense shola forests, and rocky terrains.',
  c.id, d.id, 'Ooty / Mettupalayam', 11.3396, 76.7909,
  'HISTORICAL_FACT', 'Secular / Industrial Heritage',
  'Conceived in 1854, construction began in 1891 and was completed in 1908 by the British Raj.', 'Recognized as a UNESCO World Heritage Site (Mountain Railways of India), it is a marvel of late 19th-century engineering that preserved the ecological aesthetics of the Nilgiris.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'unesco, toy train, railway, ooty, colonial engineering, western ghats',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'NIL'
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
  'NILGIRI_MOUNTAIN_RAILWAY',
  'nilgiris, ooty, toy train, mountain railway, nmr, unesco, rack and pinion, mettupalayam',
  'HISTORICAL_MONUMENTS',
  'NIL',
  'The Nilgiri Mountain Railway, affectionately known as the Ooty Toy Train, is a UNESCO World Heritage site. Built in 1908, it is the only rack and pinion railway in India, using steam locomotives to climb the steep Western Ghats.',
  'ஊட்டி பொம்மை ரயில் என அழைக்கப்படும் நீலகிரி மலை இரயில்வே, யுனெஸ்கோ உலகப் பாரம்பரிய தளமாகும். 1908-ஆம் ஆண்டு கட்டப்பட்ட இது, இந்தியாவில் உள்ள ஒரே ''ராக் அண்ட் பினியன்'' (பற்சக்கர) ரயில் அமைப்பாகும். இது நீலகிரியின் செங்குத்தான மலைகளில் பயணிக்கிறது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'nilgiri-mountain-railway'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
