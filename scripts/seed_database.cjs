const fs = require('fs');
const path = require('path');

const dataDir = path.join(__dirname, '..', 'src', 'main', 'resources', 'data');
const datasetPath = path.join(dataDir, 'tamilnadu_culture_overall_dataset.json');

const dataset = JSON.parse(fs.readFileSync(datasetPath, 'utf8'));

function escapeSql(str) {
  if (str === null || str === undefined) return 'NULL';
  return "'" + String(str).replace(/'/g, "''").replace(/\\/g, "\\\\") + "'";
}

let sql = `-- ===================================================================\n`;
sql += `-- TAMIL NADU CULTURE MASTER DATASET SEED SCRIPT (38 Districts, 20 Categories, 61 Items)\n`;
sql += `-- ===================================================================\n\n`;
sql += `SET NAMES utf8mb4;\n`;
sql += `SET FOREIGN_KEY_CHECKS = 0;\n\n`;

// 1. Categories
sql += `-- 1. CATEGORIES (20)\n`;
for (const cat of dataset.categories) {
  sql += `INSERT INTO categories (code, name_en, name_ta, description, icon_class, display_order, active)
VALUES (${escapeSql(cat.code)}, ${escapeSql(cat.nameEn)}, ${escapeSql(cat.nameTa)}, ${escapeSql(cat.nameEn + ' of Tamil Nadu')}, ${escapeSql(cat.icon)}, ${cat.displayOrder}, 1)
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), icon_class = VALUES(icon_class), display_order = VALUES(display_order);\n`;
}
sql += `\n`;

// 2. Districts
sql += `-- 2. DISTRICTS (38)\n`;
for (const dist of dataset.districts) {
  const code = dist.code;
  const nameEn = dist.name.en;
  const nameTa = dist.name.ta;
  const region = dist.region;
  const lat = dist.coordinates.lat;
  const lng = dist.coordinates.lng;
  const desc = dist.summary.en;

  sql += `INSERT INTO districts (code, name_en, name_ta, region, latitude, longitude, description)
VALUES (${escapeSql(code)}, ${escapeSql(nameEn)}, ${escapeSql(nameTa)}, ${escapeSql(region)}, ${lat}, ${lng}, ${escapeSql(desc)})
ON DUPLICATE KEY UPDATE name_en = VALUES(name_en), name_ta = VALUES(name_ta), region = VALUES(region), latitude = VALUES(latitude), longitude = VALUES(longitude), description = VALUES(description);\n`;
}
sql += `\n`;

// 3. Cultural Entries (61 items)
sql += `-- 3. CULTURAL ENTRIES (61)\n`;

// Build district code to district lookup
const distIdToCode = {};
dataset.districts.forEach(d => {
  distIdToCode[d.id] = d.code;
});

for (let i = 0; i < dataset.items.length; i++) {
  const item = dataset.items[i];
  const slug = item.slug || item.id;
  const title = item.name.en;
  const titleTa = item.name.ta || '';
  const shortDesc = item.summary.en || '';
  const fullDesc = item.description.en || item.summary.en || '';
  const catCode = item.seedCategoryCode;
  const primaryDistId = item.districtIds && item.districtIds.length > 0 ? item.districtIds[0] : 'chennai';
  const distCode = distIdToCode[primaryDistId] || 'CHN';
  const townVillage = (item.location && item.location.address) ? item.location.address : (item.origin && item.origin.en ? item.origin.en : '');
  const lat = item.location && item.location.lat ? item.location.lat : 13.0827;
  const lng = item.location && item.location.lng ? item.location.lng : 80.2707;
  const coverImage = (item.images && item.images.length > 0) ? item.images[0].url : '/images/placeholders/place.svg';
  const tags = (item.tags && item.tags.length > 0) ? item.tags.join(', ') : '';
  const era = item.era || '';
  const sourceRefs = item.sources ? item.sources.map(s => s.label).join('; ') : '';

  sql += `-- Item ${i + 1}: ${title}\n`;
  sql += `INSERT INTO cultural_entries (
  slug, title, title_ta, alternate_names, short_description, full_description,
  category_id, district_id, town_village, latitude, longitude,
  authenticity_type, religion_community, history_origin, cultural_significance,
  festivals_customs, cover_image_url, source_references, status,
  featured, hidden_gem, average_rating, total_ratings, view_count, tags,
  created_at, updated_at
)
SELECT 
  ${escapeSql(slug)},
  ${escapeSql(title)},
  ${escapeSql(titleTa)},
  ${escapeSql(item.name.ta || '')},
  ${escapeSql(shortDesc)},
  ${escapeSql(fullDesc)},
  c.id,
  d.id,
  ${escapeSql(townVillage)},
  ${lat},
  ${lng},
  'HISTORICAL_FACT',
  'Tamil Heritage',
  ${escapeSql(era)},
  ${escapeSql(shortDesc)},
  ${escapeSql(item.rituals ? item.rituals.map(r => r.en).join('; ') : '')},
  ${escapeSql(coverImage)},
  ${escapeSql(sourceRefs)},
  'APPROVED',
  ${(i < 15 || item.source === 'both') ? 1 : 0},
  ${(item.seedCategoryCode === 'HIDDEN_GEMS') ? 1 : 0},
  4.8,
  ${45 + (i * 3) % 50},
  ${120 + (i * 17) % 300},
  ${escapeSql(tags)},
  NOW(),
  NOW()
FROM categories c, districts d
WHERE c.code = ${escapeSql(catCode)} AND d.code = ${escapeSql(distCode)}
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
  updated_at = NOW();\n\n`;
}

sql += `SET FOREIGN_KEY_CHECKS = 1;\n`;

const outSqlPath = path.join(__dirname, '..', 'setup_61_cultural_items.sql');
fs.writeFileSync(outSqlPath, sql, 'utf8');
console.log('Successfully created SQL seed script:', outSqlPath);
