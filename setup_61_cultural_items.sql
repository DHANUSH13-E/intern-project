-- ===================================================================
-- TAMIL NADU CULTURE MASTER DATASET SEED SCRIPT (38 Districts, 20 Categories, 61 Items)
-- ===================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. CATEGORIES (20)
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('HISTORICAL_MONUMENTS', 'Historical Places and Monuments', 'வரலாற்று இடங்கள்', 'Historical Places and Monuments of Tamil Nadu', 'bi-bank', 1, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('RELIGIOUS_HERITAGE', 'Religious Heritage', 'ஆன்மீக மரபு', 'Religious Heritage of Tamil Nadu', 'bi-flower1', 2, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('HINDU_HERITAGE', 'Hindu Cultural Heritage', 'இந்து பண்பாட்டு மரபு', 'Hindu Cultural Heritage of Tamil Nadu', 'bi-sun', 3, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('CHRISTIAN_HERITAGE', 'Christian Heritage', 'கிறிஸ்தவ மரபு', 'Christian Heritage of Tamil Nadu', 'bi-cross', 4, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('ISLAMIC_HERITAGE', 'Islamic Heritage', 'இஸ்லாமிய மரபு', 'Islamic Heritage of Tamil Nadu', 'bi-moon-stars', 5, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('JAIN_HERITAGE', 'Jain Heritage', 'சமண மரபு', 'Jain Heritage of Tamil Nadu', 'bi-circle', 6, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('BUDDHIST_HERITAGE', 'Buddhist Heritage', 'பௌத்த மரபு', 'Buddhist Heritage of Tamil Nadu', 'bi-disc', 7, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('COMMUNITY_TRADITIONS', 'Other Religious Traditions', 'பிற சமய மரபுகள்', 'Other Religious Traditions of Tamil Nadu', 'bi-people', 8, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('MUSIC_TRADITIONS', 'Folk and Classical Music', 'இசை மரபு', 'Folk and Classical Music of Tamil Nadu', 'bi-music-note-beamed', 9, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('DANCE_TRADITIONS', 'Folk and Classical Dance', 'நடன மரபு', 'Folk and Classical Dance of Tamil Nadu', 'bi-person-arms-up', 10, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('TRADITIONAL_DRESS', 'Traditional Dress & Textiles', 'உடை மரபு', 'Traditional Dress & Textiles of Tamil Nadu', 'bi-scissors', 11, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('CUISINE_RECIPES', 'Cuisine & Traditional Recipes', 'உணவு முறை', 'Cuisine & Traditional Recipes of Tamil Nadu', 'bi-cup-hot', 12, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('FESTIVALS_CELEBRATIONS', 'Festivals and Celebrations', 'திருவிழாக்கள்', 'Festivals and Celebrations of Tamil Nadu', 'bi-stars', 13, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('FOLKLORE_LEGENDS', 'Folklore & Oral Histories', 'நாட்டுப்புற கதைகள்', 'Folklore & Oral Histories of Tamil Nadu', 'bi-chat-quote', 14, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('ARCHITECTURE_SCULPTURE', 'Architecture & Sculpture', 'கட்டிடக்கலை', 'Architecture & Sculpture of Tamil Nadu', 'bi-columns-gap', 15, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('TRADITIONAL_CRAFTS', 'Traditional Crafts & Handloom', 'கைவினைப் பொருட்கள்', 'Traditional Crafts & Handloom of Tamil Nadu', 'bi-palette', 16, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('VILLAGE_CUSTOMS', 'Village Traditions', 'கிராமிய மரபுகள்', 'Village Traditions of Tamil Nadu', 'bi-tree', 17, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('CULTURAL_PERSONALITIES', 'Cultural Personalities', 'பண்பாட்டு ஆளுமைகள்', 'Cultural Personalities of Tamil Nadu', 'bi-person-badge', 18, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('ARCHAEOLOGICAL_INSCRIPTIONS', 'Archaeological Heritage', 'தொல்லியல் மரபு', 'Archaeological Heritage of Tamil Nadu', 'bi-geo-alt', 19, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);
INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES ('HIDDEN_GEMS', 'Hidden & Lesser-Known Places', 'அறியப்படாத இடங்கள்', 'Hidden & Lesser-Known Places of Tamil Nadu', 'bi-compass', 20, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);

-- 2. DISTRICTS (38)
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('ARL', 'Ariyalur', 'அரியலூர்', 'Central', 11.1401, 79.0786, 'Known for fossil-rich limestone reserves and Gangaikonda Cholapuram.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('CHG', 'Chengalpattu', 'செங்கல்பட்டு', 'North', 12.6841, 79.9836, 'Coastal district famous for UNESCO site Mamallapuram and Vedanthangal bird sanctuary.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('CHN', 'Chennai', 'சென்னை', 'North', 13.0827, 80.2707, 'The capital of Tamil Nadu, global hub for Carnatic music, Bharatanatyam, and Dravidian culture.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('CBE', 'Coimbatore', 'கோயம்புத்தூர்', 'West', 11.0168, 76.9558, 'The Manchester of South India, set on the Noyyal River at the foothills of the Western Ghats.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('CDM', 'Cuddalore', 'கடலூர்', 'Central', 11.748, 79.7714, 'Historic coastal district featuring Chidambaram Nataraja Temple and Pichavaram mangroves.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('DHP', 'Dharmapuri', 'தருமபுரி', 'West', 12.1211, 78.1582, 'Known for the majestic Hogenakkal Falls on the Kaveri river and Adhiyamankottai heritage.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('DGL', 'Dindigul', 'திண்டுக்கல்', 'South', 10.3673, 77.9803, 'Famous for handcrafted iron locks, Palani Murugan Temple, and fragrant Seeraga Samba Biryani.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('ERD', 'Erode', 'ஈரோடு', 'West', 11.341, 77.7172, 'The Turmeric City of India, located along the Bhavani and Kaveri rivers.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('KLK', 'Kallakurichi', 'கள்ளக்குறிச்சி', 'Central', 11.7381, 78.9619, 'Scenic agrarian district featuring the Kalvarayan Hills and Megam Falls.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('KCH', 'Kanchipuram', 'காஞ்சிபுரம்', 'North', 12.8342, 79.7036, 'The City of Thousand Temples and the cradle of legendary pure mulberry silk sarees.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('KAN', 'Kanyakumari', 'கன்னியாகுமரி', 'South', 8.0883, 77.5385, 'The southernmost tip of the Indian mainland, confluence of the three oceans.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('KRR', 'Karur', 'கரூர்', 'Central', 10.9601, 78.0766, 'Ancient Chera capital on the Amaravathi river, prominent textile hub.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('KRG', 'Krishnagiri', 'கிருஷ்ணகிரி', 'West', 12.5186, 78.2137, 'Mango capital of Tamil Nadu with ancient forts and prehistoric dolmens.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('MDU', 'Madurai', 'மதுரை', 'South', 9.9252, 78.1198, 'The Athens of the East, Tamil Sangam birthplace, home of Meenakshi Amman Temple.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('MYD', 'Mayiladuthurai', 'மயிலாடுதுறை', 'Central', 11.1075, 79.6522, 'Temple heartland on the Kaveri delta, famous for Mayuranathar Temple and Navagraha circuits.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('NGP', 'Nagapattinam', 'நாகப்பட்டினம்', 'Central', 10.7656, 79.8424, 'Ancient maritime port, home to Nagore Dargah and Velankanni Basilica.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('NMK', 'Namakkal', 'நாமக்கல்', 'West', 11.2189, 78.1674, 'Known for the towering Anjaneyar statue, rock-cut Narasimha temple, and Kolli Hills.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('NIL', 'The Nilgiris', 'நீலகிரி', 'West', 11.4102, 76.695, 'Blue Mountains featuring UNESCO Mountain Railway, Toda tribal culture, and tea gardens.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('PBL', 'Perambalur', 'பெரம்பலூர்', 'Central', 11.2342, 78.882, 'Central district known for Ranjankudi Fort and fossil tree national monument.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('PDK', 'Pudukkottai', 'புதுக்கோட்டை', 'Central', 10.3797, 78.8208, 'Princely state legacy, famous for Sittanavasal rock-cut Jain cave paintings and Kudumiyanmalai.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('RAM', 'Ramanathapuram', 'ராமநாதபுரம்', 'South', 9.3639, 78.8395, 'Maritime coastal district, pilgrimage hub of Rameswaram Ramanathaswamy Temple and Pamban Bridge.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('RNP', 'Ranipet', 'ராணிப்பேட்டை', 'North', 12.9299, 79.333, 'Industrial leather hub alongside the Palar River with historic Nawabi connections.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('SLM', 'Salem', 'சேலம்', 'West', 11.6643, 78.146, 'The Mango City and Steel City, gateway to the Yercaud Shevaroy Hills.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('SVG', 'Sivaganga', 'சிவகங்கை', 'South', 9.8433, 78.4809, 'Chettinad heritage heartland, Chettiar mansions, Athangudi tiles, and spicy cuisine.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TSI', 'Tenkasi', 'தென்காசி', 'South', 8.9594, 77.3149, 'The Kashi of the South, renowned for Kasi Viswanathar Temple and Courtallam waterfalls.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TNJ', 'Thanjavur', 'தஞ்சாவூர்', 'Central', 10.787, 79.1378, 'The cultural capital of the Cholas, home of Brihadisvara Temple, Thanjavur paintings, and Veena.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('THN', 'Theni', 'தேனி', 'South', 10.0104, 77.4768, 'Lush Western Ghats valley, famous for cardamom, grapes, Suruli Falls, and Megamalai.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TUT', 'Thoothukudi', 'தூத்துக்குடி', 'South', 8.7642, 78.1348, 'Pearl City of India, sea salt production, Macaroon confectionery, and Tiruchendur Murugan Temple.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TRC', 'Tiruchirappalli', 'திருச்சிராப்பள்ளி', 'Central', 10.7905, 78.7047, 'Geographical heart of Tamil Nadu, Rockfort Ucchi Pillayar Temple, and Srirangam Ranganathaswamy Temple.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TIR', 'Tirunelveli', 'திருநெல்வேலி', 'South', 8.7139, 77.7567, 'City of Nellaiappar on the perennial Thamirabarani river, home to melt-in-the-mouth Halwa.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TPT', 'Tirupathur', 'திருப்பத்தூர்', 'North', 12.4958, 78.5678, 'Known for Yelagiri hill station, Jalagamparai falls, and leather processing industries.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TPR', 'Tiruppur', 'திருப்பூர்', 'West', 11.1085, 77.3411, 'Knitwear Capital of India, heritage of Kumaran patriot, and Noyyal river heritage.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TVL', 'Tiruvallur', 'திருவள்ளூர்', 'North', 13.1432, 79.9074, 'Veeraraghava Swamy temple town and Pulicat lake flamingo sanctuary.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TVM', 'Tiruvannamalai', 'திருவண்ணாமலை', 'North', 12.2253, 79.0747, 'Spiritual center of Agni (Fire), Annamalaiyar Temple, Giri Valam, and Ramana Maharshi Ashram.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('TVR', 'Tiruvarur', 'திருவாரூர்', 'Central', 10.7725, 79.6365, 'Birthplace of the Trinity of Carnatic Music, giant Thyagaraja Temple chariot (Aazhi Ther).')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('VEL', 'Vellore', 'வேலூர்', 'North', 12.9165, 79.1325, 'Historic 16th-century granite fort with moat, Jalakandeswarar temple, and Sripuram Golden Temple.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('VLP', 'Viluppuram', 'விழுப்புரம்', 'Central', 11.9401, 79.4861, 'Home to the impregnable Gingee Fort (Troy of the East) and Koovagam Koothandavar Festival.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES ('VNR', 'Virudhunagar', 'விருதுநகர்', 'South', 9.5872, 77.9514, 'Birthplace of Kamarajar, trade center, famous for Srivilliputhur Andal Temple and Palkova.')
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);

-- 3. CULTURAL ENTRIES (61)
-- Item 1: Bharatanatyam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'bharatanatyam',
  'Bharatanatyam',
  'பரதநாட்டியம்',
  'பரதநாட்டியம்',
  'India''s oldest classical dance tradition, originating in the temples of Tamil Nadu.',
  'Bharatanatyam is renowned for its geometric poses (aramandi), intricate footwork (adavus), expressive face and eye gestures (abhinaya), and devotion (bhakti). Rooted in the Natya Shastra, it was preserved and nurtured by Devadasis in Thanjavur and codified by the Thanjavur Quartet.',
  c.id,
  d.id,
  'Brihadisvara Temple, Thanjavur',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient (2nd Century BCE - Present)',
  'India''s oldest classical dance tradition, originating in the temples of Tamil Nadu.',
  '',
  '/images/placeholders/dance.svg',
  'Sangeet Natak Akademi; Kalakshetra Foundation',
  'APPROVED',
  1,
  0,
  4.8,
  45,
  120,
  'classical, temple, natya, margazhi, carnatic',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 2: Karagattam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'karagattam',
  'Karagattam',
  'கரகாட்டம்',
  'கரகாட்டம்',
  'Vibrant folk dance balancing brass or mud pots decorated with flowers on the head.',
  'Karagattam is dedicated to Mariamman, the goddess of rain and fertility. Dancers balance heavy water pots (Karagam) without holding them with their hands while performing acrobatic feats.',
  c.id,
  d.id,
  'Madurai region',
  9.9252,
  78.1198,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Sangam Era to Present',
  'Vibrant folk dance balancing brass or mud pots decorated with flowers on the head.',
  '',
  '/images/placeholders/dance.svg',
  'Tamil Nadu Folk Arts Academy',
  'APPROVED',
  1,
  0,
  4.8,
  48,
  137,
  'folk, mariamman, festival, acrobatic',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 3: Kummi
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kummi',
  'Kummi',
  'கும்மி',
  'கும்மி',
  'Ancient rhythmic folk dance performed by women in circles, keeping time by clapping.',
  'Kummi is one of the most ancient dance forms of Tamil Nadu, mentioned in Sangam literature. Performed during festivals like Pongal, temple car festivals, and family celebrations.',
  c.id,
  d.id,
  'Kongu region',
  11.0168,
  76.9558,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Sangam Era to Present',
  'Ancient rhythmic folk dance performed by women in circles, keeping time by clapping.',
  '',
  '/images/placeholders/dance.svg',
  'Tamil University Thanjavur',
  'APPROVED',
  1,
  0,
  4.8,
  51,
  154,
  'folk, women, pongal, community',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'CBE'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 4: Oyilattam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'oyilattam',
  'Oyilattam',
  'ஒயிலாட்டம்',
  'ஒயிலாட்டம்',
  'Dance of graceful steps performed with colorful handkerchiefs and ankle bells.',
  'Traditionally performed by men in lines, holding cloths of different colors. The dancers narrate mythological and historical epics like Murugan and Ramayana with vigorous footwork.',
  c.id,
  d.id,
  'Dindigul & Madurai',
  10.3673,
  77.9803,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Medieval to Present',
  'Dance of graceful steps performed with colorful handkerchiefs and ankle bells.',
  '',
  '/images/placeholders/dance.svg',
  'South Zone Cultural Centre',
  'APPROVED',
  1,
  0,
  4.8,
  54,
  171,
  'folk, martial, murugan, line-dance',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 5: Mayilattam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'mayilattam',
  'Mayilattam',
  'மயிலாட்டம்',
  'மயிலாட்டம்',
  'The Peacock Dance, dedicated to Lord Murugan where dancers wear peacock feathers.',
  'Dancers dress from head to toe with peacock feathers, a beak, and wooden stilts or tall heels, mimicking the graceful mating and rain dances of peafowl.',
  c.id,
  d.id,
  'Tirunelveli region',
  8.7139,
  77.7567,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Centuries-old folk tradition',
  'The Peacock Dance, dedicated to Lord Murugan where dancers wear peacock feathers.',
  '',
  '/images/placeholders/dance.svg',
  'Department of Art and Culture, TN',
  'APPROVED',
  1,
  0,
  4.8,
  57,
  188,
  'folk, costume, murugan, temple',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 6: Kavadi Aattam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kavadi-aattam',
  'Kavadi Aattam',
  'காவடியாட்டம்',
  'காவடியாட்டம்',
  'Devotional burden dance dedicated to Murugan, carrying wooden arch-canopies.',
  'A ceremonial sacrifice and offering, where devotees carry decorated semi-circular wooden arches decorated with peacock feathers and brass bells while in a state of spiritual trance.',
  c.id,
  d.id,
  'Palani Murugan Temple',
  10.45,
  77.52,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient worship tradition',
  'Devotional burden dance dedicated to Murugan, carrying wooden arch-canopies.',
  '',
  '/images/placeholders/dance.svg',
  'Palani Devasthanam Archives',
  'APPROVED',
  1,
  0,
  4.8,
  60,
  205,
  'devotional, murugan, thaipusam, trance',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'DGL'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 7: Poikkal Kuthirai Aattam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'poikkal-kuthirai',
  'Poikkal Kuthirai Aattam',
  'பொய்க்கால் குதிரையாட்டம்',
  'பொய்க்கால் குதிரையாட்டம்',
  'Dummy horse dance where performers balance on wooden stilts inside a horse shell.',
  'Dancers don horse frames made of papier-mâché, wood, and cloth, while standing on wooden stilts that mimic horse hooves hitting the ground. Famed for depictions of royal warriors and deities.',
  c.id,
  d.id,
  'Thanjavur Palace',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Chola and Maratha era',
  'Dummy horse dance where performers balance on wooden stilts inside a horse shell.',
  '',
  '/images/placeholders/dance.svg',
  'Tamil Nadu Folk Arts Board',
  'APPROVED',
  1,
  0,
  4.8,
  63,
  222,
  'folk, stilts, costume, warrior',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 8: Thappattam (Parai Aattam)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thappattam',
  'Thappattam (Parai Aattam)',
  'தப்பாட்டம் (பறை ஆட்டம்)',
  'தப்பாட்டம் (பறை ஆட்டம்)',
  'Ancient drum dance using the primal circular frame drum (Parai).',
  'Parai is the mother drum of Tamil civilization, recorded across Sangam poetry. Performed with high-energy leaps, synchronization, and thunderous beats during temple festivals and social gatherings.',
  c.id,
  d.id,
  'Tamil Nadu widespread',
  13.0827,
  80.2707,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'First Millenium BCE - Present',
  'Ancient drum dance using the primal circular frame drum (Parai).',
  '',
  '/images/placeholders/dance.svg',
  'Sangam Literature Records',
  'APPROVED',
  1,
  0,
  4.8,
  66,
  239,
  'percussion, parai, sangam, folk',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'DANCE_TRADITIONS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 9: Carnatic Classical Vocal
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'carnatic-vocal',
  'Carnatic Classical Vocal',
  'கர்நாடக செவ்வியல் வாய்ப்பாட்டு',
  'கர்நாடக செவ்வியல் வாய்ப்பாட்டு',
  'Complex melodic and rhythmic vocal music system rooted in Ragas and Talas.',
  'Carnatic vocal music centers on compositions (Kritis) by saint-composers like Tyagaraja, Muthuswami Dikshitar, and Syama Sastri, with improvisation forms like Alapana, Niraval, and Kalpanaswaram.',
  c.id,
  d.id,
  'Music Academy, Chennai',
  13.0405,
  80.2585,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Medieval to Modern (15th - 21st Century)',
  'Complex melodic and rhythmic vocal music system rooted in Ragas and Talas.',
  '',
  '/images/placeholders/music.svg',
  'The Music Academy Madras',
  'APPROVED',
  1,
  0,
  4.8,
  69,
  256,
  'classical, carnatic, raga, tala, margazhi',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 10: Saraswati Veena (Thanjavur Veena)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'veena',
  'Saraswati Veena (Thanjavur Veena)',
  'தஞ்சாவூர் சரஸ்வதி வீணை',
  'தஞ்சாவூர் சரஸ்வதி வீணை',
  'Revered classical plucked string instrument crafted from jackfruit wood.',
  'The Thanjavur Veena has a GI tag for its exceptional acoustic resonance and single-block jackfruit wood construction. It features 24 brass frets fixed in wax and four main playing strings plus three drone strings.',
  c.id,
  d.id,
  'Thanjavur Veena Makers Guild',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '17th Century (Raghunatha Nayak era)',
  'Revered classical plucked string instrument crafted from jackfruit wood.',
  '',
  '/images/placeholders/music.svg',
  'Geographical Indications Registry India',
  'APPROVED',
  1,
  0,
  4.8,
  72,
  273,
  'classical, string, craft, thanjavur, gi-tag',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 11: Mridangam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'mridangam',
  'Mridangam',
  'மிருதங்கம்',
  'மிருதங்கம்',
  'Primary double-headed rhythm drum of South Indian classical concerts.',
  'The Mridangam is a barrel-shaped wooden drum with two heads. The right head creates melodic harmonics through a circular black tuning paste (siyahi/soru), while the left produces bass tones.',
  c.id,
  d.id,
  'Chennai & Thanjavur',
  13.0827,
  80.2707,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Vedic to Classical Present',
  'Primary double-headed rhythm drum of South Indian classical concerts.',
  '',
  '/images/placeholders/music.svg',
  'Sangeet Natak Akademi',
  'APPROVED',
  1,
  0,
  4.8,
  75,
  290,
  'percussion, classical, carnatic, rhythm',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 12: Nadaswaram & Thavil (Mangala Isai)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'nadaswaram-thavil',
  'Nadaswaram & Thavil (Mangala Isai)',
  'நாதஸ்வரம் மற்றும் தவில் (மங்கள இசை)',
  'நாதஸ்வரம் மற்றும் தவில் (மங்கள இசை)',
  'Auspicious double-reed wind instrument and heavy barrel drum of temple celebrations.',
  'Nadaswaram is one of the world''s loudest non-brass acoustic wind instruments. Accompanied by the powerful Thavil barrel drum, it is considered the supreme auspicious temple sound (Mangala Isai).',
  c.id,
  d.id,
  'Mayiladuthurai delta region',
  11.1075,
  79.6522,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '13th Century - Present',
  'Auspicious double-reed wind instrument and heavy barrel drum of temple celebrations.',
  '',
  '/images/placeholders/music.svg',
  'Tamil Nadu Eyal Isai Nataka Manram',
  'APPROVED',
  1,
  0,
  4.8,
  78,
  307,
  'wind, percussion, temple, auspicious, wedding',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'MYD'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 13: Villu Pattu (Bow Song)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'villu-pattu',
  'Villu Pattu (Bow Song)',
  'வில்லுப் பாட்டு',
  'வில்லுப் பாட்டு',
  'Musical story-telling tradition striking a giant strung bow adorned with bells.',
  'Villu Pattu features a large bow placed over a terracotta pot. The lead bard strikes the bowstring with two slender sticks while narrating ballads of village deities, heroes, and epics with witty banter.',
  c.id,
  d.id,
  'Nellai & Kanyakumari',
  8.7139,
  77.7567,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '15th Century to Present',
  'Musical story-telling tradition striking a giant strung bow adorned with bells.',
  '',
  '/images/placeholders/music.svg',
  'Subramania Bharati Folk Institute',
  'APPROVED',
  1,
  0,
  4.8,
  81,
  324,
  'folk, storytelling, bow, ballad, southern',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'TIR'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 14: Parai Isai
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'parai-isai',
  'Parai Isai',
  'பறை இசை',
  'பறை இசை',
  'The primordial heartbeat of Tamil soil, circular wood and cattle-hide percussion.',
  'Parai is revered as the oldest musical instrument in Tamil literature. Its heated hide produces reverberating acoustic shockwaves that can be heard across kilometers in rural Tamil Nadu.',
  c.id,
  d.id,
  'Widespread across Tamil Nadu',
  13.0827,
  80.2707,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Sangam era',
  'The primordial heartbeat of Tamil soil, circular wood and cattle-hide percussion.',
  '',
  '/images/placeholders/music.svg',
  'International Institute of Tamil Studies',
  'APPROVED',
  1,
  0,
  4.8,
  84,
  341,
  'percussion, sangam, folk, indigenous',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 15: Chennai Gaana
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'gaana-music',
  'Chennai Gaana',
  'சென்னை கானா இசை',
  'சென்னை கானா இசை',
  'Urban working-class folk music genre born on the streets of North Chennai.',
  'Gaana originated in the working-class tenements and fishing harbors of North Chennai. Written in colloquial Madras Tamil (Madras Bashai), its songs celebrate everyday struggles, friendship, philosophy, and loss.',
  c.id,
  d.id,
  'Vyasarapadi & Royapuram, North Chennai',
  13.1007,
  80.2933,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Late 20th Century to Present',
  'Urban working-class folk music genre born on the streets of North Chennai.',
  '',
  '/images/placeholders/music.svg',
  'Madras Music Heritage',
  'APPROVED',
  1,
  0,
  4.8,
  87,
  358,
  'folk, urban, modern, chennai, working-class',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'MUSIC_TRADITIONS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 16: Brihadisvara Temple (Thanjavur Periya Koil)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'brihadisvara-temple',
  'Brihadisvara Temple (Thanjavur Periya Koil)',
  'தஞ்சைப் பெருவுடையார் கோயில் (பெரிய கோயில்)',
  'தஞ்சைப் பெருவுடையார் கோயில் (பெரிய கோயில்)',
  'Architectural marvel of Rajaraja Chola I, UNESCO World Heritage Great Living Chola Temple.',
  'Completed in 1010 CE, this temple features a 66-meter Vimana tower built entirely of granite without binding mortar, topped by an 80-tonne monolithic cupola. It houses one of India''s largest monolithic Nandi statues.',
  c.id,
  d.id,
  'Membalam Rd, Balaganapathy Nagar, Thanjavur, Tamil Nadu 613007',
  10.7828,
  79.1318,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '1010 CE (11th Century Chola Empire)',
  'Architectural marvel of Rajaraja Chola I, UNESCO World Heritage Great Living Chola Temple.',
  '',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India; UNESCO World Heritage Centre',
  'APPROVED',
  1,
  0,
  4.8,
  90,
  375,
  'unesco, chola, granite, shiva, heritage, dravidian',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 17: Madurai Meenakshi Amman Temple
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'meenakshi-amman-temple',
  'Madurai Meenakshi Amman Temple',
  'மதுரை மீனாட்சி சுந்தரேஸ்வரர் திருக்கோயில்',
  'மதுரை மீனாட்சி சுந்தரேஸ்வரர் திருக்கோயில்',
  'Iconic historic temple with 14 colorful gopuram towers and the Hall of Thousand Pillars.',
  'A 2,500-year-old architectural jewel centered on Goddess Meenakshi and Lord Sundareswarar. The temple complex covers 14 acres with 14 magnificent gopurams decorated with thousands of painted mythological stucco figures.',
  c.id,
  d.id,
  'Madurai Main, Madurai, Tamil Nadu 625001',
  9.9195,
  78.1193,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Sangam roots; Nayak rebuilt 16th-17th Century',
  'Iconic historic temple with 14 colorful gopuram towers and the Hall of Thousand Pillars.',
  '',
  '/images/placeholders/place.svg',
  'Madurai Meenakshi Sundareswarar Temple Trust',
  'APPROVED',
  1,
  0,
  4.8,
  93,
  392,
  'shakti, pandya, nayak, gopuram, heritage, chithirai',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 18: Nagore Dargah (Hazrat Syed Shahul Hameed)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'nagore-dargah',
  'Nagore Dargah (Hazrat Syed Shahul Hameed)',
  'நாகூர் தர்கா (ஹசரத் செய்யது ஷாஹுல் ஹமீது பாதுஷா)',
  'நாகூர் தர்கா (ஹசரத் செய்யது ஷாஹுல் ஹமீது பாதுஷா)',
  '500-year-old Sufi Islamic shrine and beacon of interfaith harmony on the Bay of Bengal.',
  'Built around the tomb of the 16th-century Sufi saint Hazrat Shahul Hameed, Nagore Dargah features five magnificent white minarets, including the 131-foot Periya Minara built by the Thanjavur Maratha King Pratap Singh.',
  c.id,
  d.id,
  'Nagore, Nagapattinam, Tamil Nadu 611002',
  10.8229,
  79.8451,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '16th Century CE',
  '500-year-old Sufi Islamic shrine and beacon of interfaith harmony on the Bay of Bengal.',
  '',
  '/images/placeholders/place.svg',
  'Nagore Dargah Advisory Board',
  'APPROVED',
  1,
  0,
  4.8,
  46,
  409,
  'islamic, sufi, interfaith, kanduri, minarets',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'ISLAMIC_HERITAGE' AND d.code = 'NGP'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 19: San Thome Basilica (St. Thomas)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'san-thome-basilica',
  'San Thome Basilica (St. Thomas)',
  'சாந்தோம் பசிலிக்கா பேராலயம்',
  'சாந்தோம் பசிலிக்கா பேராலயம்',
  'Neo-Gothic Roman Catholic cathedral built over the tomb of St. Thomas the Apostle.',
  'One of only three known basilicas in the world built over the tomb of an apostle of Jesus Christ (the other two in Rome and Spain). Originally built by Portuguese explorers in 1523 and rebuilt in 1896 in striking Neo-Gothic style.',
  c.id,
  d.id,
  '38, San Thome High Rd, Mylapore, Chennai, Tamil Nadu 600004',
  13.0337,
  80.2783,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '16th Century (Rebuilt 1896 CE)',
  'Neo-Gothic Roman Catholic cathedral built over the tomb of St. Thomas the Apostle.',
  '',
  '/images/placeholders/place.svg',
  'San Thome Cathedral Archives',
  'APPROVED',
  0,
  0,
  4.8,
  49,
  126,
  'christian, apostle, neo-gothic, mylapore, cathedral',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CHRISTIAN_HERITAGE' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 20: Ramanathaswamy Temple (Rameswaram)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'ramanathaswamy-temple',
  'Ramanathaswamy Temple (Rameswaram)',
  'ராமேஸ்வரம் ராமநாதசுவாமி திருக்கோயில்',
  'ராமேஸ்வரம் ராமநாதசுவாமி திருக்கோயில்',
  'Char Dham pilgrimage site famous for the longest temple corridor in the world.',
  'Located on Pamban island, this Jyotirlinga shrine is associated with Rama''s worship of Shiva. The outer third corridor measures 1,212 granite pillars stretching nearly 400 meters with magnificent carved ceilings.',
  c.id,
  d.id,
  'Rameswaram, Tamil Nadu 623526',
  9.2881,
  79.3174,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Pandya & Sethupathi Dynasties (12th - 17th Century)',
  'Char Dham pilgrimage site famous for the longest temple corridor in the world.',
  '',
  '/images/placeholders/place.svg',
  'Ramanathaswamy Devasthanam',
  'APPROVED',
  0,
  0,
  4.8,
  52,
  143,
  'jyotirlinga, ramayana, corridor, pamban, pilgrimage',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'RAM'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 21: Basilica of Our Lady of Good Health (Velankanni)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'velankanni-basilica',
  'Basilica of Our Lady of Good Health (Velankanni)',
  'வேளாங்கண்ணி ஆரோக்கிய மாதா பேராலயம்',
  'வேளாங்கண்ணி ஆரோக்கிய மாதா பேராலயம்',
  'The Lourdes of the East, maritime Marian pilgrimage shrine welcoming millions annually.',
  'Perched on the Coromandel coast, the shrine traces back to three 16th-century miracles attributed to Mother Mary by local shepherds and Portuguese sailors. Known for healing testimonies and interfaith devotion.',
  c.id,
  d.id,
  'Velankanni, Tamil Nadu 611111',
  10.6808,
  79.8499,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '16th Century to Present',
  'The Lourdes of the East, maritime Marian pilgrimage shrine welcoming millions annually.',
  '',
  '/images/placeholders/place.svg',
  'Shrine Basilica Velankanni',
  'APPROVED',
  1,
  0,
  4.8,
  55,
  160,
  'christian, marian, pilgrimage, coromandel, interfaith',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CHRISTIAN_HERITAGE' AND d.code = 'NGP'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 22: Sittanavasal Rock-cut Jain Cave & Paintings
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'sittanavasal-cave',
  'Sittanavasal Rock-cut Jain Cave & Paintings',
  'சித்தன்னவாசல் சமணர் குடைவரைக் குகை ஓவியங்கள்',
  'சித்தன்னவாசல் சமணர் குடைவரைக் குகை ஓவியங்கள்',
  '2nd-century BCE Jain rock beds and 7th-century exquisite vegetable-dye fresco paintings.',
  'A prominent center of Jain asceticism in Tamil Nadu, containing Ezhadipattam stone beds inscribed with Tamil-Brahmi script and a rock-cut shrine with frescos depicting lotus ponds, birds, and celestial dancers.',
  c.id,
  d.id,
  'Sittanavasal, Pudukkottai District, Tamil Nadu 622101',
  10.4619,
  78.7288,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '2nd Century BCE - 9th Century CE',
  '2nd-century BCE Jain rock beds and 7th-century exquisite vegetable-dye fresco paintings.',
  '',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India',
  'APPROVED',
  1,
  0,
  4.8,
  58,
  177,
  'jain, rock-cut, brahmi, paintings, frescoes, heritage',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'JAIN_HERITAGE' AND d.code = 'PDK'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 23: Thai Pongal (Harvest Thanksgiving)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thai-pongal',
  'Thai Pongal (Harvest Thanksgiving)',
  'தைப்பொங்கல் (தமிழர் திருநாள்)',
  'தைப்பொங்கல் (தமிழர் திருநாள்)',
  'Four-day harvest festival celebrating the Sun God, nature, agriculture, and cattle.',
  'Pongal marks the sun''s northern transit into Makara Rasi. Spanning Bhogi, Surya Pongal (boiling freshly harvested rice with jaggery and milk in clay pots shouting ''Pongalo Pongal!''), Maattu Pongal honoring bulls, and Kaanum Pongal.',
  c.id,
  d.id,
  'Celebrated pan-Tamil Nadu',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Sangam Era (2000+ years old)',
  'Four-day harvest festival celebrating the Sun God, nature, agriculture, and cattle.',
  'Boiling sweet milk rice in earthen pots facing the morning sun; Drawing vibrant rice flour Kolams with color powders; Worshipping decorated cattle with garlands and bells',
  '/images/placeholders/festival.svg',
  'Sangam Literature (Puranaanuru)',
  'APPROVED',
  1,
  0,
  4.8,
  61,
  194,
  'harvest, sun, cattle, tradition, jallikattu, pongal',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 24: Karthigai Deepam (Festival of Fire)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'karthigai-deepam',
  'Karthigai Deepam (Festival of Fire)',
  'கார்த்திகை தீபம் (மகா தீபத் திருவிழா)',
  'கார்த்திகை தீபம் (மகா தீபத் திருவிழா)',
  'Ancient festival of lamps commemorating the column of fire, lighting the holy Annamalai hill.',
  'Mentioned in the ancient Ahananuru poetry, the festival reaches its pinnacle at Tiruvannamalai, where a colossal bronze cauldron of camphor and ghee is ignited atop the sacred 2,668-foot Arunachala hill, visible for miles.',
  c.id,
  d.id,
  'Arunachala Hill, Tiruvannamalai',
  12.2253,
  79.0747,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Sangam Era (Ahananuru records)',
  'Ancient festival of lamps commemorating the column of fire, lighting the holy Annamalai hill.',
  'Lighting earthen clay Agal Vilakku lamps throughout every household; Barefoot 14-km Giri Valam circumambulation of Arunachala hill',
  '/images/placeholders/festival.svg',
  'Arulmigu Arunachaleswarar Temple Trust',
  'APPROVED',
  0,
  0,
  4.8,
  64,
  211,
  'lights, agni, arunachala, lamp, shiva',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'TVM'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 25: Madurai Chithirai Thiruvizha
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'chithirai-festival',
  'Madurai Chithirai Thiruvizha',
  'மதுரை சித்திரைத் திருவிழா',
  'மதுரை சித்திரைத் திருவிழா',
  'Spectacular one-month celebration uniting the Celestial Wedding and Lord Alagar''s river entry.',
  'King Thirumalai Nayak unified the Saivite festival of Meenakshi''s divine coronation and wedding with the Vaishnavite festival of Lord Alagar visiting Madurai on a golden horse to enter the Vaigai river, bringing all communities together.',
  c.id,
  d.id,
  'Meenakshi Temple and Vaigai River banks, Madurai',
  9.9195,
  78.1193,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Unified by King Thirumalai Nayak in the 17th Century',
  'Spectacular one-month celebration uniting the Celestial Wedding and Lord Alagar''s river entry.',
  'Meenakshi Thirukalyanam (Divine Celestial Wedding); Alagar Aatril Irangudhal (Lord Alagar entering the Vaigai river)',
  '/images/placeholders/festival.svg',
  'Madurai Meenakshi Temple Administration',
  'APPROVED',
  0,
  0,
  4.8,
  67,
  228,
  'carnival, vaigai, chariot, meenakshi, alagar, nayak',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 26: Chidambaram Natyanjali Dance Festival
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'natyanjali',
  'Chidambaram Natyanjali Dance Festival',
  'சிதம்பரம் நாட்டியாஞ்சலி திருவிழா',
  'சிதம்பரம் நாட்டியாஞ்சலி திருவிழா',
  'Five-day classical dance offering to Lord Nataraja, the Cosmic Dancer, on Maha Shivaratri.',
  'Dancers from all over India and the globe gather in the thousand-pillar hall and outer courts of Chidambaram Nataraja Temple to present Bharatanatyam, Kuchipudi, Kathak, and Mohiniyattam as a devotional offering to Nataraja.',
  c.id,
  d.id,
  'Chidambaram Nataraja Temple, Cuddalore',
  11.3992,
  79.6935,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Initiated in 1981 at Chidambaram',
  'Five-day classical dance offering to Lord Nataraja, the Cosmic Dancer, on Maha Shivaratri.',
  'Night-long classical performances in the temple courtyard',
  '/images/placeholders/festival.svg',
  'Natyanjali Trust Chidambaram',
  'APPROVED',
  0,
  0,
  4.8,
  70,
  245,
  'dance, nataraja, shivaratri, classical, chidambaram',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'CDM'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 27: Aadi Perukku (River Kaveri Celebration)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'aadi-perukku',
  'Aadi Perukku (River Kaveri Celebration)',
  'ஆடிப்பெருக்கு (ஆடி 18)',
  'ஆடிப்பெருக்கு (ஆடி 18)',
  'Water-thanksgiving festival celebrating the swelling life-giving waters of River Kaveri.',
  'Observed on the 18th day of the Tamil month of Aadi, marking the onset of the monsoon that fills the rivers and irrigates the agricultural delta. Families gather at river ghats with traditional variety rices (Chithirannam).',
  c.id,
  d.id,
  'Kaveri River Ghats, Tiruchirappalli & Thanjavur',
  10.7905,
  78.7047,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Sangam roots',
  'Water-thanksgiving festival celebrating the swelling life-giving waters of River Kaveri.',
  'Offering turmeric, flowers, and lamps to the river waters; Picnicking by riverbanks with variety rices like Lemon, Tamarind, Coconut rice',
  '/images/placeholders/festival.svg',
  'Tamil Nadu Heritage Documentation',
  'APPROVED',
  0,
  0,
  4.8,
  73,
  262,
  'water, kaveri, monsoon, agriculture, chithirannam',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 28: Thaipusam
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thaipusam',
  'Thaipusam',
  'தைப்பூசம்',
  'தைப்பூசம்',
  'Devotional festival honoring Murugan receiving the celestial spear (Vel) to vanquish evil.',
  'Celebrated on the full moon in Thai when the Pusam star rises. Devotees carry milk pots (Paal Kudam) and ornate Kavadis on their shoulders, often observing rigorous fasting and undertaking long foot-pilgrimages (Pada Yatra).',
  c.id,
  d.id,
  'Palani Hill Temple',
  10.45,
  77.52,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient worship heritage',
  'Devotional festival honoring Murugan receiving the celestial spear (Vel) to vanquish evil.',
  'Paal Kudam (Milk Pot Procession) to sanctum; Foot-pilgrimage across hundreds of kilometers (Pada Yatra)',
  '/images/placeholders/festival.svg',
  'Palani Devasthanam',
  'APPROVED',
  0,
  0,
  4.8,
  76,
  279,
  'murugan, vel, kavadi, pilgrimage, pada-yatra',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FESTIVALS_CELEBRATIONS' AND d.code = 'DGL'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 29: Chettinad Cuisine & Karaikudi Spices
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'chettinad-cuisine',
  'Chettinad Cuisine & Karaikudi Spices',
  'செட்டிநாட்டு உணவு மற்றும் காரைக்குடி மசாலா',
  'செட்டிநாட்டு உணவு மற்றும் காரைக்குடி மசாலா',
  'Legendary cuisine famous for freshly roasted stone-ground spices and kalpasi.',
  'Developed by the merchant community of Nattukottai Chettiars who traded with Southeast Asia. Notable dishes include Chettinad Pepper Chicken, Kozhukattai, Vellai Paniyaram, and Mandi, utilizing sun-dried meats and exotic spices like star anise and black stone flower (kalpasi).',
  c.id,
  d.id,
  'Karaikudi, Chettinad, Sivaganga District',
  10.0674,
  78.7804,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '19th Century Maritime trading era to Present',
  'Legendary cuisine famous for freshly roasted stone-ground spices and kalpasi.',
  '',
  '/images/placeholders/food.svg',
  'Chettinad Heritage Culinary Guide',
  'APPROVED',
  1,
  0,
  4.8,
  79,
  296,
  'spices, banana-leaf, chettinad, kalpasi, non-veg, karaikudi',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'SVG'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 30: Tirunelveli Halwa (Iruttu Kadai)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'tirunelveli-halwa',
  'Tirunelveli Halwa (Iruttu Kadai)',
  'திருநெல்வேலி அல்வா (இருட்டுக் கடை)',
  'திருநெல்வேலி அல்வா (இருட்டுக் கடை)',
  'Silky melt-in-the-mouth wheat halwa cooked in pure ghee with Thamirabarani water.',
  'Prepared by extracting pure wheat milk, boiling it down with caramelized sugar and abundant country ghee. The unique copper-rich minerals of the Thamirabarani river water are credited with giving the halwa its unmistakable texture and glossy sheen.',
  c.id,
  d.id,
  'Opposite Nellaiappar Temple, Tirunelveli',
  8.7288,
  77.6896,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Mid-19th Century (1882) to Present',
  'Silky melt-in-the-mouth wheat halwa cooked in pure ghee with Thamirabarani water.',
  '',
  '/images/placeholders/food.svg',
  'Tirunelveli Heritage Food Registry',
  'APPROVED',
  0,
  0,
  4.8,
  82,
  313,
  'sweet, ghee, wheat, thamirabarani, halwa',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'TIR'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 31: Madurai Jigarthanda
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'madurai-jigarthanda',
  'Madurai Jigarthanda',
  'மதுரை ஜிகர்தண்டா',
  'மதுரை ஜிகர்தண்டா',
  'Cooling beverage made of almond gum (badam pisin), nannari syrup, and thickened milk ice cream.',
  'Literal translation: ''liver cooler''. Brought to Madurai by Mughal-Nayak royal cooks, Jigarthanda blends natural cooling tree-gum (badam pisin), condensed caramelized milk (basundi), sarsaparilla root syrup, and a scoop of rich malai ice cream on top.',
  c.id,
  d.id,
  'East Marret Street, Madurai',
  9.9195,
  78.1193,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '17th Century Nayak era to Present',
  'Cooling beverage made of almond gum (badam pisin), nannari syrup, and thickened milk ice cream.',
  '',
  '/images/placeholders/food.svg',
  'Madurai Food Historians',
  'APPROVED',
  0,
  0,
  4.8,
  85,
  330,
  'beverage, cooling, badam-pisin, dessert, madurai',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 32: Dindigul Thalappakatti Biryani
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'dindigul-biryani',
  'Dindigul Thalappakatti Biryani',
  'திண்டுக்கல் தலப்பாக்கட்டி பிரியாணி',
  'திண்டுக்கல் தலப்பாக்கட்டி பிரியாணி',
  'Distinctive short-grain Seeraga Samba rice biryani infused with tender meat and mild spices.',
  'Unlike northern long-grain Basmati biryanis, Tamil Nadu biryani relies on tiny, intensely aromatic Seeraga Samba rice, country chicken or tender mutton, homemade curd, and whole spices pounded fresh on stone.',
  c.id,
  d.id,
  'Dindigul Town Center',
  10.3673,
  77.9803,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '1957 to Present',
  'Distinctive short-grain Seeraga Samba rice biryani infused with tender meat and mild spices.',
  '',
  '/images/placeholders/food.svg',
  'Tamil Nadu Culinary History',
  'APPROVED',
  0,
  0,
  4.8,
  88,
  347,
  'biryani, seeraga-samba, dindigul, thalappakatti',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'DGL'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 33: Kanchipuram Kovil Idli
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kanchipuram-idli',
  'Kanchipuram Kovil Idli',
  'காஞ்சிபுரம் கோவில் இட்லி',
  'காஞ்சிபுரம் கோவில் இட்லி',
  'Spiced temple prasad steamed in cylindrical bamboo baskets wrapped in dried Mandharai leaves.',
  'Originated as a sacred offering at the Varadharaja Perumal Temple in Kanchipuram. Coarsely ground rice and urad dal batter seasoned with crushed black pepper, dried ginger (sukku), cumin seeds, curry leaves, and generous melted ghee.',
  c.id,
  d.id,
  'Varadharaja Perumal Temple, Kanchipuram',
  12.8258,
  79.7245,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Vijayanagara Temple Tradition',
  'Spiced temple prasad steamed in cylindrical bamboo baskets wrapped in dried Mandharai leaves.',
  '',
  '/images/placeholders/food.svg',
  'Temple Culinary Archives of Kanchipuram',
  'APPROVED',
  0,
  0,
  4.8,
  91,
  364,
  'breakfast, temple-prasad, spiced, steamed, ghee, kanchipuram',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'KCH'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 34: Kongunadu Cuisine & Nattu Kozhi
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kongunadu-cuisine',
  'Kongunadu Cuisine & Nattu Kozhi',
  'கொங்கு நாட்டு உணவு மற்றும் நாட்டுக் கோழி',
  'கொங்கு நாட்டு உணவு மற்றும் நாட்டுக் கோழி',
  'Rustic western culinary heritage using freshly grated coconut, shallots, and castor oil.',
  'Kongu cooking is gentle, subtle, and intensely agrarian. Notable highlights include Arisi Paruppu Sadam (the original comfort one-pot lentil rice), Pallipalayam Chicken braised with garlic and shallots, and tender Nattu Kozhi soup.',
  c.id,
  d.id,
  'Coimbatore & Erode agricultural belts',
  11.0168,
  76.9558,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Centuries-old farming tradition',
  'Rustic western culinary heritage using freshly grated coconut, shallots, and castor oil.',
  '',
  '/images/placeholders/food.svg',
  'Kongu Culinary Heritage Society',
  'APPROVED',
  0,
  0,
  4.8,
  94,
  381,
  'agrarian, shallots, comfort-food, coimbatore, pallipalayam',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'CUISINE_RECIPES' AND d.code = 'CBE'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 35: Tanjore Gold Foil Painting
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'tanjore-paintings',
  'Tanjore Gold Foil Painting',
  'தஞ்சாவூர் தட்டோவியம் (தஞ்சை ஓவியம்)',
  'தஞ்சாவூர் தட்டோவியம் (தஞ்சை ஓவியம்)',
  'Classical South Indian painting on teak boards using 22-karat gold leaf and precious stones.',
  'Originating under the Maratha rulers of Thanjavur in the 16th century, these sacred paintings feature embossed relief work (sukka clay), vibrant natural vegetable colors, and genuine 22-karat gold foil that glows in temple light for generations.',
  c.id,
  d.id,
  'Thanjavur Artisan Guild',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '16th - 18th Century Maratha & Nayak patronage',
  'Classical South Indian painting on teak boards using 22-karat gold leaf and precious stones.',
  '',
  '/images/placeholders/craft.svg',
  'GI Registry India (GI Tag #55)',
  'APPROVED',
  0,
  0,
  4.8,
  47,
  398,
  'gold-leaf, painting, thanjavur, maratha, gi-tag, handicraft',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 36: Kanchipuram Silk Sarees (Pattu)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kanchipuram-silk',
  'Kanchipuram Silk Sarees (Pattu)',
  'காஞ்சிபுரம் பட்டுப் புடவைகள்',
  'காஞ்சிபுரம் பட்டுப் புடவைகள்',
  'Queen of silks woven with heavy mulberry silk threads and pure silver-gold zari.',
  'Woven by the master weavers of Kanchipuram who trace their lineage to the divine weaver Sage Markandeya. Characterized by contrasting borders (Korvai weaving technique) and motifs inspired by temple sculptures like peacocks, swans, and mangoes.',
  c.id,
  d.id,
  'Weavers Colony, Kanchipuram',
  12.8342,
  79.7036,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '400+ years of documented continuous weaving',
  'Queen of silks woven with heavy mulberry silk threads and pure silver-gold zari.',
  '',
  '/images/placeholders/craft.svg',
  'GI Registry India (GI Tag #1)',
  'APPROVED',
  1,
  0,
  4.8,
  50,
  415,
  'textile, handloom, silk, zari, gi-tag, kanchipuram, wedding',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'KCH'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 37: Swamimalai Chola Bronze Icons
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'swamimalai-bronze',
  'Swamimalai Chola Bronze Icons',
  'சுவாமிமலை சோழர் வெண்கலச் சிற்பங்கள்',
  'சுவாமிமலை சோழர் வெண்கலச் சிற்பங்கள்',
  'Lost-wax cast bronze icons following ancient Shilpa Shastra proportions.',
  'Sthapathis of Swamimalai continue the millennium-old lost-wax casting technique (cire perdue) practiced during the Imperial Chola era, casting the world-renowned Nataraja icons with panchaloha (five-metal alloy).',
  c.id,
  d.id,
  'Swamimalai, Thanjavur District',
  10.9575,
  79.3242,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Imperial Chola Dynasty (10th Century to Present)',
  'Lost-wax cast bronze icons following ancient Shilpa Shastra proportions.',
  '',
  '/images/placeholders/craft.svg',
  'GI Registry India (GI Tag #23)',
  'APPROVED',
  0,
  0,
  4.8,
  53,
  132,
  'bronze, panchaloha, chola, sculpture, gi-tag, swamimalai',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 38: Athangudi Handmade Palace Tiles
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'athangudi-tiles',
  'Athangudi Handmade Palace Tiles',
  'ஆத்தங்குடி கைவினை தரை ஓடுகள் (டைல்ஸ்)',
  'ஆத்தங்குடி கைவினை தரை ஓடுகள் (டைல்ஸ்)',
  'Handcrafted cement tiles molded with local river sand and vibrant mineral colors.',
  'Manufactured exclusively in the Chettinad village of Athangudi, these eco-friendly tiles are cast by hand on glass plates using brass molds and dry mineral pigments, giving historic Chettinad mansions their iconic lustrous floors.',
  c.id,
  d.id,
  'Athangudi Village, Karaikudi, Sivaganga District',
  10.1585,
  78.7885,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Early 20th Century to Present',
  'Handcrafted cement tiles molded with local river sand and vibrant mineral colors.',
  '',
  '/images/placeholders/craft.svg',
  'GI Registry India (GI Tag #430)',
  'APPROVED',
  0,
  0,
  4.8,
  56,
  149,
  'tiles, chettinad, flooring, gi-tag, handcrafted, athangudi',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'SVG'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 39: Nachiarkoil Brass Lamps (Kuthuvilakku)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'nachiarkoil-lamps',
  'Nachiarkoil Brass Lamps (Kuthuvilakku)',
  'நாச்சியார்கோவில் பித்தளை குத்துவிளக்கு',
  'நாச்சியார்கோவில் பித்தளை குத்துவிளக்கு',
  'Ornate sand-cast traditional brass lamps topped by the mythical Hamsa bird.',
  'Handcrafted by the Pathar artisan community in Nachiarkoil using sand moulds from the nearby Kaveri tributaries. The Kuthuvilakku lamp features intricately hollowed stems and multiple oil wicks, indispensable in Tamil weddings and temples.',
  c.id,
  d.id,
  'Nachiarkoil, Kumbakonam, Thanjavur District',
  10.9167,
  79.45,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '19th Century to Present',
  'Ornate sand-cast traditional brass lamps topped by the mythical Hamsa bird.',
  '',
  '/images/placeholders/craft.svg',
  'GI Registry India (GI Tag #197)',
  'APPROVED',
  0,
  0,
  4.8,
  59,
  166,
  'brass, lamp, kuthuvilakku, gi-tag, auspicious',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 40: Pattamadai Fine Korai Grass Mats (Pai)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'pattamadai-mats',
  'Pattamadai Fine Korai Grass Mats (Pai)',
  'பத்தமடை பட்டுப் பாய்',
  'பத்தமடை பட்டுப் பாய்',
  'Silken-soft sleeping mats woven from split Korai river reeds along the Thamirabarani.',
  'Crafted by the Muslim Labbai weaver community in the village of Pattamadai. The wild Korai grass is soaked in running Thamirabarani waters, split into razor-thin strands, and hand-woven on looms to produce mats so fine they can be rolled into a handkerchief.',
  c.id,
  d.id,
  'Pattamadai Village, Ambasamudram, Tirunelveli',
  8.6833,
  77.5833,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '19th Century to Present',
  'Silken-soft sleeping mats woven from split Korai river reeds along the Thamirabarani.',
  '',
  '/images/placeholders/craft.svg',
  'GI Registry India (GI Tag #138)',
  'APPROVED',
  0,
  0,
  4.8,
  62,
  183,
  'mats, grass, korai, thamirabarani, gi-tag, wedding-custom',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_CRAFTS' AND d.code = 'TIR'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 41: Veshti & Angavastram (Traditional Dhoti)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'veshti-angavastram',
  'Veshti & Angavastram (Traditional Dhoti)',
  'வேஷ்டி மற்றும் அங்கவஸ்திரம்',
  'வேஷ்டி மற்றும் அங்கவஸ்திரம்',
  'Dignified traditional white unstitched cotton or silk drape worn with shoulder scarf.',
  'Worn by men across social occasions, temple worship, and family festivities. The pristine white cotton or pure mulberry silk fabric features a rich gold zari border (Mayilkann or temple korvai) wrapped securely around the waist.',
  c.id,
  d.id,
  'Salem & Erode Handloom Corridors',
  11.6643,
  78.146,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Sangam to Present',
  'Dignified traditional white unstitched cotton or silk drape worn with shoulder scarf.',
  '',
  '/images/placeholders/attire.svg',
  'Co-optex Tamil Nadu Handloom Weavers',
  'APPROVED',
  0,
  0,
  4.8,
  65,
  200,
  'men-attire, dhoti, zari, wedding, formal, salem-silk',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_DRESS' AND d.code = 'SLM'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 42: Madisar 9-Yard Saree Drape
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'madisar-saree',
  'Madisar 9-Yard Saree Drape',
  'மடிசார் புடவை (ஒன்பது கஜப் புடவை)',
  'மடிசார் புடவை (ஒன்பது கஜப் புடவை)',
  'Intricate 9-yard ceremonial drape combining a dhoti pleat with a flowing saree pallu.',
  'Measuring nine yards (eight meters), the Madisar is an ancient drape designed for freedom of movement during fire rituals (Yagnas) and domestic ceremonies. Draped in either the Iyer (kacham on right) or Iyengar (kacham on left) traditions.',
  c.id,
  d.id,
  'Kaveri delta agraharam heritage',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Classical Era to Present',
  'Intricate 9-yard ceremonial drape combining a dhoti pleat with a flowing saree pallu.',
  '',
  '/images/placeholders/attire.svg',
  'Textile Heritage Archives of Tamil Nadu',
  'APPROVED',
  0,
  0,
  4.8,
  68,
  217,
  'women-attire, nine-yard, ceremonial, drape, tradition',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_DRESS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 43: Pavada Dhavani (Tamil Half-Saree)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'pavada-dhavani',
  'Pavada Dhavani (Tamil Half-Saree)',
  'பாவாடை தாவணி (அரை சேலை)',
  'பாவாடை தாவணி (அரை சேலை)',
  'Three-piece transitional youth attire featuring pleated long skirt, blouse, and sheer stole.',
  'Worn by young women between childhood and marriage, especially celebrated during the Ritu Kala Samskara (Manjal Neerattu Vizha / Coming-of-Age ceremony). The attire consists of a pleated full-length skirt (Pavada), a snug blouse (Choli), and a 2.5-meter stole (Dhavani) pleated over the shoulder.',
  c.id,
  d.id,
  'Widespread across Tamil Nadu',
  9.9252,
  78.1198,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Centuries-old youth tradition',
  'Three-piece transitional youth attire featuring pleated long skirt, blouse, and sheer stole.',
  '',
  '/images/placeholders/attire.svg',
  'South Indian Costume History',
  'APPROVED',
  0,
  0,
  4.8,
  71,
  234,
  'half-saree, youth, coming-of-age, silk, festival',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'TRADITIONAL_DRESS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 44: Kolam (Sacred Geometric Rice Flour Art)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kolam-tradition',
  'Kolam (Sacred Geometric Rice Flour Art)',
  'கோலம் (புள்ளி வைத்து வரையும் அரிசி மாவு கலை)',
  'கோலம் (புள்ளி வைத்து வரையும் அரிசி மாவு கலை)',
  'Daily morning threshold ritual of geometric symmetry drawn with coarse rice flour to welcome prosperity.',
  'Every dawn in Tamil Nadu, women sweep the threshold with cow-dung water and trace intricate mathematical symmetry using raw rice flour between their thumbs and forefingers. It serves as an offering to feed ants, birds, and insects (Bhuta Yajna) while welcoming Goddess Lakshmi into the home.',
  c.id,
  d.id,
  'Widespread across every Tamil household',
  13.0827,
  80.2707,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Sangam to Present',
  'Daily morning threshold ritual of geometric symmetry drawn with coarse rice flour to welcome prosperity.',
  '',
  '/images/placeholders/tradition.svg',
  'Ethno-mathematics & Tamil Culture Studies',
  'APPROVED',
  0,
  0,
  4.8,
  74,
  251,
  'kolam, rangoli, rice-flour, geometry, margazhi, daily-ritual',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'CHN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 45: Jallikattu (Eru Thazhuvuthal Bull Embracing)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'jallikattu-tradition',
  'Jallikattu (Eru Thazhuvuthal Bull Embracing)',
  'ஜல்லிக்கட்டு (ஏறு தழுவுதல்)',
  'ஜல்லிக்கட்டு (ஏறு தழுவுதல்)',
  'Ancient Sangam sport where courageous youths embrace the humps of native Kangayam and Pulikulam bulls.',
  'Recorded in Sangam poetry (Kalithogai) as Eru Thazhuvuthal (''embracing the bull''). Celebrated during Maattu Pongal in Alanganallur, Palamedu, and Avaniyapuram. Unlike Spanish bullfighting, the animal is revered as family, never harmed, and is preserved for indigenous breeding.',
  c.id,
  d.id,
  'Alanganallur Vaadi Vaasal, Madurai District',
  10.0435,
  78.0833,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'c. 3rd Century BCE to Present',
  'Ancient Sangam sport where courageous youths embrace the humps of native Kangayam and Pulikulam bulls.',
  '',
  '/images/placeholders/tradition.svg',
  'Sangam Literature (Kalithogai)',
  'APPROVED',
  0,
  0,
  4.8,
  77,
  268,
  'jallikattu, bull, sangam, courage, pongal, madurai',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 46: Virundhombal (The Sacred Ethos of Hospitality)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'virundhombal-tradition',
  'Virundhombal (The Sacred Ethos of Hospitality)',
  'விருந்தோம்பல் (தமிழர் உபசரிப்பு மரபு)',
  'விருந்தோம்பல் (தமிழர் உபசரிப்பு மரபு)',
  'Cherished moral duty of welcoming guests and strangers with abundant feasts on banana leaves.',
  'Thiruvalluvar dedicated an entire chapter in the Thirukkural to Virundhombal. Rooted in the belief that guests are divine, hosts serve fresh food on tapered plantain leaves with the narrow tip facing left, offering dishes in an unbroken sequence from sweet payasam to buttermilk.',
  c.id,
  d.id,
  'Cultural philosophy across Tamil Nadu',
  10.787,
  79.1378,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Sangam to Present',
  'Cherished moral duty of welcoming guests and strangers with abundant feasts on banana leaves.',
  '',
  '/images/placeholders/tradition.svg',
  'Thirukkural Chapter on Virundhombal',
  'APPROVED',
  0,
  0,
  4.8,
  80,
  285,
  'hospitality, banana-leaf, thirukkural, values, feast',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 47: Thirukkural by Thiruvalluvar
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'thirukkural',
  'Thirukkural by Thiruvalluvar',
  'திருக்குறள் (திருவள்ளுவர்)',
  'திருக்குறள் (திருவள்ளுவர்)',
  'Universal secular ethical masterpiece of 1,330 couplets spanning virtue, wealth, and love.',
  'Penned by the sage poet Thiruvalluvar over 2,000 years ago, Thirukkural consists of 133 chapters containing 10 rhyming couplets each. It stands as one of the most translated non-religious philosophical works in human history.',
  c.id,
  d.id,
  'Thiruvalluvar Statue, Kanyakumari',
  8.0883,
  77.5385,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'c. 300 BCE - 5th Century CE',
  'Universal secular ethical masterpiece of 1,330 couplets spanning virtue, wealth, and love.',
  '',
  '/images/placeholders/literature.svg',
  'International Institute of Tamil Studies',
  'APPROVED',
  0,
  0,
  4.8,
  83,
  302,
  'philosophy, sangam, ethics, kural, secular, classic',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FOLKLORE_LEGENDS' AND d.code = 'KAN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 48: Silappathikaram (The Tale of the Anklet)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'silappathikaram',
  'Silappathikaram (The Tale of the Anklet)',
  'சிலப்பதிகாரம் (இளங்கோவடிகள்)',
  'சிலப்பதிகாரம் (இளங்கோவடிகள்)',
  'Earliest Tamil epic narrating the heroic tragedy of Kannagi and Kovalan.',
  'Composed by the Jain prince-monk Ilango Adigal, Silappathikaram is a lyrical drama traversing the three Tamil crowns: Chola Poompuhar, Pandya Madurai, and Chera Vanchi. When Kovalan is falsely executed in Madurai, Kannagi tears off her breast and curses the unjust city to flames.',
  c.id,
  d.id,
  'Madurai & Poompuhar',
  9.9195,
  78.1193,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '2nd - 5th Century CE',
  'Earliest Tamil epic narrating the heroic tragedy of Kannagi and Kovalan.',
  '',
  '/images/placeholders/literature.svg',
  'Tamil Virtual Academy',
  'APPROVED',
  0,
  0,
  4.8,
  86,
  319,
  'epic, anklet, kannagi, chola, pandya, justice',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FOLKLORE_LEGENDS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 49: Tolkappiyam (Grammar & Poetics of Living)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'tolkappiyam',
  'Tolkappiyam (Grammar & Poetics of Living)',
  'தொல்காப்பியம் (தொல்காப்பியர்)',
  'தொல்காப்பியம் (தொல்காப்பியர்)',
  'Oldest surviving Tamil work codifying phonetics, syntax, love, and warfare.',
  'Written by Tolkappiyar, it is divided into three sections: Ezhuttu (Orthography), Sol (Etymology), and Porul (Subject Matter of Life). The Porulathikaram is unique in world literature as it provides grammar not just for language, but for human emotions, landscapes (Thinai), and society.',
  c.id,
  d.id,
  'Madurai Tamil Sangam legacy',
  9.9252,
  78.1198,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'c. 500 BCE - 2nd Century BCE',
  'Oldest surviving Tamil work codifying phonetics, syntax, love, and warfare.',
  '',
  '/images/placeholders/literature.svg',
  'Central Institute of Classical Tamil',
  'APPROVED',
  0,
  0,
  4.8,
  89,
  336,
  'grammar, linguistics, thinai, sangam, ancient',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FOLKLORE_LEGENDS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 50: Mahakavi Subramania Bharati's Modern Poetry
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'bharathiyar-poetry',
  'Mahakavi Subramania Bharati''s Modern Poetry',
  'மகாகவி சுப்பிரமணிய பாரதியாரின் கவிதைகள்',
  'மகாகவி சுப்பிரமணிய பாரதியாரின் கவிதைகள்',
  'Revolutionary modern verse igniting India''s independence, women''s liberation, and linguistic pride.',
  'Born in Ettayapuram, Bharati revolutionized Tamil literature by breaking rigid poetic meters to create stirring, democratic lyrics. His songs on ''Pudhumai Penn'' (The New Empowered Woman) and ''Senthamizh Nadu'' redefined 20th-century Tamil identity.',
  c.id,
  d.id,
  'Bharathiyar Memorial House, Ettayapuram, Thoothukudi',
  9.15,
  77.99,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Late 19th - Early 20th Century (1882 - 1921)',
  'Revolutionary modern verse igniting India''s independence, women''s liberation, and linguistic pride.',
  '',
  '/images/placeholders/literature.svg',
  'Bharathiar Memorial Trust',
  'APPROVED',
  0,
  0,
  4.8,
  92,
  353,
  'modern-poetry, freedom-struggle, feminism, ettayapuram, mahakavi',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FOLKLORE_LEGENDS' AND d.code = 'TUT'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 51: Kamba Ramayanam (Ramavataram by Kambar)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kamba-ramayanam',
  'Kamba Ramayanam (Ramavataram by Kambar)',
  'கம்பராமாயணம் (கவிச்சக்கரவர்த்தி கம்பர்)',
  'கம்பராமாயணம் (கவிச்சக்கரவர்த்தி கம்பர்)',
  '12th-century epic retelling of the Ramayana in over 10,000 virtuosic Tamil verses.',
  'Kambar composed his masterpiece at Thiruvennainallur and inaugurated it at the Srirangam Ranganathaswamy Temple. Renowned for its unparalleled poetic metaphors (Kamba Soothiram), dramatic character depths, and sublime linguistic majesty.',
  c.id,
  d.id,
  'Srirangam Temple, Tiruchirappalli',
  10.8622,
  78.69,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '12th Century CE (Later Chola era)',
  '12th-century epic retelling of the Ramayana in over 10,000 virtuosic Tamil verses.',
  '',
  '/images/placeholders/literature.svg',
  'Kamban Kazhagam',
  'APPROVED',
  0,
  0,
  4.8,
  45,
  370,
  'epic, chola, verse, kambar, chola-literature',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'FOLKLORE_LEGENDS' AND d.code = 'MYD'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 52: Silambam (Bamboo Staff Martial Art)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'silambam',
  'Silambam (Bamboo Staff Martial Art)',
  'சிலம்பம் (பாரம்பரிய தற்காப்புக் கலை)',
  'சிலம்பம் (பாரம்பரிய தற்காப்புக் கலை)',
  'Ancient weapon-based martial art utilizing flexible bamboo canes and lightning footwork.',
  'Silambam is an ancient weapon art mentioned in Sangam literature. Practitioners use a five-foot cured bamboo stave, demonstrating snake strokes (Naaga Paambu), bird flight stances, and defense against multiple swordsmen. Weapon branches include Maduvu (deer horns), Surul Vaal (flexible whip-blade), and Sedikuchi.',
  c.id,
  d.id,
  'Southern Tamil Nadu martial academies',
  9.9252,
  78.1198,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'c. 2nd Century BCE - Present',
  'Ancient weapon-based martial art utilizing flexible bamboo canes and lightning footwork.',
  '',
  '/images/placeholders/martial.svg',
  'Silambam Federation of India',
  'APPROVED',
  0,
  0,
  4.8,
  48,
  387,
  'martial-art, bamboo, surul-vaal, sangam, combat, silambam',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 53: Varma Kalai (Vital Pressure Points Science)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'varma-kalai',
  'Varma Kalai (Vital Pressure Points Science)',
  'வர்மக் கலை (வர்ம சாஸ்திரம்)',
  'வர்மக் கலை (வர்ம சாஸ்திரம்)',
  'Esoteric martial discipline and healing system targeting 108 vital meridian nodes (Varmam).',
  'Attributed to Sage Agastya and closely entwined with Siddha medicine. Varma Kalai maps 108 vital life-energy spots on the human body. Applied with minimal fingertip force, it can instantaneously disable an attacker, and conversely, revive collapsed patients through emergency resuscitation strikes (Adangal).',
  c.id,
  d.id,
  'Western Ghats Siddha lineage sanctuaries',
  8.0883,
  77.5385,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient Siddha tradition',
  'Esoteric martial discipline and healing system targeting 108 vital meridian nodes (Varmam).',
  '',
  '/images/placeholders/martial.svg',
  'Agastya Varma Research Institute',
  'APPROVED',
  0,
  0,
  4.8,
  51,
  404,
  'varmam, siddha, healing, pressure-points, agastya',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'KAN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 54: Adimurai (Southern Bare-Hand Combat)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'adimurai',
  'Adimurai (Southern Bare-Hand Combat)',
  'அடிமுறை (தெக்கன் அடி)',
  'அடிமுறை (தெக்கன் அடி)',
  'Bare-handed Southern strike fighting tradition practiced in Kanyakumari and Tirunelveli.',
  'Also known as Thekkan Kalari (Southern Style), Adimurai prioritizes swift close-quarter punches, kicks, joint locks, and blocks without elaborate stances. Traditionally taught in outdoor mud pits called Kalari by Asans (Masters).',
  c.id,
  d.id,
  'Southern Kanyakumari district',
  8.0883,
  77.5385,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Medieval to Present',
  'Bare-handed Southern strike fighting tradition practiced in Kanyakumari and Tirunelveli.',
  '',
  '/images/placeholders/martial.svg',
  'Traditional Adimurai Guild',
  'APPROVED',
  0,
  0,
  4.8,
  54,
  121,
  'bare-hand, combat, kanyakumari, thekkan, self-defense',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'KAN'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 55: Kuttu Varisai (Empty Hand Sequences)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kuttu-varisai',
  'Kuttu Varisai (Empty Hand Sequences)',
  'குத்து வரிசை',
  'குத்து வரிசை',
  'Unarmed foundation of Silambam mastering animal movements, punches, and sweeps.',
  'Practitioners learn animal-inspired combat movements mimicking the monkey, tiger, elephant, and eagle to develop explosive balance, dodging, footwork, and counter-strikes prior to picking up the bamboo staff.',
  c.id,
  d.id,
  'Tamil Nadu widespread',
  9.9252,
  78.1198,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'Ancient roots',
  'Unarmed foundation of Silambam mastering animal movements, punches, and sweeps.',
  '',
  '/images/placeholders/martial.svg',
  'Traditional Martial Guild',
  'APPROVED',
  0,
  0,
  4.8,
  57,
  138,
  'empty-hand, stances, animal-forms, agility',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'VILLAGE_CUSTOMS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 56: The Sangam Era (Golden Age of Tamil Culture)
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'sangam-era',
  'The Sangam Era (Golden Age of Tamil Culture)',
  'சங்க காலம் (தமிழர் பொற்காலம்)',
  'சங்க காலம் (தமிழர் பொற்காலம்)',
  'Vibrant classical era of Tamil poetry, egalitarian society, global trade, and Thinai philosophy.',
  'Spanning roughly 600 BCE to 300 CE, the Sangam era is defined by three great literary assemblies (Sangams) patronized by Pandya kings in Madurai. Society categorized human existence into five ecological landscapes (Thinai: Kurinji, Mullai, Marudham, Neydhal, Paalai), trading pepper and pearls with ancient Rome, Greece, and China.',
  c.id,
  d.id,
  'Keeladi Archaeological Excavation Site, Sivaganga District',
  9.8631,
  78.1889,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  'c. 600 BCE - 300 CE',
  'Vibrant classical era of Tamil poetry, egalitarian society, global trade, and Thinai philosophy.',
  '',
  '/images/placeholders/history.svg',
  'Tamil Nadu State Department of Archaeology (Keeladi Report)',
  'APPROVED',
  0,
  0,
  4.8,
  60,
  155,
  'sangam, keeladi, thinai, pandya, ancient-trade, rome',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'MDU'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 57: The Imperial Cholas & Maritime Empire
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'chola-maritime-empire',
  'The Imperial Cholas & Maritime Empire',
  'சோழப் பேரரசு மற்றும் கடல்சார் ஆதிக்கம்',
  'சோழப் பேரரசு மற்றும் கடல்சார் ஆதிக்கம்',
  'Medieval superpower with blue-water navy projecting power to Sri Lanka, Srivijaya (Indonesia), and the Ganges.',
  'Between the 9th and 13th centuries, the Imperial Cholas transformed the Bay of Bengal into a ''Chola Lake''. Rajaraja I built the Brihadisvara Temple, while his son Rajendra Chola I marched to the Ganges (earning the title Gangaikondan) and deployed a naval expedition across the Malacca Straits against the Srivijaya empire.',
  c.id,
  d.id,
  'Gangaikonda Cholapuram, Ariyalur',
  11.2065,
  79.4552,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '850 CE - 1279 CE',
  'Medieval superpower with blue-water navy projecting power to Sri Lanka, Srivijaya (Indonesia), and the Ganges.',
  '',
  '/images/placeholders/history.svg',
  'Chola Inscriptions & Epigraphia Indica',
  'APPROVED',
  0,
  0,
  4.8,
  63,
  172,
  'chola, navy, empire, rajaraja, rajendra, srivijaya',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'TNJ'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 58: The Pallava Golden Age & Monolithic Rock Art
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'pallava-architecture',
  'The Pallava Golden Age & Monolithic Rock Art',
  'பல்லவர் காலம் மற்றும் மாமல்லபுர குடைவரை சிற்பங்கள்',
  'பல்லவர் காலம் மற்றும் மாமல்லபுர குடைவரை சிற்பங்கள்',
  'Pioneers of Dravidian stone architecture, rock-cut Rathas, and Shore Temple of Mamallapuram.',
  'Ruling from Kanchipuram from the 4th to 9th centuries, Mahendravarman I and Narasimhavarman I (Mamalla) pioneered stone carving in South India. They transformed granite boulders into the monolithic Pancha Rathas and the massive open-air relief carving ''Arjuna''s Penance''.',
  c.id,
  d.id,
  'Mamallapuram, Chengalpattu District',
  12.6269,
  80.1927,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '4th - 9th Century CE',
  'Pioneers of Dravidian stone architecture, rock-cut Rathas, and Shore Temple of Mamallapuram.',
  '',
  '/images/placeholders/history.svg',
  'UNESCO World Heritage Centre',
  'APPROVED',
  0,
  0,
  4.8,
  66,
  189,
  'pallava, rock-cut, mamallapuram, unesco, pancha-rathas',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'KCH'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 59: Keeladi Excavations - Sangam Era Urban Civilization
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'keeladi-excavations',
  'Keeladi Excavations - Sangam Era Urban Civilization',
  'கீழடி அகழ்வாராய்ச்சி - சங்க கால நகர்ப்புற நாகரிகம்',
  'கீழடி அகழ்வாராய்ச்சி - சங்க கால நகர்ப்புற நாகரிகம்',
  'Precious 6th-century BCE Sangam urban settlement confirming Vaigai river valley civilization literacy and craftsmanship.',
  'Carbon-dated to 580 BCE, Keeladi excavations in Sivaganga district have unearthed sophisticated brick structures, drainage channels, Tamizhi-inscribed potsherds, weaving tools, and carnelian beads proving a literate, agrarian-industrial civilization contemporaneous with the Gangetic urban phase.',
  c.id,
  d.id,
  'Keeladi Heritage Museum, Silaiman, Sivaganga District',
  9.8631,
  78.1887,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '6th Century BCE (Sangam Civilization)',
  'Precious 6th-century BCE Sangam urban settlement confirming Vaigai river valley civilization literacy and craftsmanship.',
  '',
  '/images/placeholders/history.svg',
  'Tamil Nadu State Department of Archaeology (TNSDA)',
  'APPROVED',
  0,
  0,
  4.8,
  69,
  206,
  'sangam, keeladi, tamizhi, archaeology, excavations, vaigai',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHAEOLOGICAL_INSCRIPTIONS' AND d.code = 'SVG'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 60: Kazhugumalai Vettuvan Koil - 'The Ellora of the South'
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'kazhugumalai-vettuvan-koil',
  'Kazhugumalai Vettuvan Koil - ''The Ellora of the South''',
  'கழுகுமலை வெட்டுவான் கோயில் - தென்னகத்து எல்லோரா',
  'கழுகுமலை வெட்டுவான் கோயில் - தென்னகத்து எல்லோரா',
  'Magnificent 8th-century monolithic rock-cut Pandya shrine carved top-down from a single living hillock.',
  'Carved from living granite rock during the reign of early Pandya king Maran Chadayan, Vettuvan Koil is often celebrated as the Ellora of South India. The unfinished sanctum is surmounted by an exquisitely sculpted vimana displaying Shiva, Dakshinamurthy, Vishnu, and celestial dwarfs (ganas).',
  c.id,
  d.id,
  'Kazhugumalai, Kovilpatti, Thoothukudi District',
  9.1444,
  77.7058,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '8th Century CE (Pandya Dynasty)',
  'Magnificent 8th-century monolithic rock-cut Pandya shrine carved top-down from a single living hillock.',
  '',
  '/images/placeholders/place.svg',
  'Archaeological Survey of India',
  'APPROVED',
  0,
  1,
  4.8,
  72,
  223,
  'pandya, monolithic, rock-cut, hidden-gem, ellora-of-south',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'HIDDEN_GEMS' AND d.code = 'TUT'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

-- Item 61: Mahabalipuram - Shore Temple and Rock-Cut Monuments
INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  'mahabalipuram-monuments',
  'Mahabalipuram - Shore Temple and Rock-Cut Monuments',
  'மாமல்லபுரம் - கடற்கரைக் கோயில் மற்றும் குடைவரைச் சிற்பங்கள்',
  'மாமல்லபுரம் - கடற்கரைக் கோயில் மற்றும் குடைவரைச் சிற்பங்கள்',
  'UNESCO World Heritage 7th-century coastal complex of Pancha Rathas, rock reliefs, and Arjuna''s Penance.',
  'Conceived and carved by Pallava kings Mahendravarman I and Narasimhavarman I (Mamalla) in the 7th and 8th centuries CE, Mahabalipuram showcases the transition from rock-cut cave sanctuaries to structural granite shore temples, featuring the colossal relief of Arjuna''s Penance.',
  c.id,
  d.id,
  'Shore Temple, Mahabalipuram, Chengalpattu District',
  12.6269,
  80.1927,
  'HISTORICAL_FACT',
  'Tamil Heritage',
  '7th - 8th Century CE (Pallava Empire)',
  'UNESCO World Heritage 7th-century coastal complex of Pancha Rathas, rock reliefs, and Arjuna''s Penance.',
  '',
  '/images/placeholders/place.svg',
  'UNESCO World Heritage Centre; Archaeological Survey of India',
  'APPROVED',
  0,
  0,
  4.8,
  75,
  240,
  'unesco, pallava, shore-temple, pancha-rathas, granite, relief',
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'CHG'
ON DUPLICATE KEY UPDATE 
  slug = VALUES(slug),
  title_ta = VALUES(title_ta),
  short_description = VALUES(short_description),
  full_description = VALUES(full_description),
  category_id = VALUES(category_id),
  district_id = VALUES(district_id),
  town_village = VALUES(town_village),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  cover_image_url = VALUES(cover_image_url),
  tags = VALUES(tags),
  updated_at = NOW();

SET FOREIGN_KEY_CHECKS = 1;
