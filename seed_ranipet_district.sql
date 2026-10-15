-- ===================================================================
-- SEED SCRIPT: RANIPET DISTRICT (RPT)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Ranipet District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'RPT', 'Ranipet', 'ராணிப்பேட்டை', 'Northern', 12.9272, 79.333,
  'Carved out of Vellore, Ranipet was established by the Nawab of Carnatic in honor of the youthful widow of Desingh Raja of Gingee. It is rich in Islamic heritage and is a major industrial hub for leather and ceramics.'
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
  'arcot-delhi-gate',
  'Arcot Delhi Gate',
  'ஆற்காடு டெல்லி கேட்',
  'Nawab''s Fort Gate',
  'The monumental entrance and surviving remnant of the historic Arcot Fort, famously associated with Robert Clive''s 1751 Siege of Arcot.',
  'The Arcot Delhi Gate is the prominent surviving structure of the once-massive Arcot Fort, the capital of the Nawabs of the Carnatic. The gate earned its name ''Delhi Gate'' because it marked the beginning of the route from Arcot to Delhi, emphasizing the Nawab''s allegiance to the Mughal Emperor. This site is etched in global military history due to the 1751 ''Siege of Arcot'', where a small British East India Company force led by Robert Clive famously defended the fort against the much larger forces of Chanda Sahib, turning the tide of the Carnatic Wars.',
  c.id, d.id, 'Arcot', 12.9066, 79.3314,
  'HISTORICAL_FACT', 'Islamic / Secular Military',
  'Fortified in the 18th century by the Nawabs of Carnatic under the Mughal Empire.', 'A critical monument symbolizing the geopolitical struggles of the 18th century in South India, the decline of the Nawab era, and the ascendance of British colonial power.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 0, 4.8, 180, 750, 'arcot, delhi gate, nawab of carnatic, robert clive, carnatic wars, ranipet',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'RPT'
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
  'ARCOT_DELHI_GATE',
  'ranipet, arcot, delhi gate, nawab, carnatic wars, siege of arcot, robert clive',
  'HISTORICAL_MONUMENTS',
  'RPT',
  'The Arcot Delhi Gate in Ranipet district is the remnant of the capital fort of the Nawabs of Carnatic. It is historically famous for the 1751 Siege of Arcot, where Robert Clive''s defense altered the course of the Carnatic Wars.',
  'ராணிப்பேட்டை மாவட்டத்தில் உள்ள ஆற்காடு டெல்லி கேட், கர்நாடக நவாப்களின் தலைநகரக் கோட்டையின் எஞ்சிய பகுதியாகும். 1751-இல் ராபர்ட் கிளைவ் தலைமையிலான ஆங்கிலேயப் படையினர் முற்றுகையை முறியடித்த புகழ்பெற்ற ''ஆற்காடு முற்றுகை'' இங்குதான் நடைபெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'arcot-delhi-gate'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
