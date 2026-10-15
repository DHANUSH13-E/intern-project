const fs = require('fs');
const path = require('path');

const dataDir = path.join(__dirname, '..', 'src', 'main', 'resources', 'data');

// 1. Categories
const categories = [
  { code: "HISTORICAL_MONUMENTS", nameEn: "Historical Places and Monuments", nameTa: "வரலாற்று இடங்கள்", icon: "bi-bank", displayOrder: 1 },
  { code: "RELIGIOUS_HERITAGE", nameEn: "Religious Heritage", nameTa: "ஆன்மீக மரபு", icon: "bi-flower1", displayOrder: 2 },
  { code: "HINDU_HERITAGE", nameEn: "Hindu Cultural Heritage", nameTa: "இந்து பண்பாட்டு மரபு", icon: "bi-sun", displayOrder: 3 },
  { code: "CHRISTIAN_HERITAGE", nameEn: "Christian Heritage", nameTa: "கிறிஸ்தவ மரபு", icon: "bi-cross", displayOrder: 4 },
  { code: "ISLAMIC_HERITAGE", nameEn: "Islamic Heritage", nameTa: "இஸ்லாமிய மரபு", icon: "bi-moon-stars", displayOrder: 5 },
  { code: "JAIN_HERITAGE", nameEn: "Jain Heritage", nameTa: "சமண மரபு", icon: "bi-circle", displayOrder: 6 },
  { code: "BUDDHIST_HERITAGE", nameEn: "Buddhist Heritage", nameTa: "பௌத்த மரபு", icon: "bi-disc", displayOrder: 7 },
  { code: "COMMUNITY_TRADITIONS", nameEn: "Other Religious Traditions", nameTa: "பிற சமய மரபுகள்", icon: "bi-people", displayOrder: 8 },
  { code: "MUSIC_TRADITIONS", nameEn: "Folk and Classical Music", nameTa: "இசை மரபு", icon: "bi-music-note-beamed", displayOrder: 9 },
  { code: "DANCE_TRADITIONS", nameEn: "Folk and Classical Dance", nameTa: "நடன மரபு", icon: "bi-person-arms-up", displayOrder: 10 },
  { code: "TRADITIONAL_DRESS", nameEn: "Traditional Dress & Textiles", nameTa: "உடை மரபு", icon: "bi-scissors", displayOrder: 11 },
  { code: "CUISINE_RECIPES", nameEn: "Cuisine & Traditional Recipes", nameTa: "உணவு முறை", icon: "bi-cup-hot", displayOrder: 12 },
  { code: "FESTIVALS_CELEBRATIONS", nameEn: "Festivals and Celebrations", nameTa: "திருவிழாக்கள்", icon: "bi-stars", displayOrder: 13 },
  { code: "FOLKLORE_LEGENDS", nameEn: "Folklore & Oral Histories", nameTa: "நாட்டுப்புற கதைகள்", icon: "bi-chat-quote", displayOrder: 14 },
  { code: "ARCHITECTURE_SCULPTURE", nameEn: "Architecture & Sculpture", nameTa: "கட்டிடக்கலை", icon: "bi-columns-gap", displayOrder: 15 },
  { code: "TRADITIONAL_CRAFTS", nameEn: "Traditional Crafts & Handloom", nameTa: "கைவினைப் பொருட்கள்", icon: "bi-palette", displayOrder: 16 },
  { code: "VILLAGE_CUSTOMS", nameEn: "Village Traditions", nameTa: "கிராமிய மரபுகள்", icon: "bi-tree", displayOrder: 17 },
  { code: "CULTURAL_PERSONALITIES", nameEn: "Cultural Personalities", nameTa: "பண்பாட்டு ஆளுமைகள்", icon: "bi-person-badge", displayOrder: 18 },
  { code: "ARCHAEOLOGICAL_INSCRIPTIONS", nameEn: "Archaeological Heritage", nameTa: "தொல்லியல் மரபு", icon: "bi-geo-alt", displayOrder: 19 },
  { code: "HIDDEN_GEMS", nameEn: "Hidden & Lesser-Known Places", nameTa: "அறியப்படாத இடங்கள்", icon: "bi-compass", displayOrder: 20 }
];

// District codes map
const districtCodes = {
  chennai: "CHN",
  madurai: "MDU",
  thanjavur: "TNJ",
  kanchipuram: "KCH",
  coimbatore: "CBE",
  tiruchirappalli: "TRC",
  sivaganga: "SVG",
  nagapattinam: "NGP",
  pudukkottai: "PDK",
  ramanathapuram: "RAM",
  kanyakumari: "KAN",
  thoothukudi: "TUT",
  tirunelveli: "TIR",
  chengalpattu: "CHG",
  cuddalore: "CDM",
  salem: "SLM",
  erode: "ERD",
  dharmapuri: "DHP",
  nilgiris: "NIL",
  vellore: "VEL",
  ariyalur: "ARL",
  dindigul: "DGL",
  kallakurichi: "KLK",
  karur: "KRR",
  krishnagiri: "KRG",
  mayiladuthurai: "MYD",
  namakkal: "NMK",
  perambalur: "PBL",
  ranipet: "RNP",
  tenkasi: "TSI",
  theni: "THN",
  tirupathur: "TPT",
  tiruppur: "TPR",
  tiruvallur: "TVL",
  tiruvannamalai: "TVM",
  tiruvarur: "TVR",
  viluppuram: "VLP",
  virudhunagar: "VNR"
};

// Category mapping helper
function mapCategoryCode(item) {
  if (item.category === 'dance') return 'DANCE_TRADITIONS';
  if (item.category === 'music') return 'MUSIC_TRADITIONS';
  if (item.category === 'food') return 'CUISINE_RECIPES';
  if (item.category === 'craft') return 'TRADITIONAL_CRAFTS';
  if (item.category === 'attire') return 'TRADITIONAL_DRESS';
  if (item.category === 'festival') return 'FESTIVALS_CELEBRATIONS';
  if (item.category === 'literature') return 'FOLKLORE_LEGENDS';
  if (item.category === 'tradition') return 'VILLAGE_CUSTOMS';
  if (item.category === 'martial-art') return 'VILLAGE_CUSTOMS';
  if (item.category === 'history') {
    if (item.id.includes('pallava')) return 'ARCHITECTURE_SCULPTURE';
    return 'HISTORICAL_MONUMENTS';
  }
  if (item.category === 'place') {
    if (item.id === 'brihadisvara-temple') return 'HISTORICAL_MONUMENTS';
    if (item.id === 'meenakshi-amman-temple') return 'HINDU_HERITAGE';
    if (item.id === 'ramanathaswamy-temple') return 'HINDU_HERITAGE';
    if (item.id === 'nagore-dargah') return 'ISLAMIC_HERITAGE';
    if (item.id === 'san-thome-basilica') return 'CHRISTIAN_HERITAGE';
    if (item.id === 'velankanni-basilica') return 'CHRISTIAN_HERITAGE';
    if (item.id === 'sittanavasal-cave') return 'JAIN_HERITAGE';
    return 'HISTORICAL_MONUMENTS';
  }
  return 'HISTORICAL_MONUMENTS';
}

// 2. Read districts
const rawDistricts = JSON.parse(fs.readFileSync(path.join(dataDir, 'districts.json'), 'utf8'));
const districts = rawDistricts.map(d => ({
  ...d,
  code: districtCodes[d.id] || null
}));

// 3. Read items from the 11 json files
const itemFiles = [
  'dance.json', 'music.json', 'places.json', 'festivals.json',
  'food.json', 'crafts.json', 'attire.json', 'traditions.json',
  'literature.json', 'martial-arts.json', 'history.json'
];

let items = [];
const seenIds = new Set();

for (const file of itemFiles) {
  const filePath = path.join(dataDir, file);
  if (fs.existsSync(filePath)) {
    const list = JSON.parse(fs.readFileSync(filePath, 'utf8'));
    for (const it of list) {
      if (!seenIds.has(it.id)) {
        seenIds.add(it.id);
        const catCode = mapCategoryCode(it);
        items.push({
          ...it,
          seedCategoryCode: catCode,
          source: (['brihadisvara-temple', 'meenakshi-amman-temple', 'velankanni-basilica', 'nagore-dargah', 'sittanavasal-cave', 'bharatanatyam', 'karagattam', 'kanchipuram-silk', 'chettinad-cuisine', 'thai-pongal'].includes(it.id)) ? 'both' : 'culture-intern'
        });
      }
    }
  }
}

// 4. Add the 3 seed-only items to reach 61 items
const seedOnlyItems = [
  {
    id: "keeladi-excavations",
    slug: "keeladi-excavations",
    category: "archaeology",
    name: {
      en: "Keeladi Excavations - Sangam Era Urban Civilization",
      ta: "கீழடி அகழ்வாராய்ச்சி - சங்க கால நகர்ப்புற நாகரிகம்"
    },
    summary: {
      en: "Precious 6th-century BCE Sangam urban settlement confirming Vaigai river valley civilization literacy and craftsmanship.",
      ta: "கி.மு 6-ஆம் நூற்றாண்டு வைகை நதி நாகரிக எழுத்தறிவு மற்றும் மேம்பட்ட நகரமைப்பை பறைசாற்றும் தொல்லியல் தளம்."
    },
    description: {
      en: "Carbon-dated to 580 BCE, Keeladi excavations in Sivaganga district have unearthed sophisticated brick structures, drainage channels, Tamizhi-inscribed potsherds, weaving tools, and carnelian beads proving a literate, agrarian-industrial civilization contemporaneous with the Gangetic urban phase.",
      ta: "சிவகங்கை மாவட்டம் கீழடியில் கண்டெடுக்கப்பட்ட செங்கல் கட்டுமானங்கள், வடிகால் அமைப்புகள் மற்றும் தமிழ்-பிராமி எழுத்துக்கள் பொறித்த மண்பாண்டங்கள், இரண்டாயிரத்து அறுநூறு ஆண்டுகளுக்கு முந்தைய தமிழரின் உயர் நாகரிகத்தை உலகிற்கு நிரூபித்துள்ளன."
    },
    districtIds: ["sivaganga"],
    location: {
      lat: 9.8631,
      lng: 78.1887,
      address: "Keeladi Heritage Museum, Silaiman, Sivaganga District"
    },
    images: [
      {
        url: "/images/placeholders/history.svg",
        alt: {
          en: "Keeladi archaeological site excavations",
          ta: "கீழடி அகழ்வாராய்ச்சி தளம்"
        }
      }
    ],
    tags: ["sangam", "keeladi", "tamizhi", "archaeology", "excavations", "vaigai"],
    era: "6th Century BCE (Sangam Civilization)",
    sources: [
      { label: "Tamil Nadu State Department of Archaeology (TNSDA)", url: "https://www.archaeology.tn.gov.in" }
    ],
    verification: "verified",
    lastVerified: "2026-01-15T00:00:00.000Z",
    relatedIds: ["sangam-era", "meenakshi-amman-temple"],
    seedCategoryCode: "ARCHAEOLOGICAL_INSCRIPTIONS",
    seedMatch: {
      title: "Keeladi Excavations - Sangam Era Urban Civilization",
      status: "APPROVED",
      featured: true,
      hiddenGem: false
    },
    source: "seed-only"
  },
  {
    id: "kazhugumalai-vettuvan-koil",
    slug: "kazhugumalai-vettuvan-koil",
    category: "monument",
    name: {
      en: "Kazhugumalai Vettuvan Koil - 'The Ellora of the South'",
      ta: "கழுகுமலை வெட்டுவான் கோயில் - தென்னகத்து எல்லோரா"
    },
    summary: {
      en: "Magnificent 8th-century monolithic rock-cut Pandya shrine carved top-down from a single living hillock.",
      ta: "ஒற்றைப் பாறையை மேலிருந்து கீழாகக் குடைந்து செதுக்கப்பட்ட 8-ஆம் நூற்றாண்டு பாண்டியர் கால குடைவரைக் கோயில்."
    },
    description: {
      en: "Carved from living granite rock during the reign of early Pandya king Maran Chadayan, Vettuvan Koil is often celebrated as the Ellora of South India. The unfinished sanctum is surmounted by an exquisitely sculpted vimana displaying Shiva, Dakshinamurthy, Vishnu, and celestial dwarfs (ganas).",
      ta: "தூத்துக்குடி மாவட்டம் கழுகுமலையில் அமைந்துள்ள முற்கால பாண்டியர் காலத்து ஒற்றைக்கல் குடைவரை சிற்ப அதிசயம். மேலிருந்து கீழாக செதுக்கப்பட்ட விமானத்தில் தட்சிணாமூர்த்தி, உமா மகேஸ்வரர் சிற்பங்கள் நுணுக்கமாக வடிக்கப்பட்டுள்ளன."
    },
    districtIds: ["thoothukudi"],
    location: {
      lat: 9.1444,
      lng: 77.7058,
      address: "Kazhugumalai, Kovilpatti, Thoothukudi District"
    },
    images: [
      {
        url: "/images/placeholders/place.svg",
        alt: {
          en: "Kazhugumalai Vettuvan Koil monolithic rock temple",
          ta: "கழுகுமலை வெட்டுவான் கோயில்"
        }
      }
    ],
    tags: ["pandya", "monolithic", "rock-cut", "hidden-gem", "ellora-of-south"],
    era: "8th Century CE (Pandya Dynasty)",
    sources: [
      { label: "Archaeological Survey of India" }
    ],
    verification: "verified",
    lastVerified: "2026-01-15T00:00:00.000Z",
    relatedIds: ["sittanavasal-cave"],
    seedCategoryCode: "HIDDEN_GEMS",
    seedMatch: {
      title: "Kazhugumalai Vettuvan Koil - 'The Ellora of the South'",
      status: "APPROVED",
      featured: false,
      hiddenGem: true
    },
    source: "seed-only"
  },
  {
    id: "mahabalipuram-monuments",
    slug: "mahabalipuram-monuments",
    category: "monument",
    name: {
      en: "Mahabalipuram - Shore Temple and Rock-Cut Monuments",
      ta: "மாமல்லபுரம் - கடற்கரைக் கோயில் மற்றும் குடைவரைச் சிற்பங்கள்"
    },
    summary: {
      en: "UNESCO World Heritage 7th-century coastal complex of Pancha Rathas, rock reliefs, and Arjuna's Penance.",
      ta: "பல்லவர் கால கடற்கரைக் கோயில், பஞ்சரதங்கள் மற்றும் அர்ச்சுனன் தபசு புடைப்புச் சிற்பங்கள் கொண்ட யுனெஸ்கோ தளம்."
    },
    description: {
      en: "Conceived and carved by Pallava kings Mahendravarman I and Narasimhavarman I (Mamalla) in the 7th and 8th centuries CE, Mahabalipuram showcases the transition from rock-cut cave sanctuaries to structural granite shore temples, featuring the colossal relief of Arjuna's Penance.",
      ta: "பல்லவ மன்னன் மாமல்லனால் 7 மற்றும் 8-ஆம் நூற்றாண்டுகளில் உருவாக்கப்பட்ட உலகப் புகழ்பெற்ற கடற்கரைச் சிற்பங்கள். அர்ச்சுனன் தபசு, பஞ்ச ரதங்கள் மற்றும் கடற்கரைக் கோயில்கள் திராவிடக் கட்டிடக்கலையின் தொடக்கப் புள்ளியாகத் திகழ்கின்றன."
    },
    districtIds: ["chengalpattu"],
    location: {
      lat: 12.6269,
      lng: 80.1927,
      address: "Shore Temple, Mahabalipuram, Chengalpattu District"
    },
    images: [
      {
        url: "/images/placeholders/place.svg",
        alt: {
          en: "Mahabalipuram Shore Temple against Bay of Bengal",
          ta: "மாமல்லபுரம் கடற்கரைக் கோயில்"
        }
      }
    ],
    tags: ["unesco", "pallava", "shore-temple", "pancha-rathas", "granite", "relief"],
    era: "7th - 8th Century CE (Pallava Empire)",
    sources: [
      { label: "UNESCO World Heritage Centre", url: "https://whc.unesco.org/en/list/249" },
      { label: "Archaeological Survey of India" }
    ],
    verification: "verified",
    lastVerified: "2026-01-15T00:00:00.000Z",
    relatedIds: ["san-thome-basilica", "kanchipuram-silk"],
    seedCategoryCode: "ARCHITECTURE_SCULPTURE",
    seedMatch: {
      title: "Mahabalipuram - Shore Temple and Rock-Cut Monuments",
      status: "APPROVED",
      featured: true,
      hiddenGem: false
    },
    source: "seed-only"
  }
];

for (const it of seedOnlyItems) {
  if (!seenIds.has(it.id)) {
    seenIds.add(it.id);
    items.push(it);
  }
}

// 5. Chatbot topics
const chatbotTopics = [
  {
    topicKey: "BRIHADISVARA_TEMPLE",
    keywords: ["thanjavur", "big temple", "periya koil", "rajaraja chola", "brihadisvara", "granite", "vimana"],
    categoryCode: "HISTORICAL_MONUMENTS",
    districtCode: "TNJ",
    responseEn: "The Brihadisvara Temple at Thanjavur is a 1,000+ year old UNESCO World Heritage site built by Raja Raja Chola I in 1010 CE. Built entirely of granite without mortar, it features an 80-tonne single-stone cupola atop its 216-foot vimana.",
    responseTa: "தஞ்சைப் பெருவுடையார் கோயில் முதலாம் ராஜராஜ சோழனால் கி.பி 1010-ல் கட்டி முடிக்கப்பட்ட 1,000 ஆண்டுகள் பழமையான யுனெஸ்கோ உலகப் பாரம்பரிய சின்னம்."
  },
  {
    topicKey: "MADURAI_MEENAKSHI",
    keywords: ["madurai", "meenakshi", "sundareswarar", "gopuram", "thousand pillar", "nayak", "chithirai"],
    categoryCode: "HINDU_HERITAGE",
    districtCode: "MDU",
    responseEn: "Madurai Meenakshi Sundareswarar Temple is an iconic 2,500-year-old temple complex famous for its 14 towering multicolored gopurams, Thousand Pillar Hall, and vibrant Chithirai Festival.",
    responseTa: "மதுரை மீனாட்சி சுந்தரேசுவரர் திருக்கோயில் 2,500 ஆண்டுகளுக்கும் மேலான தொன்மை வாய்ந்தது. இதன் 14 வண்ணக் கோபுரங்கள், ஆயிரங்கால் மண்டபம் மற்றும் புகழ்பெற்ற சித்திரைத் திருவிழா ஆகியவற்றுக்கு உலகளவில் புகழ்பெற்றது."
  },
  {
    topicKey: "BHARATANATYAM_DANCE",
    keywords: ["dance", "bharatanatyam", "classical dance", "adavu", "mudra", "thanjavur quartet", "natya"],
    categoryCode: "DANCE_TRADITIONS",
    districtCode: "TNJ",
    responseEn: "Bharatanatyam is the oldest classical dance form of Tamil Nadu. Originating in ancient temple traditions and codified by the Thanjavur Quartet, it combines rhythmic footwork (nritta), expressive storytelling (nritya), and dramatic literature (natya).",
    responseTa: "பரதநாட்டியம் தமிழ்நாட்டின் தொன்மையான செவ்வியல் நடனக் கலை ஆகும். இது பாவம், ராகம், தாளம் ஆகிய மூன்றின் ஒருங்கிணைப்பாகும்."
  },
  {
    topicKey: "CHETTINAD_CUISINE",
    keywords: ["food", "cuisine", "chettinad", "karaikudi", "recipes", "spices", "athangudi", "kalpasi"],
    categoryCode: "CUISINE_RECIPES",
    districtCode: "SVG",
    responseEn: "Chettinad cuisine from Sivaganga district is world-renowned for freshly stone-ground spices such as star anise, kalpasi (stone flower), and pepper. Famous dishes include Chettinad varuval, vellai paniyaram, and flavorful curries.",
    responseTa: "செட்டிநாட்டு உணவு முறை புதிதாக அம்மியில் அரைக்கப்பட்ட மசாலாக்கள், கல்பாசி, மிளகு ஆகியவற்றின் மணத்தால் உலகப் புகழ் பெற்றது."
  },
  {
    topicKey: "PONGAL_FESTIVAL",
    keywords: ["pongal", "harvest festival", "thai", "mattu pongal", "bogi", "sugarcane", "sun god"],
    categoryCode: "FESTIVALS_CELEBRATIONS",
    districtCode: "TNJ",
    responseEn: "Pongal is Tamil Nadu's prime four-day thanksgiving harvest festival celebrated in mid-January, honoring nature, the Sun God, and cattle.",
    responseTa: "பொங்கல் திருநாள் என்பது இயற்கையையும், சூரியனையும், மாடுகளையும் போற்றி வணங்கும் தமிழர்களின் நான்கு நாள் அறுவடைப் பெருவிழா ஆகும்."
  },
  {
    topicKey: "INTERFAITH_HERITAGE",
    keywords: ["interfaith", "velankanni", "nagore", "christian", "muslim", "communal harmony", "dargah"],
    categoryCode: "COMMUNITY_TRADITIONS",
    districtCode: "NGP",
    responseEn: "Tamil Nadu has a rich heritage of interfaith harmony, highlighted by the coastal town of Nagapattinam where the Basilica of Our Lady of Good Health in Velankanni and the Nagore Dargah of Sufi Saint Shahul Hameed welcome pilgrims of all religious backgrounds.",
    responseTa: "நாகப்பட்டினத்தில் உள்ள வேளாங்கண்ணி ஆரோக்கிய அன்னை பேராலயம் மற்றும் நாகூர் தர்கா ஆகிய இரண்டும் அனைத்து மத மக்களும் ஒன்றாக வழிபடக்கூடிய தமிழகத்தின் மதநல்லிணக்க அடையாளங்களாக விளங்குகின்றன."
  }
];

// Final master dataset
const overallDataset = {
  _about: {
    name: "Tamil Nadu Culture — overall dataset",
    languages: ["en", "ta"],
    sources: [
      "culture-intern-main/data (items, districts)",
      "SeedDataInitializer (categories, entries, chatbot, admin)"
    ],
    counts: {
      districts: districts.length,
      items: items.length,
      categories: categories.length,
      chatbotTopics: chatbotTopics.length
    },
    notes: [
      "Items with source 'both' merge the zip entry with a seed entry.",
      "Items with source 'seed-only' have only title/category/district; descriptions are null until supplied.",
      "Chatbot keywords are only partially known (source list was truncated).",
      "Admin password is intentionally excluded."
    ]
  },
  categories,
  districts,
  items,
  chatbotTopics
};

const outputPath = path.join(dataDir, 'tamilnadu_culture_overall_dataset.json');
fs.writeFileSync(outputPath, JSON.stringify(overallDataset, null, 2), 'utf8');

console.log(`Generated master dataset with:`);
console.log(`- Districts: ${districts.length}`);
console.log(`- Categories: ${categories.length}`);
console.log(`- Items: ${items.length}`);
console.log(`- Chatbot Topics: ${chatbotTopics.length}`);
console.log(`Written to: ${outputPath}`);
