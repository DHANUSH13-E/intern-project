# Tamil Nadu Cultural Heritage Discovery and Preservation Platform
> *"Discover the Stories, Traditions, and Hidden Treasures of Tamil Nadu."*

A production-grade, multilingual, database-driven web application built for cultural heritage preservation, cultural tourism, and community-sourced heritage documentation across the 38 districts of Tamil Nadu.

---

## 🏛️ Project Overview

The **Tamil Nadu Cultural Heritage Discovery Platform** bridges ancient heritage with modern digital exploration. Going far beyond a conventional tourism directory, it contextualizes monuments, temple architecture, performing arts, handloom textiles, culinary traditions, and village oral lore while ensuring strict inclusiveness across all religions, communities, and regions.

### Key Highlights
- **Geographical Scope**: Comprehensive coverage of all 38 districts of Tamil Nadu (categorized into Northern, Kaveri Delta, Western/Kongu Nadu, and Southern/Pandia Nadu regions), architected for modular expansion to other Indian states.
- **20 Curated Cultural Categories**: Covering historical monuments, Hindu/Christian/Islamic/Jain/Buddhist heritage, classical & folk music, dance forms, traditional dress, cuisine, festivals, and lesser-known hidden gems.
- **Authenticity Tagging**: Distinguishes between:
  - `HISTORICAL_FACT` (Documented Historical Facts)
  - `ARCHAEOLOGICAL_SCHOLARLY` (Excavated and Scholarly Evidence)
  - `COMMUNITY_ORAL_HISTORY` (Grassroots Community Oral Histories)
  - `RELIGIOUS_TRADITION` (Faith & Living Ritual Observances)
  - `FOLKLORE_LEGEND` (Myths and Folklore)
- **Community Preservation & Moderation Workflow**: Citizens can submit hidden sites and traditions. Submissions enter a strict `PENDING` review queue until audited and approved by administrators.
- **7-Language Multilingual Engine**: Seamless UI translation into Tamil, English, Hindi, Telugu, Malayalam, Kannada, and French.
- **Cultural Knowledge & Travel Chatbot**: Retrieval-based assistant backed directly by verified database records, providing factual Q&A and district travel recommendations without hallucinations.
- **Dual Interactive Mapping**: OpenStreetMap integration with accessible table view fallback and offline SVG district discovery.
- **Personal Cultural Library**: Favourites toggle and custom collections (*"Places I Want to Visit"*, *"Tamil Folk Arts"*).

---

## 💻 Mandatory Technology Stack

This application complies strictly with the company's approved technology guidelines:

| Layer | Approved Technology | Details |
|---|---|---|
| **Backend** | Java Core (Java 21 LTS / 26) | Standard object-oriented architecture |
| **Framework** | Spring Boot 3.3.4 | Spring MVC, REST Controllers, Embedded Tomcat |
| **Persistence** | Spring Data JPA + Hibernate 6 | Relational ORM mapping, JPQL repository queries |
| **Security** | Spring Security 6 | BCrypt password hashing, stateless JWT authentication, RBAC |
| **Database** | MySQL 8.0 | Primary production database with UTF-8mb4 character set (H2 in-memory profile included for zero-setup demo/testing) |
| **Frontend** | HTML5, CSS3, Vanilla JavaScript | Modular ES6 script modules with responsive Bootstrap 5.3.3 |
| **Build Tool** | Apache Maven | Maven Wrapper (`mvnw.cmd` / `./mvnw`) included |

---

## 👥 User Roles & Access Control

The platform enforces exactly two application roles:

| Feature / Permission | `ROLE_PUBLIC_USER` | `ROLE_ADMIN` |
|---|:---:|:---:|
| Browse Published Cultural Entries & Guides | ✅ | ✅ |
| Filter by Category, District, and Authenticity | ✅ | ✅ |
| Interactive Map & District Travel Discovery | ✅ | ✅ |
| Cultural & Travel Guidance Chatbot | ✅ | ✅ |
| Submit Hidden Places & Cultural Knowledge | ✅ *(Must be verified user)* | ✅ |
| Save Favourites & Create Custom Collections | ✅ *(Private to user)* | ✅ |
| Rate Entries (1-5 stars) & Submit Reviews | ✅ | ✅ |
| Report Inaccurate Information & Suggest Corrections | ✅ | ✅ |
| Submit Application Feedback | ✅ | ✅ |
| Access Administrative Moderation Portal | ❌ *(HTTP 403 Forbidden)* | ✅ |
| Approve / Reject / Request Changes on Submissions | ❌ | ✅ |
| Investigate & Resolve Factual Inaccuracy Reports | ❌ | ✅ |
| Manage User Accounts & Permissions | ❌ | ✅ |

---

## 🚀 Quick Start & Running Locally

### Prerequisites
- **Java Development Kit (JDK 21 or later)** installed.
- **MySQL Server 8.0** (optional if running in standalone dev mode).

### Option A: Zero-Setup Standalone Demo Mode (Recommended for Evaluation)
The project includes a pre-configured `dev` profile using in-memory MySQL compatibility mode with automatic baseline seeding (all 38 districts, 20 categories, 13 rich cultural entries, admin credentials, and chatbot QA knowledge):

```powershell
# Open terminal in project root: d:\gitprojects\culture-graph-project
.\mvnw.cmd spring-boot:run "-Dspring-boot.run.profiles=dev"
```

Once started, open your browser and navigate to:
👉 **`http://localhost:8080`**

### Option B: Running with Local MySQL 8.0 Server
1. Create the MySQL database:
   ```sql
   CREATE DATABASE tamilnadu_culture_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
2. In `src/main/resources/application.properties`, configure your MySQL credentials:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/tamilnadu_culture_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8
   spring.datasource.username=root
   spring.datasource.password=YOUR_MYSQL_PASSWORD
   ```
3. Run the application:
   ```powershell
   .\mvnw.cmd spring-boot:run
   ```

---

## 🔑 Pre-Configured Demo Credentials

| Role | Email | Password | Purpose |
|---|---|---|---|
| **Administrator** | `admin@tamilnaduculture.gov.in` | `Admin@Culture2026` | Full access to Moderation Queue, Reports, and Users |
| **Public User** | Any registered user via UI | Chosen at registration | Auto-fill Sample OTP enabled in dev mode |

---

## 📡 REST API Architecture

### Authentication (`/api/auth`)
- `POST /api/auth/register` — Register a new citizen account and dispatch email OTP.
- `POST /api/auth/verify-otp` — Verify 6-digit OTP and activate account.
- `POST /api/auth/resend-otp` — Resend verification code (enforces 60-second cooldown).
- `POST /api/auth/login` — Authenticate and receive stateless JWT token.
- `GET /api/auth/me` — Retrieve current authenticated user profile.

### Cultural Exploration (`/api/cultural`)
- `GET /api/cultural/featured` — Retrieve curated cultural discoveries.
- `GET /api/cultural/hidden-gems` — Retrieve lesser-known heritage and rock-cut sites.
- `GET /api/cultural/recent` — Recently approved community submissions.
- `GET /api/cultural/map` — Geo-referenced entries for interactive map.
- `GET /api/cultural/search` — Search with keywords, district, category, and authenticity filters.
- `GET /api/cultural/{id}?lang={code}` — Complete detailed cultural guide with multilingual fallback.

### Community Submissions (`/api/contributions`)
- `POST /api/contributions` — Submit new cultural knowledge or hidden place (status `PENDING`).
- `GET /api/contributions/my` — Track status of own submissions.

### Personal Collections & Favourites (`/api`)
- `POST /api/favourites/{entryId}/toggle` — Add/remove entry from personal favourites.
- `GET /api/favourites` — List user's saved favourites.
- `GET /api/collections` — List user's custom collections.
- `POST /api/collections` — Create new personal collection.
- `DELETE /api/collections/{id}` — Delete personal collection.
- `POST /api/collections/{collectionId}/items/{entryId}` — Add entry to collection.
- `DELETE /api/collections/{collectionId}/items/{entryId}` — Remove entry from collection.

### Chatbot Knowledge & Travel Guidance (`/api/chatbot`)
- `POST /api/chatbot/message` — Query the cultural retrieval engine for historical facts or district itineraries.

### Moderation & Administration (`/api/admin`)
- `GET /api/admin/dashboard` — Platform overview metrics.
- `GET /api/admin/submissions?status={status}` — Submissions moderation queue.
- `PUT /api/admin/submissions/{id}/moderate` — Change status (`APPROVED`, `REJECTED`, `CHANGES_REQUESTED`) with audit notes.
- `GET /api/admin/reports` — Inaccuracy report investigation list.
- `PUT /api/admin/reports/{id}/resolve` — Resolve inaccuracy reports.
- `GET /api/admin/users` — List registered citizen accounts.
- `PUT /api/admin/users/{id}/toggle-status` — Enable or disable citizen account.

---

## 📂 Project Structure

```
culture-graph-project/
├── pom.xml                                    # Maven dependencies & build definitions
├── mvnw & mvnw.cmd                            # Self-contained Maven Wrapper
├── setup_database.sql                         # MySQL database creation script
├── README.md                                  # Complete project documentation
└── src/
    ├── main/
    │   ├── java/com/tamilnadu/culture/
    │   │   ├── CulturePlatformApplication.java# Main Spring Boot entry point
    │   │   ├── config/
    │   │   │   ├── SecurityConfig.java        # Spring Security 6 RBAC & filter chain
    │   │   │   └── SeedDataInitializer.java   # Baseline data seeder (districts, entries, admin)
    │   │   ├── controller/
    │   │   │   ├── AuthController.java        # Registration, Email OTP, Login
    │   │   │   ├── CulturalEntryController.java # Public cultural guides & search
    │   │   │   ├── CategoryAndDistrictController.java # Districts & categories
    │   │   │   ├── ContributionController.java # Community submissions
    │   │   │   ├── FavouriteAndCollectionController.java # Favourites & Collections
    │   │   │   ├── RatingAndFeedbackController.java # Ratings & Inaccuracy reports
    │   │   │   ├── ChatbotController.java     # Q&A & Travel guidance
    │   │   │   └── AdminController.java       # Moderation & management portal
    │   │   ├── dto/                           # Data Transfer Objects & validation
    │   │   ├── entity/                        # JPA Entities (User, CulturalEntry, etc.)
    │   │   ├── exception/                     # Global REST exception handler
    │   │   ├── repository/                    # Spring Data JPA repositories
    │   │   ├── security/                      # JWT Token Provider & Auth Filter
    │   │   └── service/                       # Business logic services
    │   └── resources/
    │       ├── application.properties         # Primary production configuration
    │       ├── application-dev.properties     # Standalone dev profile configuration
    │       └── static/
    │           ├── index.html                 # Responsive single-page application
    │           ├── css/
    │           │   └── style.css              # Custom Tamil Nadu heritage design system
    │           └── js/
    │               ├── i18n.js                # 7-Language translation dictionary
    │               ├── api.js                 # Centralized REST client with notifications
    │               ├── auth.js                # Authentication & Email OTP flow
    │               ├── app.js                 # Core frontend application controller
    │               ├── map.js                 # Dual-mode interactive map & list engine
    │               ├── collections.js         # Favourites and custom collections
    │               ├── chatbot.js             # Cultural assistant & travel guide
    │               └── admin.js               # Administrative moderation portal
```

---

## 🛡️ Cultural Ethics & Inclusiveness Commitment

The Tamil Nadu Cultural Heritage Discovery Platform adheres strictly to cultural ethics:
1. **Respectful Multi-Faith Representation**: Equal, authentic documentation of Hindu Shaivite/Vaishnavite, Christian, Islamic Sufi, Jain, Buddhist, and indigenous village traditions.
2. **Epistemological Honesty**: Clearly labeled source attributions distinguishing historical facts and archaeological findings from sacred beliefs and folklore.
3. **Data Integrity**: Contributor consent and administrative verification required before any community submission is published.
