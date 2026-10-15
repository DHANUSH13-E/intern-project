-- ===================================================================
-- SEED SCRIPT: CHENGALPATTU DISTRICT (CHG)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Chengalpattu District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'CHG', 'Chengalpattu', 'செங்கல்பட்டு', 'Northern', 12.6939, 79.9757,
  'Carved out of the erstwhile Kanchipuram district, Chengalpattu is rich in ancient history and natural beauty, housing the world-renowned Pallava rock-cut architecture at Mamallapuram and serene bird sanctuaries.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Chengalpattu
-- Entry 1: Mahabalipuram - Shore Temple & Rock Monuments
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'mahabalipuram-shore-temple-rock-monuments',
  'Mahabalipuram - Shore Temple & Rock Monuments',
  'மாமல்லபுரம் - கடற்கரைக் கோயில் மற்றும் பாறைச் சிற்பங்கள்',
  'Mamallapuram, Seven Pagodas',
  'A magnificent complex of Pallava-era rock-cut temples, monolithic structures, and cave sanctuaries overlooking the Bay of Bengal.',
  'Built by the Pallava kings in the 7th and 8th centuries, Mamallapuram is a UNESCO World Heritage Site. It comprises the Shore Temple, Arjuna''s Penance (Descent of the Ganges), the Pancha Rathas (five monolithic chariot temples), and several rock-cut cave temples. The monuments showcase the genesis of Dravidian temple architecture and feature some of the most exquisite bas-reliefs carved from monolithic granite in all of India.',
  c.id, d.id, 'Mahabalipuram', 12.6195, 80.1960,
  'HISTORICAL_FACT', 'Hindu',
  'Developed under the reigns of Pallava kings Narasimhavarman I and Rajasimhan between 630 and 728 CE.',
  'Represents the crucial transition from rock-cut architecture to structural stone temples in South India. It was an active port city of the Pallavas carrying Indian culture to Southeast Asia.',
  'Mamallapuram Dance Festival held annually in winter; Margazhi and Pongal cultural events',
  'Bharatanatyam, Pallava stone carving, granite sculpture',
  'Traditional silk sarees and veshti during festival seasons',
  'Coastal Tamil cuisine, fresh fish curry and seafood preparations',
  '/images/placeholders/place.svg',
  'UNESCO World Heritage Centre: Group of Monuments at Mahabalipuram; Archaeological Survey of India; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.9, 156, 520, 'pallava architecture, unesco, rock-cut, shore temple, sculpture, beach, mamallapuram, chengalpattu',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'CHG'
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

-- Entry 2: Pancha Rathas, Mahabalipuram
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'pancha-rathas-mahabalipuram',
  'Pancha Rathas, Mahabalipuram',
  'ஐந்து ரதங்கள், மாமல்லபுரம்',
  'Five Rathas, Pandava Rathas',
  'Five monolithic rock-cut shrines, each carved from a single piece of stone, named after the Pandavas and Draupadi.',
  'Carved in the 7th century CE during the reign of Narasimhavarman I, the five rathas (Dharmaraja, Bhima, Arjuna, Nakula-Sahadeva, and Draupadi) are monolithic rock-cut monuments carved out of single granite boulders. Although named after the Pandavas, they are not temples dedicated to them, but rather architectural models showcasing diverse roof types (barrel-vaulted, tiered pyramid, and thatched hut style) in a single compact site.',
  c.id, d.id, 'Mahabalipuram', 12.6054, 80.1986,
  'HISTORICAL_FACT', 'Hindu',
  'Carved in the 7th century CE under the Pallava ruler Narasimhavarman I (Mamalla).',
  'Considered architectural prototypes for subsequent Dravidian temple vimanas across South India.',
  'Visited during the Mamallapuram Dance Festival',
  'Pallava stone sculpture, rock monolithic carving',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India monument guide; UNESCO records',
  'APPROVED', 1, 0, 4.8, 112, 410, 'pallava, monolithic, rathas, unesco, pancha rathas, mamallapuram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'CHG'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Vedanthangal Bird Sanctuary
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'vedanthangal-bird-sanctuary',
  'Vedanthangal Bird Sanctuary',
  'வேடந்தாங்கல் பறவைகள் சரணாலயம்',
  'Vedanthangal Lake Sanctuary',
  'One of the oldest water-bird sanctuaries in India, protected by villagers for generations as a community conservation wetland.',
  'Spanning over 30 hectares of protected wetland, Vedanthangal is one of India''s oldest bird sanctuaries. Local farmers traditionally recognized that bird droppings (guano) enriched the irrigation water of the surrounding paddy fields, and protected the nesting colonies for centuries prior to formal governmental wildlife conservation acts. Every year, tens of thousands of migratory birds—including pintails, garganeys, grey pelicans, and spoonbills—breed here between November and March.',
  c.id, d.id, 'Vedanthangal', 12.5453, 79.8514,
  'HISTORICAL_FACT', 'General / Secular',
  'Documented community protection dating back to the 18th century, formally recognized by the British Collector in 1798.',
  'Exemplifies indigenous grassroots ecological heritage and community-led wildlife conservation in rural Tamil Nadu.',
  'Winter bird-watching season from November to February',
  '/images/placeholders/place.svg',
  'Tamil Nadu Forest Department wildlife records; District gazetteers',
  'APPROVED', 0, 1, 4.8, 78, 290, 'birds, wetland, conservation, sanctuary, vedanthangal, hidden-gem',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'CHG'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge for Chengalpattu
INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'MAMALLAPURAM_PALLAVA',
  'mahabalipuram, mamallapuram, shore temple, pallava, arjuna penance, pancha rathas, chengalpattu architecture',
  'ARCHITECTURE_SCULPTURE',
  'CHG',
  'Mahabalipuram in Chengalpattu district is a UNESCO World Heritage site known for its 7th-century Pallava dynasty rock-cut architecture, including the Shore Temple, Pancha Rathas, and the massive Arjuna''s Penance bas-relief.',
  'செங்கல்பட்டு மாவட்டத்தில் உள்ள மாமல்லபுரம், 7-ஆம் நூற்றாண்டைச் சேர்ந்த பல்லவர் கால பாறைச் சிற்பங்கள், கடற்கரைக் கோயில் மற்றும் பஞ்ச ரதங்களுக்குப் பெயர் பெற்ற யுனெஸ்கோ உலகப் பாரம்பரிய தளமாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'mahabalipuram-shore-temple-rock-monuments' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'CHENGALPATTU_OVERVIEW',
  'chengalpattu, district, overview, about chengalpattu, pallava, mamallapuram',
  'ARCHITECTURE_SCULPTURE',
  'CHG',
  'Chengalpattu is a northern coastal district of Tamil Nadu known for the world-renowned UNESCO World Heritage monuments at Mahabalipuram, the ancient Pancha Rathas, and the Vedanthangal Bird Sanctuary.',
  'செங்கல்பட்டு மாவட்டம் மாமல்லபுரத்தின் உலகப் புகழ்பெற்ற யுனெஸ்கோ கடற்கரைக் கோயில், ஐந்து ரதங்கள் மற்றும் வேடந்தாங்கல் பறவைகள் சரணாலயத்திற்குப் புகழ்பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'mahabalipuram-shore-temple-rock-monuments' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'PANCHA_RATHAS',
  'pancha rathas, five rathas, monolithic shrines, mamallapuram rathas, pallava rathas',
  'ARCHITECTURE_SCULPTURE',
  'CHG',
  'The Pancha Rathas in Mahabalipuram are five monolithic 7th-century shrines carved each from a single granite stone under Pallava king Narasimhavarman I.',
  'மாமல்லபுரத்தில் உள்ள பஞ்ச ரதங்கள் ஏழாம் நூற்றாண்டில் முதலாம் நரசிம்மவர்ம பல்லவனால் ஒற்றைக் கல்லில் செதுக்கப்பட்ட ஐந்து குடைவரை ரதக் கோயில்களாகும்.',
  1,
  id
FROM cultural_entries WHERE slug = 'pancha-rathas-mahabalipuram' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'VEDANTHANGAL_SANCTUARY',
  'vedanthangal, bird sanctuary, migratory birds, wetland, chengalpattu birds',
  'HIDDEN_GEMS',
  'CHG',
  'Vedanthangal Bird Sanctuary in Chengalpattu is one of the oldest bird sanctuaries in India, safeguarded by traditional village farmers for centuries. The best time to visit is November to February.',
  'வேடந்தாங்கல் பறவைகள் சரணாலயம் இந்தியாவின் மிகத் தொன்மையான சரணாலயங்களில் ஒன்றாகும்; கிராம மக்களின் பாரம்பரியப் பாதுகாப்பால் உருவானது.',
  1,
  id
FROM cultural_entries WHERE slug = 'vedanthangal-bird-sanctuary' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);
