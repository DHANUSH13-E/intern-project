-- ===================================================================
-- SEED SCRIPT: VILUPPURAM DISTRICT (VIL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Viluppuram District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'VIL', 'Viluppuram', 'விழுப்புரம்', 'Northern', 11.9401, 79.4861,
  'An expansive agricultural district home to the majestic Gingee Fort, ancient Jain caves, and serving as the gateway to the French colonial town of Puducherry.'
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
  'gingee-fort-troy-of-the-east',
  'Gingee Fort - Troy of the East',
  'செஞ்சிக் கோட்டை - கிழக்கின் ட்ராய்',
  'Senji Fort',
  'A massive, impregnable hill fortress spanning across three hillocks, dubbed the ''Troy of the East'' by the British.',
  'Gingee (Senji) Fort is one of the most magnificent surviving forts in Tamil Nadu. Spanning across three massive hillocks—Rajagiri, Krishnagiri, and Chandrayandurg—the fort features a 13-kilometer-long enclosing wall. Originally built by the Cholas in the 9th century, it was highly fortified by the Vijayanagara Nayaks, and later captured by the Marathas under Chhatrapati Shivaji (who ranked it the most impregnable fort in India), the Mughals, the French, and the British. The complex houses granaries, a prison, the Kalyana Mahal, and temples, requiring a steep, challenging trek to reach the Rajagiri summit.',
  c.id, d.id, 'Gingee', 12.253, 79.4005,
  'HISTORICAL_FACT', 'Secular / Military Heritage',
  'Originated in the 9th century; modified heavily in the 16th century by Gingee Nayaks and 17th century Marathas.', 'A testament to strategic mountain military architecture, witnessing the rise and fall of almost every major power in South Indian medieval and colonial history.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 190, 800, 'gingee, senji, hill fort, troy of the east, shivaji, maratha',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'VIL'
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
  'GINGEE_FORT',
  'viluppuram, gingee, senji, fort, troy of the east, rajagiri, shivaji, hill fort',
  'HISTORICAL_MONUMENTS',
  'VIL',
  'Gingee Fort in Viluppuram district, famously called the ''Troy of the East'' by the British, is an impregnable fortress spanning three hills. It was a strategic stronghold for the Nayaks, Marathas, and Mughals.',
  'விழுப்புரம் மாவட்டத்தில் உள்ள செஞ்சிக் கோட்டை, மூன்று குன்றுகளில் பரவியுள்ள பிரம்மாண்டமான கோட்டையாகும். ஆங்கிலேயர்களால் ''கிழக்கின் ட்ராய்'' என அழைக்கப்பட்ட இது நாயக்கர்கள், மராத்தியர்கள் மற்றும் முகலாயர்களுக்கு முக்கிய ராணுவத் தளமாக விளங்கியது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'gingee-fort-troy-of-the-east'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
