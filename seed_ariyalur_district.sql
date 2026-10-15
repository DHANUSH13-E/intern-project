-- ===================================================================
-- SEED SCRIPT: ARIYALUR DISTRICT (15 Cultural Entries & 16 Chatbot Topics)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Ariyalur District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'ARI', 'Ariyalur', 'அரியலூர்', 'Central', 11.14, 79.08,
  'Ariyalur is a district in central Tamil Nadu that was once the heartland of the imperial Cholas. It is home to Gangaikonda Cholapuram, the capital founded by Rajendra Chola I and a UNESCO World Heritage Site, and is known for its limestone and Cretaceous fossil beds, cashew and millet farming, and the Kollidam river.'
)
ON DUPLICATE KEY UPDATE 
  name_en = VALUES(name_en),
  name_ta = VALUES(name_ta),
  region = VALUES(region),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  description = VALUES(description);

-- 2. Insert 15 Cultural Entries for Ariyalur
-- Entry 1: Gangaikonda Cholapuram Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'gangaikonda-cholapuram-temple',
  'Gangaikonda Cholapuram Temple',
  'கங்கைகொண்ட சோழபுரம்',
  'Brihadisvara Temple, Rajendra Chola Temple, Gangaikonda Choleeswaram, Gangaikonda Cholapuram Big Temple',
  'A magnificent Chola era Shiva temple built by Rajendra Chola I, featuring exquisite sculptures and the largest Shivalingam in South India.',
  'Founded by Rajendra Chola I to commemorate his victorious expedition to the Ganges, Gangaikonda Cholapuram served as the Chola capital for around 250 years. The great Arulmigu Peruvudaiyar Temple here rivals the Thanjavur Big Temple in its monumental nature and surpasses it in sculptural refinement. It is recognized as a UNESCO World Heritage Site.',
  c.id, d.id, 'Jayankondam', 11.2064, 79.4483,
  'HISTORICAL_FACT', 'Hindu',
  'Built circa 1025 CE by Emperor Rajendra I of the Chola Dynasty.',
  'Represents the architectural and imperial pinnacle of the Chola Empire. The temple features exceptional bronze sculptures, including the famous Bhogasakti and Subrahmanya bronzes.',
  'Maha Shivaratri, Pradosham worship, Aadi Thiruvathirai (Rajendra Chola''s birth star)',
  'Chola stone sculpture, temple music, Bharatanatyam temple tradition, Tevaram singing',
  'Veshti and angavastram for men; silk sarees for women during temple festivals',
  'Temple prasadam such as sweet pongal and sundal',
  '/images/placeholders/place.svg',
  'UNESCO World Heritage Centre: Great Living Chola Temples; Archaeological Survey of India monument records; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.9, 128, 450, 'chola architecture, unesco, shiva temple, rajendra chola, sculpture, gangaikonda cholapuram, ariyalur',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description), full_description = VALUES(full_description);

-- Entry 2: Gangaikonda Cholapuram - The Chola Imperial Capital
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'gangaikonda-cholapuram-the-chola-imperial-capital',
  'Gangaikonda Cholapuram - The Chola Imperial Capital',
  'கங்கைகொண்ட சோழபுரம் - சோழப் பேரரசின் தலைநகரம்',
  'Gangaikondacholapuram; Chola capital after Thanjavur',
  'The capital city founded by Rajendra Chola I after his Ganga campaign, shifting the Chola seat of power from Thanjavur.',
  'After his northern campaign and naval expeditions, Rajendra Chola I founded a new capital named Gangaikonda Cholapuram, meaning the city of the Chola who took the Ganga. The city had a palace, a great temple and a vast irrigation lake, and served as the imperial seat for generations. As Chola power declined, the city faded, leaving the temple, earthworks and palace mounds that visitors see today.',
  c.id, d.id, 'Gangaikonda Cholapuram', 11.2086, 79.4486,
  'HISTORICAL_FACT', 'Tamil Hindu (Chola dynasty)',
  'Founded in the early 11th century CE (traditionally about 1025 CE) by Rajendra Chola I.',
  'Symbol of Chola imperial expansion into the Ganga region and across the seas.',
  'Aadi Thiruvathirai commemorations',
  'Chola architecture, bronzes and inscriptions',
  '/images/placeholders/place.svg',
  'Tamil Nadu State Department of Archaeology; Archaeological Survey of India monument records',
  'APPROVED', 1, 0, 4.8, 95, 380, 'chola capital, rajendra chola, history, imperial chola, ariyalur',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 3: Chola Gangam (Ponneri) Lake
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'chola-gangam-ponneri-lake',
  'Chola Gangam (Ponneri) Lake',
  'சோழகங்கம் ஏரி (பொன்னேரி)',
  'Ponneri Lake; Chola Gangam Eri; Jalasthambham (liquid pillar of victory)',
  'A large medieval reservoir created by Rajendra Chola I as a ''liquid pillar of victory''.',
  'Rajendra Chola I is traditionally said to have created the large Chola Gangam lake near his new capital as a victory monument, filling it with sacred Ganga water brought by his victorious army. The embankment is described in tradition as many miles long and was meant to irrigate the surrounding fields. It is a fine example of Chola water engineering that served both agriculture and royal symbolism.',
  c.id, d.id, 'Gangaikonda Cholapuram (near)', 11.2000, 79.4600,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Tamil community (Chola irrigation heritage)',
  'Early 11th century CE, associated with Rajendra Chola I. The Ganga-water story is a traditional account.',
  'Chola hydraulic engineering and a symbol of imperial victory.',
  'Inscriptions and copper-plate records of the Chola period',
  '/images/placeholders/place.svg',
  'Chola copper-plate and inscription studies; Tamil Nadu State Department of Archaeology',
  'APPROVED', 0, 1, 4.7, 42, 210, 'chola gangam, ponneri, irrigation, water heritage, rajendra chola',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 4: Maligaimedu - Chola Palace Site
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'maligaimedu-chola-palace-site',
  'Maligaimedu - Chola Palace Site',
  'மாளிகைமேடு - சோழர் அரண்மனை இடம்',
  'Maligai Medu; Chola Palace Mound',
  'Archaeological mound traditionally identified with the palace of Rajendra Chola I.',
  'Maligaimedu, near the temple, is traditionally identified as the site of the Chola palace. Excavations here have reported brick structures, pottery and other everyday remains of the Chola period, offering a rare look at royal life beyond the temples. It is one of the key places for understanding the layout of the lost Chola capital.',
  c.id, d.id, 'Maligaimedu, Gangaikonda Cholapuram', 11.2100, 79.4560,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Tamil (Chola royal heritage)',
  '11th century CE, the Chola capital period.',
  'Evidence of Chola palace architecture and daily life.',
  'Chola pottery and brick architecture',
  '/images/placeholders/place.svg',
  'Tamil Nadu State Department of Archaeology excavation reports; Archaeological Survey of India',
  'APPROVED', 0, 1, 4.6, 38, 190, 'maligaimedu, chola palace, excavation, archaeology',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 5: Chandesanugraha Murti and Sculptures of Gangaikonda Cholapuram
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'chandesanugraha-murti-and-sculptures-gangaikonda-cholapuram',
  'Chandesanugraha Murti and Sculptures of Gangaikonda Cholapuram',
  'கங்கைகொண்ட சோழபுரம் சண்டேசனுக்கிரக மூர்த்தி சிற்பங்கள்',
  'Chandesa Anugraha Murti; Chandikeswara Anugraha panel',
  'A masterpiece Chola relief showing Shiva blessing his devotee Chandesa.',
  'The Chandesanugraha panel at the temple shows Shiva and Parvati honouring the devotee Chandesa, who is crowned with a garland. It is celebrated for its graceful composition and the way the figures are placed within the architecture. The temple also holds other carved panels and guardian figures that show the refined style of the Chola stone sculptors.',
  c.id, d.id, 'Gangaikonda Cholapuram', 11.2086, 79.4486,
  'HISTORICAL_FACT', 'Hindu (Shaivite)',
  'Early 11th century CE, Chola period.',
  'Highlights the Shaiva devotional ideal and Chola artistic excellence.',
  'Special worship on Maha Shivaratri',
  'Chola stone carving, iconography',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India monument records; Studies of Chola temple sculpture',
  'APPROVED', 0, 0, 4.9, 74, 310, 'sculpture, chola art, chandesa, relief, iconography',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 6: Rajendra Chola I - The Gangaikonda Chola
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'rajendra-chola-i-the-gangaikonda-chola',
  'Rajendra Chola I - The Gangaikonda Chola',
  'முதலாம் இராஜேந்திர சோழன் - கங்கைகொண்ட சோழன்',
  'Rajendra Chola the Great; Gangaikonda Chola',
  'Chola emperor who extended the empire to the Ganga and overseas and founded Gangaikonda Cholapuram.',
  'Rajendra Chola I, son of Rajaraja Chola I, ruled from 1014 to 1044 CE and took the Chola empire to its height. His army marched to the Ganga region, earning him the title Gangaikonda Chola, and his navy campaigned against the Srivijaya kingdom across the sea. He built a new capital, a great temple and a vast lake to celebrate his victories.',
  c.id, d.id, 'Gangaikonda Cholapuram', 11.2086, 79.4486,
  'HISTORICAL_FACT', 'Tamil Hindu (Chola dynasty)',
  'Reigned 1014-1044 CE (a co-regent from about 1012 CE is also noted by scholars).',
  'Remembered as one of the greatest Tamil emperors and a patron of art and temples.',
  'Aadi Thiruvathirai marks his birth star',
  'Chola architecture, bronzes and inscriptions',
  '/images/placeholders/place.svg',
  'Studies of Chola history; Chola inscriptions',
  'APPROVED', 1, 0, 5.0, 110, 520, 'rajendra chola, emperor, chola history, srivijaya, ganga expedition',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'CULTURAL_PERSONALITIES' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 7: Thirumazhapadi Vaidyanathaswamy Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_cuisine, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thirumazhapadi-vaidyanathaswamy-temple',
  'Thirumazhapadi Vaidyanathaswamy Temple',
  'திருமழபாடி வைத்தியநாதசுவாமி கோயில்',
  'Thirumalapadi Temple; Thirumazhapadi Shiva Temple',
  'Ancient Shiva temple on the banks of the Kollidam, praised in the Tevaram hymns.',
  'Thirumazhapadi is an old Shiva temple on the Kollidam river that is counted among the Tevaram Paadal Petra Sthalams, the shrines praised by the Nayanmar saints. The temple is dedicated to Shiva as Vaidyanathaswamy and has long been a place of regular worship and annual festivals. It reflects the strong Shaiva tradition of the Cauvery and Kollidam belt.',
  c.id, d.id, 'Thirumazhapadi', 10.9500, 79.1500,
  'HISTORICAL_FACT', 'Hindu (Shaivite)',
  'Ancient origin, praised in the Tevaram (7th-9th century CE); the present structure reflects Chola-era patronage.',
  'A Paadal Petra Sthalam on the Kollidam, a local pilgrimage centre.',
  'Maha Shivaratri, Pradosham, annual Brahmotsavam',
  'Tevaram singing, temple music',
  'Temple prasadam',
  '/images/placeholders/place.svg',
  'Tevaram hymn tradition; Tamil Nadu HR&CE Department',
  'APPROVED', 0, 0, 4.7, 52, 260, 'thirumazhapadi, shiva temple, tevaram, paadal petra sthalam, kollidam',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 8: Karaivetti Bird Sanctuary
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'karaivetti-bird-sanctuary',
  'Karaivetti Bird Sanctuary',
  'கரைவெட்டி பறவைகள் சரணாலயம்',
  'Karaivetti Wetland; Karaivetti Tank',
  'A seasonal wetland refuge for migratory waterbirds near Ariyalur.',
  'Karaivetti is a freshwater tank and wetland that hosts migratory and resident waterbirds, especially in the winter months after the monsoon. It is a quiet, lesser-known nature spot that shows the link between traditional village tanks and wildlife. The best time to visit is usually between November and February.',
  c.id, d.id, 'Karaivetti', 11.1300, 79.1200,
  'HISTORICAL_FACT', 'General',
  'A traditional irrigation tank later protected as a bird sanctuary.',
  'Shows how village tank heritage supports biodiversity.',
  '/images/placeholders/place.svg',
  'Tamil Nadu Forest Department',
  'APPROVED', 0, 1, 4.8, 64, 290, 'bird sanctuary, wetland, migratory birds, nature, ariyalur',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 9: Cretaceous Fossil Heritage of Ariyalur
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'cretaceous-fossil-heritage-of-ariyalur',
  'Cretaceous Fossil Heritage of Ariyalur',
  'அரியலூர் கிரெட்டேசியஸ் புதைபடிவ மரபு',
  'Ariyalur Group fossils; Ariyalur Fossil Beds',
  'Ariyalur is known to geologists for its Cretaceous marine fossil beds, with reports of dinosaur remains at Kallamedu.',
  'The rocks around Ariyalur belong to the Cretaceous period and are well known to geologists as the Ariyalur Group, rich in marine fossils. Reports also mention fossil finds of large dinosaur bones at Kallamedu. These deep-time records add a natural-history layer to the district''s cultural heritage and its limestone-based industry.',
  c.id, d.id, 'Ariyalur and Kallamedu area', 11.1400, 79.0800,
  'ARCHAEOLOGICAL_SCHOLARLY', 'General',
  'Cretaceous period, about 66 to 145 million years ago.',
  'A scientific heritage site for geology and palaeontology students.',
  '/images/placeholders/place.svg',
  'Geological Survey of India; Tamil Nadu geology and mining records',
  'APPROVED', 0, 1, 4.9, 81, 350, 'fossils, cretaceous, geology, dinosaur, kallamedu',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 10: Rural Cuisine of Ariyalur: Cashew, Millets and Kambu Koozh
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, traditional_cuisine, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'rural-cuisine-of-ariyalur-cashew-millets-kambu-koozh',
  'Rural Cuisine of Ariyalur: Cashew, Millets and Kambu Koozh',
  'அரியலூர் கிராமிய உணவு: முந்திரி, சிறுதானியங்கள், கம்பங்கூழ்',
  'Ariyalur Village Food; Millet and Cashew Foods',
  'Everyday rural food of Ariyalur built around millets, cashew, pulses and seasonal greens.',
  'The district grows cashew and millets such as pearl millet (kambu), and its village cooking uses them in porridges, rotis and sweets. Kambu koozh, a cooling pearl millet porridge served with buttermilk and pickles, is a classic summer meal. Meals also feature seasonal greens, country-chicken curries and cashew-based sweets.',
  c.id, d.id, 'Ariyalur district villages', 11.1400, 79.0800,
  'COMMUNITY_ORAL_HISTORY', 'Tamil rural community',
  'Traditional agrarian food culture passed down in homes.',
  'Reflects healthy millet-based eating of rural Tamil Nadu.',
  'Served during harvest and temple festivals',
  'Kambu Koozh, kali, keerai masiyal, cashew sweets, country chicken curry',
  '/images/placeholders/food.svg',
  'Regional food documentation; Community oral tradition',
  'APPROVED', 0, 0, 4.8, 56, 270, 'cashew, millet, kambu koozh, village food, ariyalur food',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 11: Aadi Thiruvathirai Festival at Gangaikonda Cholapuram
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'aadi-thiruvathirai-festival-gangaikonda-cholapuram',
  'Aadi Thiruvathirai Festival at Gangaikonda Cholapuram',
  'கங்கைகொண்ட சோழபுரத்தில் ஆடித் திருவாதிரை விழா',
  'Aadi Thiruvathirai; Rajendra Chola Birth Star Celebration',
  'Annual celebration of Rajendra Chola I''s birth star with temple worship and cultural programmes.',
  'Each year during the Tamil month of Aadi, the Thiruvathirai star is observed at Gangaikonda Cholapuram as the birth star of Rajendra Chola I. The day features special worship at the Brihadisvara temple and cultural events remembering the Chola emperor. In recent years it has also been marked with official celebrations that bring historians, artists and visitors together.',
  c.id, d.id, 'Gangaikonda Cholapuram', 11.2086, 79.4486,
  'HISTORICAL_FACT', 'Hindu (Shaivite) and Tamil heritage community',
  'Linked to the Thiruvathirai birth star of Rajendra Chola I.',
  'Keeps alive the memory of the Chola emperor and the capital.',
  'Special abhishekam, Tevaram recital, Bharatanatyam and music programmes',
  'Bharatanatyam, Tevaram singing, Nadaswaram',
  'Veshti, angavastram and silk sarees',
  'Temple prasadam',
  '/images/placeholders/place.svg',
  'Tamil Nadu Tourism; Temple tradition',
  'APPROVED', 0, 0, 4.9, 68, 330, 'aadi thiruvathirai, festival, rajendra chola, gangaikonda cholapuram',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 12: Aadi Perukku on the Kollidam Banks
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing, traditional_cuisine,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'aadi-perukku-on-the-kollidam-banks',
  'Aadi Perukku on the Kollidam Banks',
  'கொள்ளிடக் கரையில் ஆடிப்பெருக்கு',
  'Aadi 18; Padhinettam Perukku',
  'Riverside festival on the 18th day of Aadi when villagers worship the river and share variety rice.',
  'On the 18th day of the Tamil month of Aadi, families gather on the banks of the Kollidam and other rivers to thank the water for the new farming season. They offer flowers, lamps and food to the river, and women tie sacred threads for family wellbeing. Picnic-style meals of lemon rice, coconut rice and sweet pongal are shared on the riverbank.',
  c.id, d.id, 'Kollidam river villages', 11.0500, 79.2000,
  'COMMUNITY_ORAL_HISTORY', 'Tamil agrarian community',
  'Traditional river worship linked to the start of the farming season.',
  'Celebrates water, agriculture and family bonds.',
  'River puja, tying of sacred threads, shared variety rice meals',
  'Folk songs, kolam',
  'New clothes, silk sarees and veshti',
  'Lemon rice, coconut rice, tamarind rice, sweet pongal',
  '/images/placeholders/place.svg',
  'Community oral tradition; Tamil festival calendar',
  'APPROVED', 0, 0, 4.8, 45, 220, 'aadi perukku, kollidam, river worship, village festival',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 13: Folk Performing Arts of Ariyalur: Oyilattam, Karagattam and Therukoothu
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'folk-performing-arts-of-ariyalur-oyilattam-karagattam-therukoothu',
  'Folk Performing Arts of Ariyalur: Oyilattam, Karagattam and Therukoothu',
  'அரியலூர் நாட்டுப்புறக் கலைகள்: ஒயிலாட்டம், கரகாட்டம், தெருக்கூத்து',
  'Ariyalur Folk Dances; Village Koothu',
  'Temple-festival folk arts performed across Ariyalur''s villages.',
  'During village temple festivals in Ariyalur, folk artists perform Oyilattam (a group dance with colourful steps), Karagattam (dance with a decorated pot on the head) and Therukoothu (street theatre telling epic stories). These arts are usually passed down in families and accompanied by Parai, Thavil or Nadaswaram music. They keep alive stories from the epics and local deities.',
  c.id, d.id, 'Ariyalur district villages', 11.1400, 79.0800,
  'COMMUNITY_ORAL_HISTORY', 'Tamil rural community',
  'Centuries-old folk traditions linked to village temple festivals.',
  'Living performing traditions that preserve local stories and community identity.',
  'Mariamman temple festivals, Pongal, Aadi festivals',
  'Parai, Thavil, Nadaswaram, folk songs',
  'Bright costumes, anklets and head scarves for dancers',
  '/images/placeholders/dance.svg',
  'Community oral tradition; Tamil Nadu Iyal Isai Nataka Manram',
  'APPROVED', 0, 0, 4.7, 39, 210, 'oyilattam, karagattam, therukoothu, folk dance, village festival',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 14: Temple Music of Ariyalur: Nadaswaram and Thavil
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, related_arts, traditional_clothing,
  cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'temple-music-of-ariyalur-nadaswaram-and-thavil',
  'Temple Music of Ariyalur: Nadaswaram and Thavil',
  'அரியலூர் கோயில் இசை: நாதஸ்வரம், தவில்',
  'Periya Melam; Nadaswaram-Thavil tradition',
  'Nadaswaram and Thavil music that accompanies temple rituals and festivals in the district.',
  'Nadaswaram, a long double-reed wind instrument, and Thavil, a barrel drum, are played together at temple ceremonies, processions and weddings in Ariyalur, as in the rest of Tamil Nadu. The music is traditionally taught within artist families and is considered auspicious. Special ragas are played at particular times of the temple day.',
  c.id, d.id, 'Ariyalur district temples', 11.1400, 79.0800,
  'COMMUNITY_ORAL_HISTORY', 'Hindu temple tradition and Tamil artist communities',
  'Long-standing temple music tradition of the Tamil country.',
  'Auspicious music essential for festivals and rituals.',
  'Temple processions, weddings, Maha Shivaratri',
  'Tevaram singing, Bharatanatyam',
  'Veshti and angavastram for musicians',
  '/images/placeholders/music.svg',
  'Tamil Nadu Iyal Isai Nataka Manram; Community oral tradition',
  'APPROVED', 0, 0, 4.8, 51, 230, 'nadaswaram, thavil, temple music, melam',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);

-- Entry 15: Pazhuvettaraiyars of Keezhapaluvur
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  related_arts, cover_image_url, source_references, status, featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'pazhuvettaraiyars-of-keezhapaluvur',
  'Pazhuvettaraiyars of Keezhapaluvur',
  'கீழப்பழுவூர் பழுவேட்டரையர்கள்',
  'Pazhuvur Chieftains; Pazhuvettaraiyar Family',
  'Chola-era chieftain family from the Pazhuvur region, known from inscriptions.',
  'The Pazhuvettaraiyars were a powerful family of chieftains from the Pazhuvur area who served the Cholas as officers and nobles. They appear in inscriptions and are remembered in popular culture through Kalki''s novel Ponniyin Selvan. Their name is linked with Keezhapaluvur in the Ariyalur region, which preserves temples and records of the period.',
  c.id, d.id, 'Keezhapaluvur', 11.1000, 79.1000,
  'ARCHAEOLOGICAL_SCHOLARLY', 'Tamil Hindu (Chola feudatories)',
  'Active during the 9th-11th century CE Chola period according to inscriptions.',
  'Shows the role of local chieftains in the Chola administration and in later popular storytelling.',
  'Chola inscriptions and temple patronage',
  '/images/placeholders/place.svg',
  'Chola inscriptions; Kalki, Ponniyin Selvan (literary link)',
  'APPROVED', 0, 1, 4.9, 60, 310, 'pazhuvettaraiyar, pazhuvur, chola chieftains, ponniyin selvan',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'CULTURAL_PERSONALITIES' AND d.code = 'ARI'
ON DUPLICATE KEY UPDATE title = VALUES(title), short_description = VALUES(short_description);


-- 3. Insert 16 Chatbot Knowledge Entries
INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
VALUES
('ARIYALUR_OVERVIEW', 'ariyalur, district, overview, about ariyalur, chola, cashew', 'HISTORICAL_MONUMENTS', 'ARI',
 'Ariyalur is a district in central Tamil Nadu and was the heartland of the imperial Cholas. It is best known for Gangaikonda Cholapuram, the UNESCO-listed Chola capital, along with Thirumazhapadi temple, Karaivetti Bird Sanctuary and Cretaceous fossil beds.',
 'அரியலூர் மாவட்டம் தமிழ்நாட்டின் மத்திய பகுதியில் உள்ளது. கங்கைகொண்ட சோழபுரம், திருமழபாடி கோயில், கரைவெட்டி பறவைகள் சரணாலயம் போன்றவை இங்கு புகழ்பெற்றவை.', 1, NULL)
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'GANGAIKONDA_TEMPLE', 'gangaikonda cholapuram, brihadisvara, rajendra chola temple, unesco, chola temple', 'HISTORICAL_MONUMENTS', 'ARI',
 'The Gangaikonda Cholapuram Brihadisvara temple was built by Rajendra Chola I in the early 11th century. It is part of the UNESCO Great Living Chola Temples along with the temples at Thanjavur and Darasuram.',
 'கங்கைகொண்ட சோழபுரம் பிரகதீஸ்வரர் கோயிலை முதலாம் இராஜேந்திர சோழன் 11ஆம் நூற்றாண்டில் கட்டினார். இது யுனெஸ்கோ உலகப் பாரம்பரியச் சின்னமான பெரிய சோழர் கோயில்களில் ஒன்று.', 1, id
FROM cultural_entries WHERE slug = 'gangaikonda-cholapuram-temple' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'GANGAIKONDA_CAPITAL', 'chola capital, gangaikonda cholapuram, imperial capital, rajendra chola city', 'HISTORICAL_MONUMENTS', 'ARI',
 'Rajendra Chola I founded Gangaikonda Cholapuram as the new Chola capital after his campaign to the Ganga. It had a palace, a great temple and a huge lake.',
 'வடக்கே கங்கை வரை படையெடுத்து வென்ற இராஜேந்திர சோழன் இந்நகரை சோழப் பேரரசின் புதிய தலைநகராக உருவாக்கினார்.', 1, id
FROM cultural_entries WHERE slug = 'gangaikonda-cholapuram-the-chola-imperial-capital' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'CHOLA_GANGAM_LAKE', 'chola gangam, ponneri lake, jalasthambham, irrigation lake', 'ARCHAEOLOGICAL_INSCRIPTIONS', 'ARI',
 'Chola Gangam (Ponneri) Lake is a large reservoir created by Rajendra Chola I as a liquid pillar of victory, traditionally said to be filled with Ganga water.',
 'சோழகங்கம் ஏரி இராஜேந்திர சோழனால் வெற்றியின் நினைவாக உருவாக்கப்பட்ட பெரிய நீர்த்தேக்கம் ஆகும்.', 1, id
FROM cultural_entries WHERE slug = 'chola-gangam-ponneri-lake' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'MALIGAIMEDU_PALACE', 'maligaimedu, chola palace, excavation, palace site', 'ARCHAEOLOGICAL_INSCRIPTIONS', 'ARI',
 'Maligaimedu is the mound traditionally identified as the Chola palace site, where excavations have reported brickwork and pottery of the period.',
 'மாளிகைமேடு இராஜேந்திர சோழனின் அரண்மனை இருந்த இடமாகக் கருதப்படுகிறது; அகழாய்வில் செங்கல் கட்டுமானங்கள், மட்பாண்டங்கள் கிடைத்துள்ளன.', 1, id
FROM cultural_entries WHERE slug = 'maligaimedu-chola-palace-site' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'CHANDESANUGRAHA_SCULPTURE', 'chandesanugraha, chandesa, chola sculpture, relief, gangaikonda sculpture', 'ARCHITECTURE_SCULPTURE', 'ARI',
 'The Chandesanugraha Murti is a famous Chola relief showing Shiva blessing his devotee Chandesa.',
 'சண்டேசனுக்கிரக மூர்த்தி சிற்பம் சிவபெருமான் சண்டேசருக்கு அருள்புரிவதைக் காட்டும் புகழ்பெற்ற சோழர் காலச் சிற்பமாகும்.', 1, id
FROM cultural_entries WHERE slug = 'chandesanugraha-murti-and-sculptures-gangaikonda-cholapuram' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'RAJENDRA_CHOLA', 'rajendra chola, gangaikonda chola, chola emperor, srivijaya, ganga expedition', 'CULTURAL_PERSONALITIES', 'ARI',
 'Rajendra Chola I ruled from 1014 to 1044 CE. He marched to the Ganga, won the title Gangaikonda Chola, and sent a naval expedition overseas.',
 'முதலாம் இராஜேந்திர சோழன் (கி.பி. 1014-1044) கங்கை வரை படையெடுத்து கங்கைகொண்ட சோழன் என்ற பட்டம் பெற்றார்; கடல் கடந்தும் படை அனுப்பினார்.', 1, id
FROM cultural_entries WHERE slug = 'rajendra-chola-i-the-gangaikonda-chola' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'THIRUMAZHAPADI_TEMPLE', 'thirumazhapadi, vaidyanathaswamy, kollidam temple, tevaram temple', 'HINDU_HERITAGE', 'ARI',
 'Thirumazhapadi Vaidyanathaswamy Temple is an ancient Shiva temple on the Kollidam, counted among the Tevaram Paadal Petra Sthalams.',
 'திருமழபாடி வைத்தியநாதசுவாமி கோயில் கொள்ளிடக் கரையில் உள்ள தேவாரப் பாடல் பெற்ற சிவன் தலம்.', 1, id
FROM cultural_entries WHERE slug = 'thirumazhapadi-vaidyanathaswamy-temple' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'KARAIVETTI_SANCTUARY', 'karaivetti, bird sanctuary, migratory birds, wetland, ariyalur birds', 'HIDDEN_GEMS', 'ARI',
 'Karaivetti Bird Sanctuary is a freshwater wetland near Ariyalur that hosts migratory waterbirds in winter. November to February is usually the best time to visit.',
 'கரைவெட்டி பறவைகள் சரணாலயம் குளிர்காலத்தில் வலசைப் பறவைகள் வரும் நீர்நிலைப் பகுதி.', 1, id
FROM cultural_entries WHERE slug = 'karaivetti-bird-sanctuary' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'ARIYALUR_FOSSILS', 'ariyalur fossils, cretaceous, dinosaur, kallamedu, geology', 'HIDDEN_GEMS', 'ARI',
 'Ariyalur is known for Cretaceous marine fossil beds, and there are reports of dinosaur bones at Kallamedu.',
 'அரியலூர் பகுதி கிரெட்டேசியஸ் காலத்துக் கடல் புதைபடிவங்களுக்குப் புகழ்பெற்றது.', 1, id
FROM cultural_entries WHERE slug = 'cretaceous-fossil-heritage-of-ariyalur' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'ARIYALUR_FOOD', 'ariyalur food, cuisine, cashew, kambu koozh, millet, what to eat', 'CUISINE_RECIPES', 'ARI',
 'Ariyalur''s village cuisine uses millets and cashew. Kambu koozh, a pearl millet porridge, is a popular summer dish.',
 'அரியலூரில் முந்திரி, கம்பு போன்ற சிறுதானியங்கள் பயிரிடப்படுகின்றன; கம்பங்கூழ் பிரபலமான உணவு.', 1, id
FROM cultural_entries WHERE slug = 'rural-cuisine-of-ariyalur-cashew-millets-kambu-koozh' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'AADI_THIRUVATHIRAI', 'aadi thiruvathirai, rajendra chola birthday, gangaikonda festival, festival', 'FESTIVALS_CELEBRATIONS', 'ARI',
 'Aadi Thiruvathirai is observed at Gangaikonda Cholapuram in the Tamil month of Aadi as the birth star of Rajendra Chola I.',
 'ஆடி மாதத் திருவாதிரை நாள் இராஜேந்திர சோழனின் பிறந்த நட்சத்திரமாகக் கொண்டாடப்படுகிறது.', 1, id
FROM cultural_entries WHERE slug = 'aadi-thiruvathirai-festival-gangaikonda-cholapuram' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'AADI_PERUKKU', 'aadi perukku, aadi 18, kollidam, river festival, variety rice', 'VILLAGE_CUSTOMS', 'ARI',
 'Aadi Perukku is celebrated on the 18th day of Aadi, when people worship the river and share variety rice on the banks of the Kollidam.',
 'ஆடி 18 அன்று ஆற்றங்கரையில் நீரை வணங்கி கலவை சாதங்களுடன் கொண்டாடுவது ஆடிப்பெருக்கு.', 1, id
FROM cultural_entries WHERE slug = 'aadi-perukku-on-the-kollidam-banks' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'ARIYALUR_FOLK_ARTS', 'oyilattam, karagattam, therukoothu, folk dance, village arts', 'DANCE_TRADITIONS', 'ARI',
 'Oyilattam, Karagattam and Therukoothu are folk arts performed at village temple festivals in Ariyalur.',
 'ஒயிலாட்டம், கரகாட்டம், தெருக்கூத்து ஆகியவை கோயில் திருவிழாக்களில் நடைபெறும் நாட்டுப்புறக் கலைகள்.', 1, id
FROM cultural_entries WHERE slug = 'folk-performing-arts-of-ariyalur-oyilattam-karagattam-therukoothu' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'ARIYALUR_TEMPLE_MUSIC', 'nadaswaram, thavil, temple music, melam', 'MUSIC_TRADITIONS', 'ARI',
 'Nadaswaram and Thavil are the main instruments of temple music in Ariyalur, played at rituals, processions and weddings.',
 'நாதஸ்வரமும் தவிலும் கோயில் விழாக்களின் முக்கிய இசைக்கருவிகள்.', 1, id
FROM cultural_entries WHERE slug = 'temple-music-of-ariyalur-nadaswaram-and-thavil' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);

INSERT INTO chatbot_qa_knowledge (intent_key, keywords, category_code, district_code, response_en, response_ta, verified, related_entry_id)
SELECT 'PAZHUVETTARAIYAR', 'pazhuvettaraiyar, pazhuvur, keezhapaluvur, ponniyin selvan, chola chieftains', 'CULTURAL_PERSONALITIES', 'ARI',
 'The Pazhuvettaraiyars were a Chola-era chieftain family from Pazhuvur, known from inscriptions and from Kalki''s novel Ponniyin Selvan.',
 'பழுவேட்டரையர்கள் பழுவூரைச் சேர்ந்த சோழர்கால தலைவர் குடும்பம்; கல்வெட்டுகளில் இடம்பெறுகின்றனர்.', 1, id
FROM cultural_entries WHERE slug = 'pazhuvettaraiyars-of-keezhapaluvur' LIMIT 1
ON DUPLICATE KEY UPDATE response_en = VALUES(response_en), response_ta = VALUES(response_ta);
