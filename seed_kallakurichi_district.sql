-- ===================================================================
-- SEED SCRIPT: KALLAKURICHI DISTRICT (KKL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Kallakurichi District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'KKL', 'Kallakurichi', 'கள்ளக்குறிச்சி', 'Northern', 11.7381, 78.9639,
  'An emerging agricultural and industrial district, characterized by the picturesque Kalvarayan Hills, pristine waterfalls, and deep-rooted tribal community traditions.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Kallakurichi
-- Entry 1: Kalvarayan Hills and Malayali Tribal Heritage
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kalvarayan-hills-and-malayali-tribal-heritage',
  'Kalvarayan Hills and Malayali Tribal Heritage',
  'கல்வராயன் மலை மற்றும் மலையாளி பழங்குடி மரபு',
  'Kalvarayan Malai',
  'A major range in the Eastern Ghats known for its waterfalls (Megam, Periyar) and the unique cultural traditions of the local ''Malayali'' tribal communities.',
  'The Kalvarayan Hills form a major part of the Eastern Ghats, effectively separating the Kaveri river basin from the Palar river basin. The hills are home to numerous waterfalls, botanical diversity, and primarily inhabited by the ''Malayali'' tribes (meaning ''people of the hills'', not related to the Kerala language). These communities preserve unique agricultural practices, traditional millet-based cuisines, and vibrant localized harvest festivals that operate independently of mainstream plains culture.',
  c.id, d.id, 'Kalvarayan Hills', 11.7766, 78.6946,
  'COMMUNITY_ORAL_HISTORY', 'Malayali Tribal Community',
  'Inhabited for centuries by indigenous hill tribes practicing terrace farming and forest conservation.',
  'Provides crucial insight into the indigenous eco-cultural practices, ethno-botanical knowledge, and distinct social structures of Tamil Nadu''s hill communities.',
  'Tribal harvest festivals, village deity rites, summer forest fairs',
  'Indigenous bamboo weavecraft, tribal folk drumming',
  'Traditional cotton wraps and bead ornaments',
  'Varagu, Thinai, Samai millet preparations, forest honey, wild tubers',
  '/images/placeholders/place.svg',
  'Tribal Welfare Department, Government of Tamil Nadu; Anthropological Survey of India',
  'APPROVED', 0, 1, 4.7, 85, 340, 'eastern ghats, tribal heritage, waterfalls, nature, village customs, kallakurichi',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'KKL'
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

-- Entry 2: Koovagam Koothandavar Temple and Thirunangai Festival
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'koovagam-koothandavar-temple-and-thirunangai-festival',
  'Koovagam Koothandavar Temple and Thirunangai Festival',
  'கூவாகம் கூத்தாண்டவர் கோயில் மற்றும் திருநங்கையர் திருவிழா',
  'Koovagam Aravan Festival',
  'World''s largest congregation of transgender people (Thirunangai), enacting the epic sacrifice of warrior Aravan from the Mahabharata.',
  'Situated in Koovagam near Ulundurpet, the Koothandavar Temple is globally renowned for hosting the world''s most significant cultural festival for transgender women (Thirunangai / Aravani). Reenacting the Mahabharata legend where Lord Krishna assumed the Mohini form to marry Aravan before his battlefield sacrifice, thousands of devotees assemble during Chithra Pournami to receive thali bracelets from priests, celebrate marriage rites overnight, and ritualistically mourn Aravan''s dawn demise through traditional lament songs (oppari).',
  c.id, d.id, 'Koovagam, Ulundurpet', 11.7200, 79.3300,
  'COMMUNITY_ORAL_HISTORY', 'Hindu / Transgender Community (Thirunangai)',
  'Century-old folk ritual tradition linked to the Mahabharata Terukkuttu theater tradition of Tamil Nadu.',
  'A pioneering sanctuary of social inclusion and sacred identity validation for South Asia''s gender-diverse communities.',
  '18-day Chithra Pournami festival, Miss Koovagam pageant, ritual lamentation and breaking of bangles',
  'Terukkuttu folk theater, Oppari mourning songs',
  'Bridal silk sarees followed by white mourning cottons',
  '/images/placeholders/place.svg',
  'Anthropological Studies on Koovagam; Tamil Nadu Folk Arts Commission',
  'APPROVED', 1, 0, 4.9, 280, 1100, 'koovagam, thirunangai, aravan, koothandavar, festival, folklore, kallakurichi',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'KKL'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Tirukoilur Ulagalantha Perumal Temple & Kabilar Kundru
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'tirukoilur-ulagalantha-perumal-temple-and-kabilar-kundru',
  'Tirukoilur Ulagalantha Perumal Temple & Kabilar Kundru',
  'திருக்கோவிலூர் உலகளந்த பெருமாள் கோயில் மற்றும் கபிலர் குன்று',
  'Tirukkovalur Divya Desam, Trivikrama Swamy Temple',
  'Ancient Divya Desam where the first three Alwars met, alongside the Sangam-era memorial rock of poet Kabilar on the Pennai river.',
  'Tirukoilur holds immense importance in Tamil literary and religious history. The Ulagalantha Perumal Temple (worshipping Lord Vishnu as Trivikrama measuring the three worlds) is where the first three Alwar saints (Poigai, Bhutath, and Peyalwar) miraculously met in a tiny corridor and composed the foundational Nalayira Divya Prabandham verses that sparked the Tamil Bhakti movement. Nearby on the Pennai river stands Kabilar Kundru, a protected rock memorial where the revered Sangam poet Kabilar ended his life through Vadakiruthal after the fall of his patron King Pari.',
  c.id, d.id, 'Tirukoilur', 11.9667, 79.2000,
  'HISTORICAL_FACT', 'Hindu (Vaishnavism) / Sangam Literature',
  'Sangam period references; expanded by Medieval Cholas, Pallavas, and Vijayanagara emperors.',
  'The birthplace of the Vaishnavite Alwar Bhakti movement and poignant physical testament to Sangam-era friendship and honor.',
  'Vaikunta Ekadasi, Brahmotsavam, Kabilar literary commemoration',
  'Divya Prabandham chanting, Chola stone sculpture',
  'Vaishnava dhotis and uthariyam',
  'Temple puliyodharai, chakkarai pongal',
  '/images/placeholders/place.svg',
  'Nalayira Divya Prabandham; Purananuru; Archaeological Survey of India',
  'APPROVED', 0, 1, 4.8, 120, 460, 'alwars, divya desam, kabilar, sangam, tirukoilur, perumal, kallakurichi',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'KKL'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge Topics for Kallakurichi
INSERT INTO chatbot_knowledge (
  intent_key, keywords, category_code, district_code,
  response_en, response_ta, related_entry_id, is_verified,
  created_at, updated_at
)
SELECT 
  'KALVARAYAN_HILLS_TRIBAL',
  'kallakurichi, kalvarayan hills, tribal, malayali tribe, waterfalls, megam falls, eastern ghats',
  'VILLAGE_CUSTOMS',
  'KKL',
  'The Kalvarayan Hills in Kallakurichi are part of the Eastern Ghats. Besides beautiful waterfalls like Megam falls, it is culturally significant as the home of the ''Malayali'' hill tribes who maintain unique agricultural and festival traditions.',
  'கள்ளக்குறிச்சி மாவட்டத்தில் உள்ள கல்வராயன் மலைகள் கிழக்குத் தொடர்ச்சி மலையின் ஒரு பகுதியாகும். இது மேகம் அருவி போன்ற இயற்கை வளங்களுக்கும், அங்கு வாழும் ''மலையாளி'' பழங்குடி மக்களின் தனித்துவமான பண்பாட்டிற்கும் பெயர் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'kalvarayan-hills-and-malayali-tribal-heritage'
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
  'KOOVAGAM_FESTIVAL',
  'koovagam, thirunangai, aravan, koothandavar, transgender festival, ulundurpet, chithra pournami',
  'FESTIVALS_CELEBRATIONS',
  'KKL',
  'Koovagam Koothandavar Temple in Kallakurichi hosts the world''s largest gathering of transgender women (Thirunangai) every Chithra Pournami, reenacting the epic marriage and martyrdom of warrior Aravan.',
  'கள்ளக்குறிச்சி மாவட்டம் கூவாகம் கூத்தாண்டவர் கோயில், ஆண்டுதோறும் சித்திரா பௌர்ணமியில் திருநங்கைகள் கூடி அரவானை மணந்து வழிபடும் ஆசியாவின் மிகப்பெரிய பண்பாட்டுத் திருவிழாவாகும்.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'koovagam-koothandavar-temple-and-thirunangai-festival'
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
  'TIRUKOILUR_HERITAGE',
  'tirukoilur, alwars, divya desam, kabilar kundru, ulagalantha perumal, sangam, pari',
  'HINDU_HERITAGE',
  'KKL',
  'Tirukoilur in Kallakurichi is where the first three Alwars met to spark the Nalayira Divya Prabandham Bhakti movement, and is home to the historic Kabilar Kundru rock memorial on the Pennai river.',
  'திருக்கோவிலூர் முதலாழ்வார்கள் மூவர் கூடி நாலாயிர திவ்வியப் பிரபந்தத்தைத் தொடங்கிய புண்ணிய பூமியாகும். மேலும் இங்கு சங்க காலப் புலவர் கபிலர் உயிர் துறந்த ''கபிலர் குன்று'' அமைந்துள்ளது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'tirukoilur-ulagalantha-perumal-temple-and-kabilar-kundru'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
