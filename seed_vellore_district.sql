-- ===================================================================
-- SEED SCRIPT: VELLORE DISTRICT (VEL)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Vellore District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'VEL', 'Vellore', 'வேலூர்', 'Northern', 12.9165, 79.1325,
  'A prominent transit and medical hub, Vellore is historically anchored by its impregnable granite fort, the site of the 1806 Sepoy Mutiny.'
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
  'vellore-fort-and-jalakandeswarar-temple',
  'Vellore Fort and Jalakandeswarar Temple',
  'வேலூர் கோட்டை மற்றும் ஜலகண்டேஸ்வரர் கோயில்',
  'Vellore Kottai',
  'An incredibly well-preserved 16th-century granite fort surrounded by a wide moat, housing a spectacular Nayak-era Shiva temple, a church, and a mosque.',
  'Constructed in 1566 CE by Bommi and Thimma Reddy under the Vijayanagara Empire, Vellore Fort is considered one of the most perfect specimens of military architecture in South India. It features massive granite walls and a wide, crocodile-infested moat. Inside the fort is the Jalakandeswarar Temple, renowned for its ''Kalyana Mandapam'', which boasts some of the finest, most intricate stone pillar carvings in Tamil Nadu. The fort is secularly historic, holding a church, a mosque, and having served as the prison for the family of Tipu Sultan and the last king of Sri Lanka. It was the site of the first major sepoy mutiny against the British in 1806.',
  c.id, d.id, 'Vellore City', 12.9229, 79.1287,
  'HISTORICAL_FACT', 'Secular / Hindu, Islamic, Christian',
  'Built in 1566 CE; the 1806 mutiny predates the 1857 Indian Rebellion by half a century.', 'A powerful symbol of architectural syncretism and early anti-colonial resistance. The stone carvings of the Jalakandeswarar temple represent the pinnacle of Vijayanagara artistry.',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 190, 800, 'vellore fort, moat, jalakandeswarar, mutiny 1806, vijayanagara, military architecture',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HISTORICAL_MONUMENTS' AND d.code = 'VEL'
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
  'VELLORE_FORT',
  'vellore, fort, jalakandeswarar, moat, tipu sultan, 1806 mutiny, vijayanagara',
  'HISTORICAL_MONUMENTS',
  'VEL',
  'The 16th-century Vellore Fort is renowned for its wide moat, massive granite walls, and the exquisite Jalakandeswarar Temple inside. It is historically famous as the site of the 1806 Sepoy Mutiny against the British.',
  '16-ஆம் நூற்றாண்டில் கட்டப்பட்ட வேலூர் கோட்டை, அதன் அகழிகளுக்கும் பிரம்மாண்டமான கற்சுவர்களுக்கும் புகழ் பெற்றது. இதன் உள்ளே உள்ள ஜலகண்டேஸ்வரர் கோயில் சிற்பக்கலைக்குச் சான்றாகும். 1806-ஆம் ஆண்டு ஆங்கிலேயருக்கு எதிரான முதல் சிப்பாய்க் கலகம் இங்குதான் நடைபெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'vellore-fort-and-jalakandeswarar-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
