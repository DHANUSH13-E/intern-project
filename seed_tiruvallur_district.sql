-- ===================================================================
-- SEED SCRIPT: TIRUVALLUR DISTRICT (TVL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tiruvallur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TVL', 'Tiruvallur', 'திருவள்ளூர்', 'Northern', 13.1417, 79.9071,
  'A rapidly industrializing district neighboring Chennai, featuring the historic Veeraraghava Swamy Temple, the Poondi reservoir, and the ecologically critical Pulicat Lake.'
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
  'pulicat-lake-and-dutch-heritage',
  'Pulicat Lake and Dutch Heritage',
  'பழவேற்காடு ஏரி மற்றும் டச்சு மரபு',
  'Pazhaverkadu, Pulicat Lagoon',
  'The second largest brackish water lagoon in India, famous for its flamingo sanctuary and 17th-century Dutch colonial ruins.',
  'Pulicat (Pazhaverkadu) is an ecologically and historically vital town on the Coromandel Coast. The Pulicat Lake is the second-largest brackish water lagoon in India and serves as a major wintering ground for migratory birds, most notably thousands of Greater Flamingos. Historically, it was the most important settlement of the Dutch East India Company in India during the 17th century. The town still houses a well-preserved Dutch cemetery with intricately carved tombstones dating back to 1622, and the ruins of Fort Geldria.',
  c.id, d.id, 'Pulicat', 13.4182, 80.3188,
  'HISTORICAL_FACT', 'Secular / Colonial Heritage',
  'Natural lagoon; Fort Geldria built by the Dutch in 1613 CE.', 'A unique intersection of rich ecological biodiversity and early European colonial history in India, pre-dating British dominance in the region.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 1, 4.8, 190, 800, 'pulicat, lagoon, dutch heritage, flamingos, cemetery, colonial',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'TVL'
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
  'PULICAT_LAKE_DUTCH',
  'tiruvallur, pulicat, pazhaverkadu, lake, flamingo, dutch cemetery, fort geldria, lagoon',
  'ARCHAEOLOGICAL_INSCRIPTIONS',
  'TVL',
  'Pulicat (Pazhaverkadu) in Tiruvallur is the second largest brackish water lagoon in India, famous for migrating flamingos. It also holds significant colonial history, featuring a 17th-century Dutch cemetery and the ruins of Fort Geldria.',
  'திருவள்ளூர் மாவட்டத்தில் உள்ள பழவேற்காடு (புலிகாட்), இந்தியாவின் இரண்டாவது மிகப்பெரிய உவர்நீர் ஏரியாகும். இங்கு வலசை வரும் பூநாரைகளும் (Flamingos), 17-ஆம் நூற்றாண்டைச் சேர்ந்த டச்சுக்காரர்களின் கல்லறைகளும், கெல்டிரியா கோட்டையின் இடிபாடுகளும் அமைந்துள்ளன.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'pulicat-lake-and-dutch-heritage'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
