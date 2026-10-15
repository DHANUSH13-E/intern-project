-- ===================================================================
-- SEED SCRIPT: KARUR DISTRICT (KAR)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Karur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'KAR', 'Karur', 'கரூர்', 'Central', 10.9596, 78.0766,
  'Situated on the banks of the Amaravathi river, Karur was the ancient capital of the early Chera kings of the Sangam era. Today, it is a major hub for home textile exports.'
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
  'kalyana-pasupatheeswarar-temple',
  'Kalyana Pasupatheeswarar Temple',
  'கல்யாண பசுபதீஸ்வரர் கோயில்',
  'Karur Pasupatheeswarar, Aanilaiappar Temple',
  'An ancient Shiva temple associated with the Chera dynasty and sung about by the Nayanmar poet-saints in the Tevaram.',
  'Considered the first of the seven sacred Shivalayams of the Kongu region (Kongu Nadu), the Kalyana Pasupatheeswarar Temple boasts a history deeply intertwined with the Sangam-era Chera kings. The presiding deity is a Swayambhu (self-manifested) Lingam slightly tilted to one side. According to legend, the divine cow Kamadhenu worshipped Shiva here, giving the deity the name ''Pasupatheeswarar'' (Lord of the Cow). It features a grand 5-tiered Rajagopuram and a unique 100-pillared hall.',
  c.id, d.id, 'Karur Town', 10.9619, 78.0772,
  'HISTORICAL_FACT', 'Hindu',
  'Believed to be established during the early Chera period; extensive structure developed by later Cholas and Pandyas.', 'A vital Paadal Petra Sthalam (temple sung in the Tevaram). The temple serves as the spiritual heart of the ancient Kongu Nadu region and stands as a testament to Chera era religious patronage.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 0, 4.8, 180, 750, 'chera dynasty, shiva temple, kongu nadu, pasupatheeswarar, tevaram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'KAR'
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
  'KARUR_PASUPATHEESWARAR',
  'karur, pasupatheeswarar, chera capital, aanilaiappar, kongu nadu, shiva temple, kamadhenu',
  'HINDU_HERITAGE',
  'KAR',
  'The Kalyana Pasupatheeswarar Temple in Karur was deeply associated with the ancient Chera kings. Legend states that the divine cow Kamadhenu worshipped Lord Shiva here, and it is a prominent temple in the Kongu Nadu region.',
  'கரூரில் உள்ள கல்யாண பசுபதீஸ்வரர் கோயில், சேர மன்னர்களுடன் தொடர்புடைய பழமையான சிவன்கோயில் ஆகும். காமதேனு இங்கு சிவனை வழிபட்டதாகப் புராணங்கள் கூறுகின்றன. இது கொங்கு நாட்டின் மிக முக்கியமான திருத்தலமாகும்.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'kalyana-pasupatheeswarar-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
