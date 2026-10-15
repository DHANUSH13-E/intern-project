-- ===================================================================
-- SEED SCRIPT: KANNIYAKUMARI DISTRICT (KAN)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Kanniyakumari District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'KAN', 'Kanniyakumari', 'கன்னியாகுமரி', 'Southern', 8.0883, 77.5385,
  'The southernmost tip of the Indian subcontinent where the Arabian Sea, Bay of Bengal, and Indian Ocean converge. It is celebrated for its unique sunrises, sunsets, and monumental offshore structures.'
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
  'thiruvalluvar-statue-and-vivekananda-rock',
  'Thiruvalluvar Statue and Vivekananda Rock',
  'திருவள்ளுவர் சிலை மற்றும் விவேகானந்தர் பாறை',
  'Ayyan Thiruvalluvar Silai, Vivekananda Rock Memorial',
  'A monumental 133-foot stone sculpture of the Tamil poet-philosopher Thiruvalluvar and the adjacent rock memorial honoring Swami Vivekananda''s meditation.',
  'Standing on two adjacent rocks approximately 500 meters off the mainland, these monuments form the iconic silhouette of Kanniyakumari. The Thiruvalluvar Statue stands exactly 133 feet tall, symbolizing the 133 chapters of the Tirukkural. The pedestal represents Araram and Porul, while the statue represents Inbam, signifying that wealth and love should be based on solid virtue. The neighboring Vivekananda Rock Memorial marks the spot where Swami Vivekananda attained enlightenment in 1892 before his journey to Chicago.',
  c.id, d.id, 'Kanniyakumari Town', 8.078, 77.5552,
  'HISTORICAL_FACT', 'All Communities',
  'Vivekananda Rock built in 1970; Thiruvalluvar statue sculpted by Dr. V. Ganapati Sthapati and inaugurated in 2000.', 'A triumph of modern traditional stone architecture that immortalizes Tamil literature''s greatest work, the Tirukkural, at the geographical convergence of India''s oceans.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 180, 750, 'thiruvalluvar, tirukkural, vivekananda, monument, ocean, sculpture',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'ARCHITECTURE_SCULPTURE' AND d.code = 'KAN'
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
  'THIRUVALLUVAR_STATUE',
  'kanniyakumari, thiruvalluvar, statue, 133 feet, tirukkural, vivekananda rock, ocean confluence',
  'ARCHITECTURE_SCULPTURE',
  'KAN',
  'The Thiruvalluvar Statue in Kanniyakumari is exactly 133 feet tall, representing the 133 chapters of his masterpiece, the Tirukkural. It stands on a rock next to the Vivekananda Rock Memorial where the three oceans meet.',
  'கன்னியாகுமரியில் முக்கடல் சங்கமிக்கும் இடத்தில் அமைந்துள்ள திருவள்ளுவர் சிலை 133 அடி உயரம் கொண்டது. இது திருக்குறளின் 133 அதிகாரங்களைக் குறிக்கிறது. இதன் அருகே விவேகானந்தர் பாறை நினைவகம் அமைந்துள்ளது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'thiruvalluvar-statue-and-vivekananda-rock'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
