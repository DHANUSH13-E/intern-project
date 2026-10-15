-- ===================================================================
-- SEED SCRIPT: TIRUVARUR DISTRICT (TVR)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tiruvarur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TVR', 'Tiruvarur', 'திருவாரூர்', 'Central', 10.7661, 79.6388,
  'Nestled in the Kaveri delta, Tiruvarur is deeply associated with Chola royalty, the legendary justice of King Manu Needhi Cholan, and classical Carnatic music''s Trinity.'
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
  'thyagaraja-temple-and-azhi-ther',
  'Thyagaraja Temple and Azhi Ther',
  'தியாகராஜர் கோயில் மற்றும் ஆழித் தேர்',
  'Tiruvarur Temple, Kamalambal Temple',
  'An ancient, massive Shiva temple complex famous for the ''Kamalalayam'' temple tank and the colossal wooden temple car, the ''Azhi Ther''.',
  'The Thyagaraja Temple is one of the most ancient and largest temple complexes in India. Dedicated to Lord Shiva (represented as Somaskanda), it serves as the primary seat of the Sapta Vidangam shrines. The temple is intrinsically linked to Carnatic music, being the birthplace of the Music Trinity (Tyagaraja, Muthuswami Dikshitar, and Syama Sastri). The temple''s tank, ''Kamalalayam'', is one of the largest in the country. Its annual chariot festival features the ''Azhi Ther'', the largest and heaviest wooden temple car in Asia, weighing over 300 tons and standing 96 feet tall.',
  c.id, d.id, 'Tiruvarur Town', 10.7735, 79.6378,
  'HISTORICAL_FACT', 'Hindu',
  'Praised in 7th-century Tevaram hymns; massively expanded by the Imperial Cholas.', 'A cornerstone of Tamil cultural history, blending Agamic worship, massive mechanical engineering (temple car), and the foundational evolution of classical Carnatic music.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 190, 800, 'azhi ther, carnatic music, kamalalayam, chola, temple car, thyagaraja',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'TVR'
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
  'THYAGARAJA_AZHI_THER',
  'tiruvarur, thyagaraja, azhi ther, temple car, kamalalayam, carnatic music, trinity, somaskanda',
  'HINDU_HERITAGE',
  'TVR',
  'The Thyagaraja Temple in Tiruvarur is famous for the ''Kamalalayam'' tank and the ''Azhi Ther'', the largest wooden temple car in Asia. Tiruvarur is also the birthplace of the Carnatic music Trinity.',
  'திருவாரூர் தியாகராஜர் கோயில், பிரம்மாண்டமான கமலாலயக் குளத்திற்கும், ஆசியாவிலேயே மிகப்பெரிய மரத் தேரான ''ஆழித் தேருக்கும்'' பெயர் பெற்றது. மேலும் இவ்வூர் கர்நாடக சங்கீத மும்மூர்த்திகள் அவதரித்த பெருமையைக் கொண்டது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'thyagaraja-temple-and-azhi-ther'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
