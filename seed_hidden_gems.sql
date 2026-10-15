USE tamilnadu_culture_db;

-- 1. Ensure Sittanavasal Cave and Kazhugumalai are marked as hidden_gem = 1
UPDATE cultural_entries SET hidden_gem = 1 WHERE slug IN ('sittanavasal-cave', 'kazhugumalai-vettuvan-koil');

-- 2. Insert Thirumayam Fort & Caves
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thirumayam-fort-caves',
  'Thirumayam Fort & Rock-Cut Cave Temples',
  'திருமயம் கோட்டை மற்றும் குடைவரை கோயில்கள்',
  'Thirumayam Fort, Satyagirisvarar Cave',
  'Colossal 17th-century polygonal bastion fort harboring massive 8th-century rock-cut cave temples of Shiva and Vishnu.',
  'Constructed in 1687 by Vijaya Raghunatha Sethupathi of Ramanathapuram, Thirumayam Fort is a 40-acre semi-circular fortification. Carved into its rocky face are the 8th-century Satyamurthy Perumal (one of the largest reclining Vishnu bas-reliefs in India) and the Satyagirisvarar rock-cut cave temples with Pandya-era musical inscriptions.',
  c.id, d.id, 'Thirumayam, Pudukkottai District', 10.2464, 78.7523,
  'HISTORICAL_FACT', 'Tamil Heritage', '1687 CE (Sethupathi & Pandya)',
  'Colossal 17th-century polygonal bastion fort harboring massive 8th-century rock-cut cave temples.',
  'Vaikunta Ekadasi, Maha Shivaratri',
  'https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=800',
  'Archaeological Survey of India', 'APPROVED',
  0, 1, 4.9, 58, 312, 'fort, rock-cut, vishnu, shiva, hidden-gem, pudukkottai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'PDK'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'thirumayam-fort-caves');

-- 3. Insert Gingee Fort
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'gingee-fort-troy-of-east',
  'Gingee Fort - ''The Troy of the East''',
  'செஞ்சிக் கோட்டை - தென்னகத்தின் ட்ராய்',
  'Senji Fort, Rajagiri, Krishnagiri',
  'Impregnable 3-citadel hilltop fortress complex called the ''Troy of the East'' by British invaders.',
  'Spread over three formidable hills—Rajagiri, Krishnagiri, and Chandrayandurg—Gingee Fort spans a 13-kilometer perimeter wall. It features the grand 8-story Kalyana Mahal, massive granaries, secret escape tunnels, and sacred temples like Venkataramana Temple.',
  c.id, d.id, 'Gingee, Viluppuram District', 12.2533, 79.4187,
  'HISTORICAL_FACT', 'Tamil Heritage', '9th - 16th Century CE (Chola, Nayak, Maratha)',
  'Impregnable fortress complex demonstrating medieval military engineering.',
  'Chithirai Festival, Annual Cultural Heritage Meet',
  'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=800',
  'Archaeological Survey of India', 'APPROVED',
  0, 1, 4.9, 84, 450, 'fort, rajagiri, chola, nayak, hidden-gem, villupuram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'VLP'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'gingee-fort-troy-of-east');

-- 4. Insert Tharangambadi Fort Dansborg
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'tharangambadi-danish-fort',
  'Tharangambadi (Tranquebar) Danish Fort Dansborg',
  'தரங்கம்பாடி டேனிஷ் கோட்டை டான்ஸ்போர்க்',
  'Fort Dansborg, Tranquebar Fort',
  '1620 CE Scandinavian seaside fortress on the Coromandel coast with golden ozone beaches.',
  'Constructed by Danish Admiral Ove Gjedde under treaty with King Raghunatha Nayak of Thanjavur, Fort Dansborg is the second largest Danish fort ever built. It preserves intact 17th-century colonial ramparts, canon bastions, and the first printing press in India.',
  c.id, d.id, 'Tharangambadi, Mayiladuthurai District', 11.0333, 79.8500,
  'HISTORICAL_FACT', 'Colonial & Maritime Heritage', '1620 CE (Danish Royal Charter)',
  'Second largest Danish fort in the world, historic maritime trade center.',
  'Tranquebar Heritage Festival',
  'https://images.unsplash.com/photo-1548013146-72479768bada?w=800',
  'Tamil Nadu State Archaeology Department', 'APPROVED',
  0, 1, 4.8, 62, 380, 'danish, coastal, fort, tranquebar, hidden-gem, mayiladuthurai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'MYD'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'tharangambadi-danish-fort');

-- 5. Insert Kudumiyanmalai Inscriptions
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kudumiyanmalai-musical-inscriptions',
  'Kudumiyanmalai Sikhagiriswara Ancient Musical Inscriptions',
  'குடுமியான்மலை சிகாகிரீஸ்வரர் இசை கல்வெட்டுகள்',
  'Kudumiyanmalai Music Inscription, Rock Temple',
  '7th-century rock face inscribed with 38 lines of fundamental classical Carnatic/Tamil musical treatise.',
  'Attributed to Pallava King Mahendravarman I, the 7th-century musical inscriptions on the living granite bedrock at Kudumiyanmalai detail 7 classical ragas (Gramas) and musical notes meant for the 8-stringed Parivadini lute, making it a priceless milestone in world music history.',
  c.id, d.id, 'Kudumiyanmalai, Pudukkottai District', 10.4222, 78.6588,
  'HISTORICAL_FACT', 'Musical & Epigraphical Heritage', '7th Century CE (Pallava Dynasty)',
  'World-renowned epigraphical treatise on ancient classical Indian music ragas.',
  'Annual Music & Epigraphy Heritage Day',
  'https://images.unsplash.com/photo-1600100397608-f010f443b78c?w=800',
  'Epigraphia Indica, ASI', 'APPROVED',
  0, 1, 4.9, 44, 290, 'inscriptions, music, pallava, rock-cut, hidden-gem, pudukkottai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'PDK'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'kudumiyanmalai-musical-inscriptions');

-- 6. Insert Poompuhar Submerged Chola Wharf
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'poompuhar-submerged-port',
  'Poompuhar Submerged Ancient Chola Port',
  'பூம்புகார் காவிரிப்பூம்பட்டினம் மூழ்கிய துறைமுகம்',
  'Kaveripoompattinam, Silappathikaram Heritage',
  'Ancient submerged port city praised in Silappathikaram, showcasing ancient marine trade history.',
  'Once the flourishing maritime capital and harbor of the Early Cholas, Kaveripoompattinam traded silk, pearls, and spices with Rome and Southeast Asia. Underwater excavations have revealed ancient wharves, ring wells, and monolithic brick structures preserved along the seashore.',
  c.id, d.id, 'Poompuhar, Mayiladuthurai District', 11.1447, 79.8550,
  'HISTORICAL_FACT', 'Literary & Maritime Heritage', 'Sangam Era (3rd Century BCE - 3rd Century CE)',
  'The legendary seaport backdrop of Silappathikaram and Manimekalai.',
  'Chithirai Full Moon Festival, Coastal Lore Walk',
  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
  'National Institute of Oceanography (NIO), ASI', 'APPROVED',
  0, 1, 4.8, 56, 340, 'chola, port, silappathikaram, submerged, hidden-gem, mayiladuthurai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'MYD'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'poompuhar-submerged-port');

-- 7. Insert Kurangani Mountain Trails
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kurangani-mountain-trails',
  'Kurangani Cloud Hills & Megamalai Mountain Passes',
  'குரங்கணி மேகமலை மலைப்பாதை மற்றும் பழங்குடி மரபு',
  'Kurangani Hills, Bodinayakanur Tribal Passes',
  'Hidden misty valleys, ancient tribal passes, and coffee trails in the Western Ghats.',
  'Tucked inside the Bodinayakanur hills, Kurangani is an unspoiled mountain hamlet surrounded by 8,000-foot peaks, cascading mountain brooks, and cardamom estates with deep tribal lore of the Western Ghats.',
  c.id, d.id, 'Kurangani, Bodinayakanur, Theni District', 10.0805, 77.2422,
  'COMMUNITY_ORAL_HISTORY', 'Tribal & Natural Lore', 'Indigenous Tribal Heritage',
  'Historic mountain passes connecting the Madurai plains to the High Ranges of Kerala.',
  'Tribal Harvest Gathering, Western Ghats Lore Night',
  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800',
  'Tamil Nadu Forest Department & Local Tribal Elders', 'APPROVED',
  0, 1, 4.9, 70, 410, 'western-ghats, mountain, trails, tribal, hidden-gem, theni',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'THN'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'kurangani-mountain-trails');

-- 8. Insert Samanar Malai
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'samanar-malai-jain-caves',
  'Samanar Malai & Mangulam 3rd BCE Jain Rock Beds',
  'சமணர் மலை மற்றும் மாங்குளம் தமிழ் பிராமி படுக்கைகள்',
  'Samanar Kundru, Keelakuyilkudi Jain Beds',
  'Ancient 3rd-century BCE stone beds used by Tamil Jain ascetic monks with carved Bas-reliefs.',
  'Located 10 km from Madurai in Keelakuyilkudi village, Samanar Malai contains natural rock shelters where Digambara Jain monks meditated over 2,200 years ago. The hill preserves ancient Tamil-Brahmi inscriptions and rock-carved sculptures of Mahavira and Gomateshwara.',
  c.id, d.id, 'Keelakuyilkudi, Madurai District', 9.9234, 78.0612,
  'HISTORICAL_FACT', 'Jain Heritage', '3rd Century BCE - 9th Century CE',
  'One of the oldest centers of Jain asceticism and Tamil-Brahmi epigraphy in South India.',
  'Mahavira Jayanti Silent Meditation Walk',
  'https://images.unsplash.com/photo-1544735716-392fe2489ffa?w=800',
  'Archaeological Survey of India', 'APPROVED',
  0, 1, 4.9, 65, 395, 'jain, rock-cut, ancient, brahmi, hidden-gem, madurai',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'MDU'
AND NOT EXISTS (SELECT 1 FROM cultural_entries WHERE slug = 'samanar-malai-jain-caves');
