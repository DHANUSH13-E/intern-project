-- ===================================================================
-- SEED SCRIPT: TIRUPUR DISTRICT (TUP)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Tirupur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'TUP', 'Tirupur', 'திருப்பூர்', 'Western', 11.1085, 77.3411,
  'Known globally as the ''Knitwear Capital of India'', Tirupur is situated on the banks of the Noyyal river and holds deep historical ties to the Kongu Nadu region and ancient Chola trade.'
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
  'thirumuruganpoondi-temple',
  'Thirumuruganpoondi Temple',
  'திருமுருகன்பூண்டி கோயில்',
  'Muruganatheswarar Temple',
  'A 9th-century Paadal Petra Sthalam where Lord Murugan is said to have worshipped Lord Shiva to atone for killing the demon Surapadman.',
  'The Muruganatheswarar Temple at Thirumuruganpoondi is an ancient shrine revered in the Tevaram by saint Sundarar. According to mythology, Lord Murugan installed the Shivalingam here to rid himself of the sin (Brahmahatti Dosham) incurred by defeating the demon Surapadman. A unique event associated with the temple involves Sundarar being robbed of his wealth by Lord Shiva disguised as a hunter, only to have it returned here. The village is also renowned across South India for its traditional stone sculpting artisans who craft deity idols for temples worldwide.',
  c.id, d.id, 'Thirumuruganpoondi', 11.161, 77.3195,
  'HISTORICAL_FACT', 'Hindu / Artisan Community',
  'Dates back to the 9th century, associated with the Nayanmar Saint Sundarar.', 'Beyond its religious importance as a Paadal Petra Sthalam, the town is a living heritage center for the ancient craft of Agamic stone sculpting (Silpa Shastra).',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 0, 0, 4.8, 190, 800, 'shiva temple, murugan, tevaram, stone sculpting, kongu nadu, sundarar',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'TUP'
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
  'THIRUMURUGANPOONDI_TEMPLE',
  'tirupur, thirumuruganpoondi, muruganatheswarar, shiva, sundarar, stone sculpting, kongu nadu',
  'HINDU_HERITAGE',
  'TUP',
  'The Thirumuruganpoondi Temple in Tirupur is a 9th-century Shiva temple where Lord Murugan is said to have worshipped. The town is also highly famous for its traditional artisans who carve stone idols for temples worldwide.',
  'திருப்பூர் மாவட்டத்தில் உள்ள திருமுருகன்பூண்டி கோயில், சூரபத்மனை வதம் செய்த தோஷம் நீங்க முருகப்பெருமான் சிவனை வழிபட்ட தலமாகும். இந்த ஊர் உலகம் முழுவதும் உள்ள கோயில்களுக்கு கற்சிலைகளை வடிக்கும் பாரம்பரிய சிற்பிகளுக்குப் பெயர் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'thirumuruganpoondi-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
