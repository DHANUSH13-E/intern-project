-- ===================================================================
-- SEED SCRIPT: COIMBATORE DISTRICT (CBE)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Coimbatore District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'CBE', 'Coimbatore', 'கோயம்புத்தூர்', 'Western', 11.0168, 76.9558,
  'Known as the ''Manchester of South India'', Coimbatore is beautifully situated on the banks of the Noyyal River at the foothills of the Western Ghats. It boasts a rich blend of ancient Chola temple heritage, indigenous tribal culture, and a thriving modern textile industry.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert Cultural Entries for Coimbatore
-- Entry 1: Perur Pateeswarar Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'perur-pateeswarar-temple',
  'Perur Pateeswarar Temple',
  'பேரூர் பட்டீஸ்வரர் கோயில்',
  'Arulmigu Pateeswarar Swamy Temple, Mel Chidambaram',
  'An ancient Shiva temple built by Karikala Chola on the banks of the Noyyal River, famous for its ''Kanaka Sabai'' (Golden Hall) featuring exquisite life-sized stone carvings.',
  'Located on the banks of the Noyyal River, the Perur Pateeswarar Temple is believed to have been originally established by Karikala Chola. Often referred to as ''Mel Chidambaram'' (Western Chidambaram), the temple''s architectural highlight is the ''Kanaka Sabai'' built during the Madurai Nayak period in the 17th century. This hall houses a breathtaking monolithic stone sculpture of Lord Nataraja performing the Anandatandava, flanked by intricately carved pillars depicting various manifestations of Shiva and mythical creatures.',
  c.id, d.id, 'Perur, Coimbatore', 10.9701, 76.9038,
  'HISTORICAL_FACT', 'Hindu',
  'Original sanctum built by Karikala Chola in the 2nd century CE; major additions made by Hoysala, Vijayanagara, and Nayak rulers.',
  'A pinnacle of Dravidian stone sculpture art. The temple also plays a central role in the traditional agrarian festival of ''Naatru Nadavu'' (paddy seedling planting), connecting the divine with the region''s agricultural roots.',
  'Naatru Nadavu festival, Panguni Uthiram, Maha Shivaratri, Arudra Darshan',
  'Nayak stone sculpture, classical temple dance, Tevaram singing',
  'Kongu-style cotton veshti and angavastram, silk sarees',
  'Traditional Kongunadu feast, Arisi Paruppu Sadam, pallipalayam dishes',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India monument reports; Tamil Nadu HR&CE Department; Kongu Mandala Sathagam',
  'APPROVED', 1, 0, 4.9, 164, 580, 'dravidian architecture, noyyal river, nataraja, stone carvings, nayaka architecture, kongu nadu, coimbatore',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'CBE'
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

-- Entry 2: Marudamalai Murugan Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'marudamalai-murugan-temple',
  'Marudamalai Murugan Temple',
  'மருதமலை முருகன் கோயில்',
  'Marudhamalai Dhandayuthapani Temple, Subramanya Swamy Temple',
  'Sacred hilltop abode of Lord Murugan in the Western Ghats foothills, deeply tied to the Siddha tradition of Pambatti Siddhar.',
  'Perched on a scenic granite hill in the Western Ghats about 12 km from Coimbatore, the Marudamalai temple is revered as the unofficial ''Seventh Abode'' of Lord Murugan. Surrounded by medicinal herbs, the hill houses the sacred Pambatti Siddhar Cave, where one of the eighteen renowned Siddhars attained enlightenment. Devotees climb ancient stone steps through dense tropical greenery to seek blessings for health and spiritual wellbeing.',
  c.id, d.id, 'Marudamalai, Coimbatore', 11.0450, 76.8510,
  'HISTORICAL_FACT', 'Hindu (Murugan worship)',
  'Believed to date back to the 12th century CE during the Kongu Chola era, associated with sage Agastya and Pambatti Siddhar.',
  'A major pilgrimage center of Kongu Nadu intertwining Siddha herbal medicine, Tamil devotional poetry, and hill temple worship.',
  'Thaipusam, Panguni Uthiram, Skanda Sashti, Vaikasi Visakam',
  'Kavadi Aattam, Murugan devotional hymns, Siddha medicine',
  'Saffron and yellow pilgrimage veshti, silk sarees',
  'Panchamirtham, dry fruit prasadam',
  '/images/placeholders/place.svg',
  'Tamil Nadu HR&CE Department; Siddha tradition texts',
  'APPROVED', 1, 0, 4.8, 150, 510, 'murugan, hill temple, kongu, pilgrimage, siddha, marudamalai, western ghats',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'CBE'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- Entry 3: Coimbatore Cotton Textile Heritage & Kovai Kora Cotton
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'coimbatore-cotton-textile-heritage-kovai-kora-cotton',
  'Coimbatore Cotton Textile Heritage & Kovai Kora Cotton',
  'கோயம்புத்தூர் பருத்தி நெசவு மரபு மற்றும் கோவை கோரா காட்டன்',
  'Manchester of South India, Kovai Kora Silk Sarees',
  'The rich textile mills, handlooms, and Geographical Indication-tagged Kovai Kora cotton weaving traditions of Coimbatore.',
  'Coimbatore''s rise as the ''Manchester of South India'' began in the late 19th and early 20th centuries, propelled by black-cotton soil, hydroelectric power from Pykara, and entrepreneurial spirit. Complementing its industrial mills is the celebrated Kovai Kora Cotton craft, an exquisite handwoven blend of traditional cotton yarn and mulberry raw silk with bright aerated motifs and zari borders, honored with a Geographical Indication (GI) tag.',
  c.id, d.id, 'Sirumugai & Coimbatore City', 11.0100, 76.9600,
  'HISTORICAL_FACT', 'General / Weaving Communities',
  'Handloom weaving practiced for centuries; motorized spinning mills introduced in 1888 with Stanes Mill.',
  'Shaped the economic prosperity, labor history, and artisanal identity of the Kongu region.',
  'National Handloom Day, Weavers'' cultural gatherings, Pongal textile fairs',
  'Jacquard weaving, handloom spinning, zari ornamentation',
  'Kovai Kora cotton sarees, handwoven dhotis, cotton shirts',
  '/images/placeholders/place.svg',
  'Geographical Indications Registry India; Department of Handlooms and Textiles Tamil Nadu',
  'APPROVED', 0, 0, 4.8, 115, 390, 'textile, cotton, weaving, industry, gi tag, kora cotton, coimbatore',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'CBE'
ON DUPLICATE KEY UPDATE 
  title = VALUES(title),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description);

-- 3. Insert Chatbot Knowledge for Coimbatore
INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'PERUR_PATEESWARAR_TEMPLE',
  'perur, pateeswarar, noyyal, mel chidambaram, kanaka sabai, karikala chola, coimbatore temple',
  'HINDU_HERITAGE',
  'CBE',
  'Perur Pateeswarar Temple in Coimbatore is an ancient Shiva temple originally built by Karikala Chola on the banks of the Noyyal River, celebrated for its 17th-century ''Kanaka Sabai'' with life-sized Nataraja and Dravidian stone carvings.',
  'கோயம்புத்தூரில் நொய்யல் ஆற்றங்கரையில் கரிகால் சோழனால் கட்டப்பட்ட பேரூர் பட்டீஸ்வரர் கோயில், அதன் 17-ஆம் நூற்றாண்டு கனக சபை மற்றும் அற்புத நடராஜர் பாறைச் சிற்பங்களுக்குப் பெயர் பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'perur-pateeswarar-temple' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'COIMBATORE_OVERVIEW',
  'coimbatore, kovai, manchester of south india, overview, about coimbatore, noyyal, textile',
  'HINDU_HERITAGE',
  'CBE',
  'Coimbatore, known as the ''Manchester of South India'', is located on the Noyyal River at the foothills of the Western Ghats, renowned for Perur Pateeswarar Temple, Marudamalai Murugan Temple, and its vibrant Kovai Kora cotton weaving heritage.',
  'தென்னிந்தியாவின் மான்செஸ்டர் என்றழைக்கப்படும் கோயம்புத்தூர், பேரூர் பட்டீஸ்வரர் கோயில், மருதமலை முருகன் கோயில் மற்றும் புகழ்பெற்ற ஜவுளி மரபைக் கொண்ட மேற்கு மண்டலத்தின் முக்கிய பண்பாட்டு நகரம்.',
  1,
  id
FROM cultural_entries WHERE slug = 'perur-pateeswarar-temple' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'MARUDAMALAI_TEMPLE',
  'marudamalai, murugan, pambatti siddhar, hill temple, western ghats, kovai murugan',
  'HINDU_HERITAGE',
  'CBE',
  'Marudamalai Murugan Temple is a sacred hill shrine in the Western Ghats near Coimbatore, revered as the 7th abode of Murugan and closely linked with Pambatti Siddhar.',
  'கோயம்புத்தூர் அருகே மேற்குத் தொடர்ச்சி மலையில் அமைந்துள்ள மருதமலை முருகன் கோயில், பாம்பாட்டி சித்தர் வாழ்ந்த புனித மலையாகவும் முருகனின் 7-ஆம் படைவீடாகவும் போற்றப்படுகிறது.',
  1,
  id
FROM cultural_entries WHERE slug = 'marudamalai-murugan-temple' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 
  'COIMBATORE_TEXTILE_HERITAGE',
  'textile, kovai kora, cotton, manchester of south india, weaving, handloom, coimbatore saree',
  'TRADITIONAL_CRAFTS',
  'CBE',
  'Coimbatore is world-renowned for its cotton textile industry and GI-tagged Kovai Kora Cotton sarees, which blend traditional fine cotton with mulberry raw silk.',
  'கோயம்புத்தூர் உலகப் புகழ்பெற்ற ஜவுளித் தொழிலுக்கும், புவிசார் குறியீடு (GI Tag) பெற்ற பாரம்பரிய கோவை கோரா பருத்தி-பட்டு சேலை நெசவு மரபிற்கும் புகழ்பெற்றது.',
  1,
  id
FROM cultural_entries WHERE slug = 'coimbatore-cotton-textile-heritage-kovai-kora-cotton' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);
