-- ===================================================================
-- SEED SCRIPT: DINDIGUL DISTRICT (DGL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Dindigul District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'DGL', 'Dindigul', 'திண்டுக்கல்', 'Southern', 10.3673, 77.9803,
  'Historically known for its impregnable rock fort and iron locks, Dindigul is a major agricultural hub, famous for its distinct biryani cuisine and the sacred hill shrine of Palani.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Dindigul
-- Entry 1: Palani Arulmigu Dhandayuthapani Swamy Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'palani-arulmigu-dhandayuthapani-swamy-temple',
  'Palani Arulmigu Dhandayuthapani Swamy Temple',
  'பழனி அருள்மிகு தண்டாயுதபாணி சுவாமி திருக்கோயில்',
  'Palani Murugan Temple',
  'One of the Six Abodes of Lord Murugan (Arupadaiveedu), situated on a hill and famous for the deity''s idol made of Navapashanam (nine medicinal minerals).',
  'The Palani temple is the third of the Arupadaiveedu, the six holy abodes of Lord Murugan. The presiding deity, Dhandayuthapani Swamy, is unique as the idol was crafted by the ancient Siddhar Bhogar using an amalgam of nine poisonous minerals (Navapashanam) which together possess immense medicinal properties. The temple draws millions of devotees, many carrying ''Kavadi'', especially during the Thai Poosam festival.',
  c.id, d.id, 'Palani', 10.4402, 77.5204,
  'HISTORICAL_FACT', 'Hindu',
  'Idol consecrated by Sage Bhogar; temple expanded significantly by the Cheras and Pandyas.',
  'A focal point for Tamil Shaivite and Kaumaram traditions. The Panchamirtham prasadam (made of five ingredients) and Kavadi Attam originated and are deeply tied to this temple''s culture.',
  'Thai Poosam, Panguni Uthiram, Vaikasi Visakam, Kavadi Attam pilgrimage',
  'Kavadi Attam folk dance, Bhogar Siddha medicine traditions',
  'Saffron/yellow pilgrim dhotis, rudraksha beads',
  'Palani Panchamirtham (GI-tagged sacred offering of hill banana, jaggery, cow ghee, honey, and cardamom)',
  '/images/placeholders/place.svg',
  'Palani Devasthanam records; Bogar 7000 Siddha Agamic texts; HR&CE Tamil Nadu',
  'APPROVED', 1, 0, 4.9, 350, 1500, 'murugan, arupadaiveedu, palani, navapashanam, kavadi, thai poosam, panchamirtham, dindigul',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'DGL'
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

-- Entry 2: Dindigul Rock Fort
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'dindigul-rock-fort',
  'Dindigul Rock Fort',
  'திண்டுக்கல் மலைக்கோட்டை',
  'Dindigul Malai Kottai',
  '17th-century hill fortress built atop a monolithic granite rock by the Madurai Nayaks and fortified by Hyder Ali and Tipu Sultan.',
  'Dindigul Rock Fort was built in 1605 by King Muthu Krishnappa Nayak of the Madurai Nayak dynasty atop a prominent 280-foot high granite rock that resembles a pillow (dindu). During the 18th century, Hyder Ali and his son Tipu Sultan heavily fortified the stronghold with massive ramparts, double-walled watchtowers, and cannons to counter British forces during the Anglo-Mysore Wars. The hill fort offers panoramic views of the Sirumalai hills and town.',
  c.id, d.id, 'Dindigul Town', 10.3622, 77.9708,
  'HISTORICAL_FACT', 'Secular / Military Heritage',
  'Built in 1605 CE by Madurai Nayaks; captured and renovated by Hyder Ali in 1755 and later ceded to the British in 1792.',
  'A strategic defense citadel showcasing Nayaka-era stone architecture and Mysore-era cannon battery defenses.',
  'Heritage walks and historical exhibitions',
  'Military bastion architecture, rock-cut cistern engineering',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India (ASI); Madurai District Gazetteer',
  'APPROVED', 0, 0, 4.6, 140, 520, 'fort, rock fort, madurai nayak, tipu sultan, hyder ali, dindigul, monument',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'DGL'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Dindigul Biryani & Handcrafted Lock Heritage
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'dindigul-biryani-and-handcrafted-lock-heritage',
  'Dindigul Biryani & Handcrafted Lock Heritage',
  'திண்டுக்கல் பிரியாணி மற்றும் பூட்டு தயாரிப்பு மரபு',
  'Thalappakatti Biryani, Dindigul Pootu Craft',
  'GI-tagged culinary tradition using aromatic Seeraga Samba rice paired with the century-old handmade tamper-proof iron lock industry.',
  'Dindigul is celebrated across India for two iconic craft traditions: its world-renowned biryani, prepared using tiny, fragrance-packed Seeraga Samba rice, curd, tender meat, and freshly ground whole spices (pioneered in 1957); and its 150-year-old artisanal iron lock-making industry. Handcrafted by local smiths using traditional levers and brass tumblers, Dindigul locks (Pootu) carry a Geographical Indication (GI) tag for their legendary durability and tamper resistance.',
  c.id, d.id, 'Dindigul City', 10.3673, 77.9803,
  'COMMUNITY_ORAL_HISTORY', 'All Communities',
  'Lock industry originated in the late 19th century under Sankaralinga Asari; Biryani culinary culture flourished since the 1950s.',
  'Dual Geographical Indication (GI) heritage representing the artisanal metallurgy and gastronomic excellence of South Tamil Nadu.',
  'Sunday family feasts, festive celebrations, Ayudha Pooja for blacksmith guilds',
  'Artisanal lock forging, traditional slow-dum woodfire cooking',
  'Dindigul Seeraga Samba Mutton Biryani, Ennai Kathirikai (spicy brinjal gravy), Onion Raitha',
  '/images/placeholders/place.svg',
  'Geographical Indications Registry of India; Dindigul Lock Artisans Guild',
  'APPROVED', 0, 0, 4.8, 220, 850, 'biryani, seeraga samba, dindigul locks, gi tag, cuisine, handicraft, thalappakatti',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'DGL'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge Topics for Dindigul
INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'PALANI_MURUGAN',
  'dindigul, palani, murugan, dhandayuthapani, navapashanam, kavadi, thai poosam, panchamirtham',
  'HINDU_HERITAGE',
  'DGL',
  'The Palani Dhandayuthapani Temple in Dindigul district is one of the Six Abodes of Lord Murugan. Its unique main idol was created by Sage Bhogar using Navapashanam (nine medicinal minerals).',
  'திண்டுக்கல் மாவட்டத்தில் உள்ள பழனி தண்டாயுதபாணி திருக்கோயில் முருகப் பெருமானின் அறுபடை வீடுகளில் ஒன்றாகும். இங்குள்ள மூலவர் சிலை போகர் சித்தரால் நவபாஷாணத்தால் (ஒன்பது மூலிகைகள்/தாதுக்கள்) உருவாக்கப்பட்டது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'palani-arulmigu-dhandayuthapani-swamy-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);

INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'DINDIGUL_ROCK_FORT',
  'dindigul, fort, malai kottai, rock fort, nayak, hyder ali, tipu sultan',
  'HISTORICAL_MONUMENTS',
  'DGL',
  'Dindigul Rock Fort is a 17th-century monolithic hill fortress built by the Madurai Nayaks and later fortified by Hyder Ali and Tipu Sultan with heavy cannon ramparts during the Anglo-Mysore Wars.',
  'திண்டுக்கல் மலைக்கோட்டை 17 ஆம் நூற்றாண்டில் மதுரை நாயக்கர்களால் கட்டப்பட்டு, பின்னர் மைசூர் போர்களின் போது ஹைதர் அலி மற்றும் திப்பு சுல்தானால் பீரங்கி அரண்களுடன் பலப்படுத்தப்பட்ட வரலாற்றுச் சிறப்புமிக்க கோட்டையாகும்.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'dindigul-rock-fort'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);

INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'DINDIGUL_BIRYANI_AND_LOCKS',
  'dindigul, biryani, seeraga samba, thalappakatti, locks, pootu, gi tag',
  'CUISINE_RECIPES',
  'DGL',
  'Dindigul is globally renowned for its GI-tagged Seeraga Samba meat biryani and its 150-year-old artisanal handmade iron lock industry noted for unbreakable security.',
  'திண்டுக்கல் மாவட்டம் சீரக சம்பா அரிசியால் செய்யப்படும் புகழ்மிக்க பிரியாணிக்கும், 150 ஆண்டுகள் பாரம்பரியம் கொண்ட கைவினைப் பூட்டு தயாரிப்புத் தொழிலுக்கும் உலகளவில் பெயர்பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'dindigul-biryani-and-handcrafted-lock-heritage'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
