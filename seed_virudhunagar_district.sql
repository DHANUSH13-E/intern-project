-- ===================================================================
-- SEED SCRIPT: VIRUDHUNAGAR DISTRICT (VIR)
-- ===================================================================

USE tamilnadu_culture_db;
SET NAMES utf8mb4;

-- 1. Ensure Virudhunagar District Details are Updated
INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (
  'VIR', 'Virudhunagar', 'விருதுநகர்', 'Southern', 9.5872, 77.9514,
  'An industrious district known for printing, fireworks, and matchbox manufacturing in Sivakasi, as well as the birthplace of former Chief Minister K. Kamaraj and the sacred town of Srivilliputhur.'
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
  'srivilliputhur-andal-temple',
  'Srivilliputhur Andal Temple',
  'ஸ்ரீவில்லிபுத்தூர் ஆண்டாள் கோயில்',
  'Andal Kovil',
  'A venerated Vaishnavite temple dedicated to the poet-saint Andal. Its soaring 192-foot Rajagopuram is the official emblem of the Government of Tamil Nadu.',
  'Srivilliputhur is one of the most sacred Divya Desams in Vaishnavism, being the birthplace of two great Alvars (poet-saints): Periyalvar and his foster daughter Andal. Andal is celebrated for her unwavering devotion to Lord Vishnu and her timeless Tamil literary works, ''Thiruppavai'' and ''Nachiyar Tirumozhi''. The temple features two parts: the Vatapatrasayi temple and the Andal shrine. The magnificent 11-tiered, 192-foot tall Rajagopuram, built during the Pandya and Madurai Nayak eras, holds immense cultural pride as it serves as the official state emblem of Tamil Nadu. The town is also famous for ''Srivilliputhur Palkova'', a geographical indication (GI) tagged milk sweet.',
  c.id, d.id, 'Srivilliputhur', 9.5082, 77.6323,
  'HISTORICAL_FACT', 'Hindu - Vaishnavite',
  'Roots in the 8th century (Alvar period); towering Gopuram constructed around the 11th-16th centuries.', 'A confluence of rich Bhakti literature, iconic Dravidian architecture serving as the state symbol, and unique culinary heritage (Palkova).',
  '/images/placeholders/place.svg',
  'State Archaeological and Historical Documentation; Tamil Nadu Tourism',
  'APPROVED', 1, 0, 4.8, 190, 800, 'andal, srivilliputhur, tamil nadu emblem, gopuram, thiruppavai, palkova',
  NOW(), NOW()
FROM categories c, districts d
WHERE c.code = 'HINDU_HERITAGE' AND d.code = 'VIR'
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
  'SRIVILLIPUTHUR_ANDAL',
  'virudhunagar, srivilliputhur, andal, gopuram, tamil nadu emblem, palkova, thiruppavai, divya desam',
  'HINDU_HERITAGE',
  'VIR',
  'The Srivilliputhur Andal Temple in Virudhunagar district is a major Vaishnavite shrine. Its 192-foot tall Rajagopuram famously serves as the official emblem of the Government of Tamil Nadu. The town is also famous for the sweet ''Palkova''.',
  'விருதுநகர் மாவட்டத்தில் உள்ள ஸ்ரீவில்லிபுத்தூர் ஆண்டாள் கோயில் மிகவும் புகழ்பெற்ற வைணவத் திருத்தலமாகும். இதன் 192 அடி உயர ராஜகோபுரமே தமிழ்நாடு அரசின் அதிகாரப்பூர்வ இலச்சினையாக (Emblem) உள்ளது. இவ்வூர் சுவையான ''பால்கோவா''விற்கும் புகழ் பெற்றது.',
  e.id, 1, NOW(), NOW()
FROM cultural_entries e
WHERE e.slug = 'srivilliputhur-andal-temple'
ON DUPLICATE KEY UPDATE 
  response_en = VALUES(response_en),
  response_ta = VALUES(response_ta),
  keywords = VALUES(keywords);
