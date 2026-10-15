/**
 * Tamil Nadu Cultural Heritage Discovery Platform
 * Application Controller (Avadi Architecture Reference)
 * Supports: Screen Switching, Left-Side Navigation Bar, Light/Dark Modes, No Animations
 */

const App = {
    categories: [],
    districts: [],
    featured: [],
    hiddenGems: [],
    recent: [],
    currentDetailEntryId: null,
    currentScreen: "home",
    currentDashTab: "overview",

    async init() {
        console.log("Initializing TN Heritage Platform...");

        // Initialize theme (Default: Light Mode)
        this.initTheme();

        // Initialize i18n
        if (window.I18n) {
            window.I18n.setLanguage(localStorage.getItem("tn_culture_lang") || "en");
        }

        // Initialize modules
        if (window.Auth) window.Auth.init();
        if (window.Collections) window.Collections.init();
        if (window.Chatbot) window.Chatbot.init();

        this.bindEvents();
        await this.loadInitialData();

        window.addEventListener("hashchange", () => {
            if (window.location.hash === "#/profile") {
                this.navigateToProfile();
            }
        });

        // Check if user previously logged in or accessing profile, else start at Home
        if (window.location.hash === "#/profile") {
            if (API.getUser()) {
                this.navigateToProfile();
            } else {
                this.showScreen("home");
            }
        } else if (API.getUser()) {
            this.showScreen("dashboard");
            this.switchDashboardTab("overview");
        } else {
            this.showScreen("home");
        }
    },

    bindEvents() {
        // Language selector listeners
        document.querySelectorAll(".lang-select-item").forEach(item => {
            item.addEventListener("click", (e) => {
                e.preventDefault();
                const lang = item.getAttribute("data-lang");
                if (window.I18n) window.I18n.setLanguage(lang);
                document.querySelectorAll(".selected-lang-label").forEach(lbl => {
                    lbl.textContent = lang.toUpperCase();
                });
            });
        });

        // Search inputs
        const dashSearch = document.getElementById("dashSearchInput");
        if (dashSearch) {
            dashSearch.addEventListener("keypress", (e) => {
                if (e.key === "Enter") this.executeDashSearch();
            });
        }
    },

    // ===================================================================
    // SCREEN & TAB NAVIGATION CONTROLLERS
    // ===================================================================
    showScreen(screenId) {
        this.currentScreen = screenId;
        document.querySelectorAll(".app-screen").forEach(s => s.classList.remove("active"));

        const targetScreen = document.getElementById(`screen${screenId.charAt(0).toUpperCase() + screenId.slice(1)}`);
        if (targetScreen) {
            targetScreen.classList.add("active");
            window.scrollTo({ top: 0, behavior: "instant" });
        }

        if (screenId === "dashboard") {
            this.switchDashboardTab(this.currentDashTab || "overview");
        }
    },

    enterDashboardTab(tabName) {
        this.showScreen("dashboard");
        this.switchDashboardTab(tabName);
    },

    navigateToProfile() {
        if (!API.getUser()) {
            this.showScreen("login");
            API.showToast("Please sign in to view your profile.", "info");
            return;
        }
        this.showScreen("dashboard");
        this.switchDashboardTab("profile");
        try {
            if (window.location.hash !== "#/profile") {
                history.pushState({ tab: "profile" }, "Citizen Profile", "#/profile");
            }
        } catch(e) {}
    },

    switchDashboardTab(tabName) {
        this.currentDashTab = tabName;

        // Update sidebar navigation active item
        document.querySelectorAll(".sidebar-nav-item").forEach(item => {
            if (item.getAttribute("data-tab") === tabName) {
                item.classList.add("active");
            } else {
                item.classList.remove("active");
            }
        });

        // Update mobile bottom nav active item
        document.querySelectorAll(".mobile-nav-item").forEach(item => {
            if (item.getAttribute("data-tab") === tabName) {
                item.classList.add("active");
            } else {
                item.classList.remove("active");
            }
        });

        // Hide all dashboard panels and show target panel
        document.querySelectorAll(".dash-panel").forEach(p => p.classList.remove("active"));
        const targetPanel = document.getElementById(`dashView${tabName.charAt(0).toUpperCase() + tabName.slice(1)}`);
        if (targetPanel) {
            targetPanel.classList.add("active");
            window.scrollTo({ top: 0, behavior: "instant" });
        }

        // Update top navbar section title - defaults to TN HERITAGE
        const titleEl = document.getElementById("topNavSectionTitle");
        if (titleEl) titleEl.textContent = "TN HERITAGE";

        // Close mobile sidebar if open
        const sidebar = document.getElementById("appSidebar");
        const backdrop = document.getElementById("sidebarBackdrop");
        if (sidebar && sidebar.classList.contains("show")) {
            sidebar.classList.remove("show");
            if (backdrop) backdrop.classList.remove("show");
        }

        // Tab specific triggers
        if (tabName === "profile" && window.Auth) {
            window.Auth.renderProfile();
        } else if (tabName === "map" && window.MapModule) {
            window.MapModule.initMap();
        } else if (tabName === "saved" && window.Collections) {
            window.Collections.loadFavourites();
        } else if (tabName === "admin" && window.Admin) {
            window.Admin.init();
        }
    },

    toggleSidebar() {
        const sidebar = document.getElementById("appSidebar");
        const backdrop = document.getElementById("sidebarBackdrop");
        if (sidebar) sidebar.classList.toggle("show");
        if (backdrop) backdrop.classList.toggle("show");
    },

    openFeedbackModal() {
        const modalEl = document.getElementById("feedbackModal");
        if (modalEl) {
            const m = bootstrap.Modal.getOrCreateInstance(modalEl);
            m.show();
        }
    },

    openChatbotModal() {
        const drawer = document.getElementById("chatbotDrawer");
        if (drawer) drawer.classList.add("active");
    },

    closeChatbotModal() {
        const drawer = document.getElementById("chatbotDrawer");
        if (drawer) drawer.classList.remove("active");
    },

    openEmergencyModal() {
        const modalEl = document.getElementById("emergencyModal");
        if (modalEl) {
            const m = bootstrap.Modal.getOrCreateInstance(modalEl);
            m.show();
        }
    },

    closeEmergencyModal() {
        const modalEl = document.getElementById("emergencyModal");
        if (modalEl) {
            const m = bootstrap.Modal.getInstance(modalEl);
            if (m) m.hide();
        }
    },

    // ===================================================================
    // THEME MANAGEMENT (DEFAULT LIGHT MODE, WITH DARK MODE TOGGLE)
    // ===================================================================
    initTheme() {
        const savedTheme = localStorage.getItem("heritage_theme") || "light";
        this.applyTheme(savedTheme);
    },

    toggleTheme() {
        const currentTheme = document.documentElement.getAttribute("data-theme") || "light";
        const nextTheme = currentTheme === "dark" ? "light" : "dark";
        this.applyTheme(nextTheme);
        API.showToast(`Switched to ${nextTheme === "dark" ? "Dark Mode" : "Light Mode"}.`, "info");
    },

    applyTheme(theme) {
        document.documentElement.setAttribute("data-theme", theme);
        document.documentElement.setAttribute("data-bs-theme", theme);
        if (document.body) {
            document.body.setAttribute("data-theme", theme);
            document.body.setAttribute("data-bs-theme", theme);
        }
        localStorage.setItem("heritage_theme", theme);

        document.querySelectorAll(".theme-icon").forEach(icon => {
            if (theme === "dark") {
                icon.className = "bi bi-sun-fill theme-icon text-warning";
            } else {
                icon.className = "bi bi-moon-stars-fill theme-icon";
            }
        });

        document.querySelectorAll(".theme-label").forEach(lbl => {
            lbl.textContent = theme === "dark" ? "Light Mode" : "Dark Mode";
        });
    },

    // ===================================================================
    // MODAL & DRAWER CONTROLS
    // ===================================================================
    openChatbotModal() {
        const drawer = document.getElementById("chatbotDrawer");
        if (drawer) drawer.classList.add("active");
    },

    closeChatbotModal() {
        const drawer = document.getElementById("chatbotDrawer");
        if (drawer) drawer.classList.remove("active");
    },

    openFeedbackModal() {
        const modalEl = document.getElementById("feedbackModal");
        if (modalEl) {
            const modal = new bootstrap.Modal(modalEl);
            modal.show();
        }
    },

    // ===================================================================
    // DATA FETCHING & RENDERING
    // ===================================================================
    async loadInitialData() {
        try {
            const [catRes, distRes, featRes, hiddenRes, recRes] = await Promise.all([
                API.get("/categories"),
                API.get("/districts"),
                API.get("/cultural/featured"),
                API.get("/cultural/hidden-gems"),
                API.get("/cultural/recent")
            ]);

            if (catRes.success) {
                this.categories = catRes.data;
                this.populateCategoryDropdowns(this.categories);
                this.renderCategoriesList(this.categories);
                const catCount = document.getElementById("statCategoriesCount");
                if (catCount) catCount.textContent = this.categories.length;
            }

            if (distRes.success) {
                this.districts = distRes.data;
                this.populateDistrictDropdowns(this.districts);
                this.renderDistrictsList(this.districts);
                const distCount = document.getElementById("statDistrictsCount");
                if (distCount) distCount.textContent = this.districts.length;
            }

            if (featRes.success) {
                this.featured = featRes.data;
                this.renderFeatured(this.featured);
            }

            if (hiddenRes.success) {
                this.hiddenGems = hiddenRes.data;
                this.renderHiddenGems(this.hiddenGems);
            }

            if (recRes.success) {
                this.recent = recRes.data;
                this.renderRecent(this.recent);
                this.renderFeedCards(this.recent);
                const entCount = document.getElementById("statEntriesCount");
                if (entCount) entCount.textContent = this.recent.length + "+";
            }

            this.updateFavouriteIcons();
        } catch (error) {
            console.error("Failed to load cultural data:", error);
        }
    },

    populateCategoryDropdowns(categories) {
        const selects = [
            document.getElementById("feedCategoryFilter"),
            document.getElementById("contribCategorySelect")
        ];

        selects.forEach(select => {
            if (!select) return;
            const current = select.value;
            select.innerHTML = select.id.includes("contrib") ?
                `<option value="">Select Cultural Category *</option>` :
                `<option value="">All Categories</option>`;

            categories.forEach(c => {
                const opt = document.createElement("option");
                opt.value = c.id;
                opt.textContent = c.nameEn;
                select.appendChild(opt);
            });
            if (current) select.value = current;
        });
    },

    populateDistrictDropdowns(districts) {
        const selects = [
            document.getElementById("feedDistrictFilter"),
            document.getElementById("contribDistrictSelect")
        ];

        selects.forEach(select => {
            if (!select) return;
            const current = select.value;
            select.innerHTML = select.id.includes("contrib") ?
                `<option value="">Select District *</option>` :
                `<option value="">All 38 Districts</option>`;

            districts.forEach(d => {
                const opt = document.createElement("option");
                opt.value = d.id;
                opt.textContent = `${d.nameEn} (${d.region})`;
                select.appendChild(opt);
            });
            if (current) select.value = current;
        });
    },

    renderFeatured(items) {
        const container = document.getElementById("dashFeaturedContainer");
        if (!container) return;
        container.innerHTML = items.slice(0, 4).map(item => `
            <div class="col-6 col-sm-6 col-lg-3">
                ${this.createCardHtml(item)}
            </div>
        `).join('');
    },

    renderRecent(items) {
        const container = document.getElementById("dashRecentContainer");
        if (!container) return;
        container.innerHTML = items.slice(0, 4).map(item => `
            <div class="col-6 col-sm-6 col-lg-3">
                ${this.createCardHtml(item)}
            </div>
        `).join('');
    },

    renderFeedCards(items) {
        const container = document.getElementById("feedCardsContainer");
        if (!container) return;
        if (items.length === 0) {
            container.innerHTML = `<div class="col-12 text-center text-muted py-5">No cultural heritage records found matching your filters.</div>`;
            return;
        }
        container.innerHTML = items.map(item => `
            <div class="col-6 col-sm-6 col-lg-4">
                ${this.createCardHtml(item)}
            </div>
        `).join('');
    },

    renderHiddenGems(items) {
        const container = document.getElementById("hiddenGemsContainer");
        if (!container) return;
        if (!items || items.length === 0) {
            container.innerHTML = `
                <div class="col-12 text-center py-5">
                    <div class="p-4 bg-light rounded-4 max-w-500 mx-auto border shadow-sm">
                        <i class="bi bi-compass text-primary fs-1 mb-3 d-block opacity-75"></i>
                        <h5 class="fw-bold">No Hidden Gems Discovered Yet</h5>
                        <p class="text-muted small mb-3">Be the first citizen explorer to share a forgotten village shrine, ancient rock-cut cave, or secluded heritage trail!</p>
                        <button class="btn btn-primary btn-sm px-3 rounded-pill" onclick="App.openPostHiddenGemModal()">
                            <i class="bi bi-plus-circle-fill me-1"></i> Post New Hidden Place
                        </button>
                    </div>
                </div>
            `;
            return;
        }
        container.innerHTML = items.map(item => `
            <div class="col-6 col-sm-6 col-lg-4">
                ${this.createCardHtml(item)}
            </div>
        `).join('');
    },

    renderDistrictsList(districts) {
        const container = document.getElementById("districtsListContainer");
        if (!container) return;
        container.innerHTML = districts.map(d => `
            <div class="col-6 col-md-4 col-lg-3">
                <div class="district-tile-item" onclick="App.filterByDistrictId(${d.id})">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="badge bg-success bg-opacity-10 text-success small">${d.region}</span>
                        <i class="bi bi-geo-alt-fill text-danger small"></i>
                    </div>
                    <div class="fw-bold small text-truncate">${d.nameEn}</div>
                    <div class="text-muted small">${d.nameTa || d.code}</div>
                </div>
            </div>
        `).join('');
    },

    renderCategoriesList(categories) {
        const container = document.getElementById("categoriesListContainer");
        if (!container) return;
        container.innerHTML = categories.map(c => `
            <div class="col-6 col-sm-4 col-lg-3">
                <div class="cat-box-item" onclick="App.filterByCategoryId(${c.id})">
                    <div class="cat-icon-circle">
                        <i class="bi ${c.iconClass || 'bi-bookmark-star'}"></i>
                    </div>
                    <div class="fw-bold small text-truncate">${c.nameEn}</div>
                    <div class="text-muted small">${c.nameTa || ''}</div>
                </div>
            </div>
        `).join('');
    },

    createCardHtml(item) {
        const isTa = window.I18n && window.I18n.getLanguage() === "ta";
        const title = isTa && item.titleTa ? item.titleTa : item.title;
        const catName = item.category ? item.category.nameEn : "Heritage";
        const distName = item.district ? item.district.nameEn : "Tamil Nadu";
        const isFav = window.Collections ? window.Collections.isEntryFavourited(item.id) : false;

        return `
            <div class="dash-card" onclick="App.openDetailModal(${item.id})">
                <div class="position-relative">
                    <img src="${item.coverImageUrl || 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600'}" class="dash-card-cover" alt="${title}" loading="lazy" onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600';">
                    <button class="btn btn-sm btn-light text-danger position-absolute top-0 end-0 m-2 rounded-circle shadow-sm btn-favourite-toggle ${isFav ? 'is-favourited' : ''}"
                            data-favourite-entry-id="${item.id}"
                            title="${isFav ? 'Remove from Saved Library' : 'Save to My Library'}"
                            onclick="event.stopPropagation(); Collections.toggleFavourite(${item.id});">
                        <i class="bi ${isFav ? 'bi-heart-fill text-danger' : 'bi-heart'}"></i>
                    </button>
                    <span class="badge bg-dark bg-opacity-75 text-white position-absolute bottom-0 start-0 m-2 small">
                        <i class="bi bi-geo-alt-fill text-warning me-1"></i>${distName}
                    </span>
                </div>
                <div class="dash-card-body">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="badge bg-success bg-opacity-10 text-success small">${catName}</span>
                        <span class="text-warning small fw-bold"><i class="bi bi-star-fill me-1"></i>${item.averageRating ? item.averageRating.toFixed(1) : '5.0'}</span>
                    </div>
                    <h4 class="dash-card-title">${title}</h4>
                    <p class="dash-card-desc">${item.shortDescription}</p>
                    <div class="mt-auto pt-2 border-top d-flex justify-content-between align-items-center small text-muted">
                        <span>${item.authenticityType ? item.authenticityType.replace(/_/g, ' ') : 'Verified'}</span>
                        <span class="text-success fw-bold">Explore →</span>
                    </div>
                </div>
            </div>
        `;
    },

    // ===================================================================
    // SEARCH & FILTERS
    // ===================================================================
    async applyFeedFilters() {
        const catId = document.getElementById("feedCategoryFilter")?.value;
        const distId = document.getElementById("feedDistrictFilter")?.value;

        let url = "/cultural/search?";
        if (catId) url += `categoryId=${catId}&`;
        if (distId) url += `districtId=${distId}&`;

        try {
            const res = await API.get(url);
            if (res.success && res.data) {
                const items = res.data.content || res.data;
                this.renderFeedCards(items);
            }
        } catch (e) {
            console.error("Filter error:", e);
        }
    },

    async executeDashSearch() {
        const keyword = document.getElementById("dashSearchInput")?.value.trim();
        this.switchDashboardTab("feed");

        try {
            const url = keyword ? `/cultural/search?keyword=${encodeURIComponent(keyword)}` : `/cultural/recent`;
            const res = await API.get(url);
            if (res.success && res.data) {
                const items = res.data.content || res.data;
                this.renderFeedCards(items);
            }
        } catch (e) {
            console.error("Search error:", e);
        }
    },

    filterByCategoryId(catId) {
        this.switchDashboardTab("feed");
        const filterEl = document.getElementById("feedCategoryFilter");
        if (filterEl) filterEl.value = catId;
        this.applyFeedFilters();
    },

    filterByDistrictId(distId) {
        this.switchDashboardTab("feed");
        const filterEl = document.getElementById("feedDistrictFilter");
        if (filterEl) filterEl.value = distId;
        this.applyFeedFilters();
    },

    // ===================================================================
    // DETAIL MODAL
    // ===================================================================
    async openDetailModal(id) {
        this.currentDetailEntryId = id;
        try {
            const res = await API.get(`/cultural/${id}`);
            if (res.success && res.data) {
                const item = res.data;

                document.getElementById("detailModalCoverImg").src = item.coverImageUrl || "https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=800";
                document.getElementById("detailModalTitle").textContent = item.title;
                document.getElementById("detailModalTitleTa").textContent = item.titleTa || item.alternateNames || "";
                document.getElementById("detailDistrictBadge").textContent = item.district ? item.district.nameEn : "Tamil Nadu";
                document.getElementById("detailCategoryBadge").textContent = item.category ? item.category.nameEn : "Heritage";
                document.getElementById("detailAuthBadge").textContent = item.authenticityType ? item.authenticityType.replace(/_/g, ' ') : "Verified";

                document.getElementById("detailModalShortDesc").textContent = item.shortDescription;
                document.getElementById("detailModalFullDesc").textContent = item.fullDescription || item.shortDescription;

                document.getElementById("detailHistoryOrigin").textContent = item.historyOrigin || "Historical archives";
                document.getElementById("detailCulturalSignificance").textContent = item.culturalSignificance || "Heritage preservation";
                document.getElementById("detailSourceReferences").textContent = item.sourceReferences || "Government Archaeological Records";

                this.currentDetailItem = item;

                const favBtn = document.getElementById("detailFavToggleBtn");
                if (favBtn) {
                    favBtn.setAttribute("data-favourite-entry-id", item.id);
                    const isFav = window.Collections ? window.Collections.isEntryFavourited(item.id) : false;
                    if (isFav) {
                        favBtn.className = "btn btn-danger btn-sm";
                        favBtn.innerHTML = '<i class="bi bi-heart-fill me-1"></i>Saved in Library';
                        favBtn.title = "Remove from Saved Library";
                    } else {
                        favBtn.className = "btn btn-outline-danger btn-sm";
                        favBtn.innerHTML = '<i class="bi bi-heart me-1"></i>Save to Library';
                        favBtn.title = "Save to My Library";
                    }

                    favBtn.onclick = async () => {
                        if (window.Collections) {
                            await window.Collections.toggleFavourite(item.id, item);
                            const nowFav = window.Collections.isEntryFavourited(item.id);
                            if (nowFav) {
                                favBtn.className = "btn btn-danger btn-sm";
                                favBtn.innerHTML = '<i class="bi bi-heart-fill me-1"></i>Saved in Library';
                                favBtn.title = "Remove from Saved Library";
                            } else {
                                favBtn.className = "btn btn-outline-danger btn-sm";
                                favBtn.innerHTML = '<i class="bi bi-heart me-1"></i>Save to Library';
                                favBtn.title = "Save to My Library";
                            }
                        }
                    };
                }

                const directionsBtn = document.getElementById("detailDirectionsBtn");
                if (directionsBtn) {
                    directionsBtn.onclick = () => {
                        if (item.latitude && item.longitude) {
                            window.open(`https://www.google.com/maps?q=${item.latitude},${item.longitude}`, '_blank');
                        } else {
                            API.showToast("Coordinates not available for this site.", "info");
                        }
                    };
                }

                const modal = new bootstrap.Modal(document.getElementById("culturalDetailModal"));
                modal.show();
            }
        } catch (e) {
            API.showToast("Could not load details.", "error");
        }
    },

    // ===================================================================
    // FORM SUBMISSIONS
    // ===================================================================
    async handleContributeSubmit(e) {
        e.preventDefault();
        const user = API.getUser();
        if (!user) {
            API.showToast("Please sign in to contribute cultural records.", "warning");
            this.showScreen("login");
            return;
        }

        const payload = {
            title: document.getElementById("contribTitle").value.trim(),
            titleTa: document.getElementById("contribTitleTa").value.trim(),
            categoryId: parseInt(document.getElementById("contribCategorySelect").value),
            districtId: parseInt(document.getElementById("contribDistrictSelect").value),
            townVillage: document.getElementById("contribTown").value.trim(),
            authenticityType: document.getElementById("contribAuthenticity").value,
            shortDescription: document.getElementById("contribShortDesc").value.trim(),
            fullDescription: document.getElementById("contribFullDesc").value.trim(),
            coverImageUrl: document.getElementById("contribCoverUrl").value.trim() || "https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600",
            sourceReferences: document.getElementById("contribSourceRef").value.trim()
        };

        try {
            await API.post("/contributions", payload);
            API.showToast("Heritage submission received! Pending moderation review.", "success");
            document.getElementById("citizenContributeForm").reset();
            this.switchDashboardTab("overview");
        } catch (error) {
            API.showToast(error.message || "Failed to submit entry.", "error");
        }
    },

    async handleCorrectionSubmit(e) {
        e.preventDefault();
        const topic = document.getElementById("feedbackTopic").value.trim();
        const comment = document.getElementById("feedbackComment").value.trim();

        try {
            await API.post("/feedback", {
                feedbackType: "CORRECTION_SUGGESTION",
                subject: topic,
                message: comment
            });
            API.showToast("Thank you! Your correction suggestion was logged.", "success");
            const modal = bootstrap.Modal.getInstance(document.getElementById("feedbackModal"));
            if (modal) modal.hide();
            document.getElementById("correctionForm").reset();
        } catch (error) {
            API.showToast(error.message || "Failed to send feedback.", "error");
        }
    },

    openPostHiddenGemModal() {
        if (!window.API || !window.API.getToken()) {
            window.API.showToast("Please sign in or register to post a hidden place.", "warning");
            const authModalEl = document.getElementById("authModal");
            if (authModalEl) {
                const authModal = bootstrap.Modal.getOrCreateInstance(authModalEl);
                authModal.show();
            }
            return;
        }

        // Populate districts dropdown with 38 districts
        const distSelect = document.getElementById("gemDistrictSelect");
        if (distSelect && this.districts && this.districts.length > 0) {
            distSelect.innerHTML = `<option value="">Select District (38 Districts)</option>` +
                this.districts.map(d => `<option value="${d.id}">${d.nameEn} (${d.nameTa || d.code})</option>`).join('');
        }

        // Populate categories dropdown
        const catSelect = document.getElementById("gemCategorySelect");
        if (catSelect && this.categories && this.categories.length > 0) {
            catSelect.innerHTML = `<option value="">Select Category</option>` +
                this.categories.map(c => `<option value="${c.id}" ${c.code === 'HIDDEN_GEMS' ? 'selected' : ''}>${c.nameEn}</option>`).join('');
        }

        const modalEl = document.getElementById("postHiddenGemModal");
        if (modalEl) {
            const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
            modal.show();
        }
    },

    autoFillGemLocation() {
        if (!navigator.geolocation) {
            API.showToast("Geolocation is not supported by your browser.", "warning");
            return;
        }
        API.showToast("Detecting your current GPS coordinates...", "info");
        navigator.geolocation.getCurrentPosition(
            (pos) => {
                const latInput = document.getElementById("gemLatitude");
                const lngInput = document.getElementById("gemLongitude");
                if (latInput) latInput.value = pos.coords.latitude.toFixed(6);
                if (lngInput) lngInput.value = pos.coords.longitude.toFixed(6);
                API.showToast("GPS coordinates populated!", "success");
            },
            (err) => {
                API.showToast("Unable to retrieve location: " + err.message, "error");
            },
            { enableHighAccuracy: true, timeout: 8000 }
        );
    },

    async handlePostHiddenGemSubmit(e) {
        e.preventDefault();

        if (!API.getToken()) {
            API.showToast("Please sign in to submit your hidden discovery.", "warning");
            return;
        }

        const title = document.getElementById("gemTitle")?.value.trim();
        const titleTa = document.getElementById("gemTitleTa")?.value.trim() || "";
        const districtId = document.getElementById("gemDistrictSelect")?.value;
        const categoryId = document.getElementById("gemCategorySelect")?.value;
        const townVillage = document.getElementById("gemTownVillage")?.value.trim();
        const lat = document.getElementById("gemLatitude")?.value;
        const lng = document.getElementById("gemLongitude")?.value;
        const shortDesc = document.getElementById("gemShortDesc")?.value.trim();
        const fullDesc = document.getElementById("gemFullDesc")?.value.trim() || shortDesc;
        const coverImageUrl = document.getElementById("gemCoverImageUrl")?.value.trim() || "/images/placeholders/place.svg";
        const tags = document.getElementById("gemTags")?.value.trim();

        if (!title || !districtId || !categoryId || !townVillage || !shortDesc) {
            API.showToast("Please fill in all required fields marked with *", "warning");
            return;
        }

        const submitBtn = document.getElementById("btnSubmitHiddenGem");
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = `<span class="spinner-border spinner-border-sm me-1"></span>Submitting to Database...`;
        }

        try {
            const payload = {
                title: title,
                titleTa: titleTa,
                categoryId: parseInt(categoryId),
                districtId: parseInt(districtId),
                townVillage: townVillage,
                latitude: lat ? parseFloat(lat) : null,
                longitude: lng ? parseFloat(lng) : null,
                shortDescription: shortDesc,
                fullDescription: fullDesc,
                folkloreStories: fullDesc,
                culturalSignificance: shortDesc,
                coverImageUrl: coverImageUrl,
                tags: tags ? `${tags}, hidden-gem` : "hidden-gem",
                authenticityType: "COMMUNITY_ORAL_HISTORY"
            };

            const res = await API.post("/contributions", payload);
            if (res.success) {
                API.showToast(`Hidden place "${title}" posted to database! It is queued for moderation review.`, "success");

                // Reset form
                document.getElementById("postHiddenGemForm")?.reset();

                // Close modal
                const modalEl = document.getElementById("postHiddenGemModal");
                if (modalEl) {
                    const modal = bootstrap.Modal.getInstance(modalEl);
                    if (modal) modal.hide();
                }

                // If user is admin, inform about moderation
                const user = window.Auth ? window.Auth.getUser() : null;
                if (user && user.role === "ROLE_ADMIN") {
                    API.showToast("Admin access: You can approve this immediately in the Moderation Queue.", "info");
                }
            } else {
                API.showToast(res.message || "Failed to submit hidden place.", "error");
            }
        } catch (error) {
            API.showToast(error.message || "Network error while submitting.", "error");
        } finally {
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = `<i class="bi bi-cloud-arrow-up-fill me-1"></i>Submit for Cultural Review`;
            }
        }
    },

    updateFavouriteIcons() {
        if (window.Collections) {
            window.Collections.updateAllHeartIcons();
        }
    }
};

window.App = App;
document.addEventListener("DOMContentLoaded", () => App.init());
