/**
 * Tamil Nadu Cultural Heritage Discovery Platform
 * Favourites & Personal Cultural Collections Engine
 */

const Collections = {
    favourites: [],
    collections: [],
    LOCAL_KEY: "tn_saved_library",
    LOCAL_IDS_KEY: "tn_favourite_ids",

    async init() {
        this.bindEvents();
        // Load local favourites immediately for instant responsiveness
        this.loadLocalFavourites();
        this.updateAllHeartIcons();
        this.renderFavouritesList();

        // If authenticated, synchronize with backend
        if (API.getToken()) {
            await this.loadFavourites();
            await this.loadCollections();
        }
    },

    bindEvents() {
        const createCollectionForm = document.getElementById("createCollectionForm");
        if (createCollectionForm) {
            createCollectionForm.addEventListener("submit", (e) => this.handleCreateCollection(e));
        }
    },

    loadLocalFavourites() {
        try {
            const raw = localStorage.getItem(this.LOCAL_KEY);
            if (raw) {
                const parsed = JSON.parse(raw);
                if (Array.isArray(parsed)) {
                    this.favourites = parsed;
                }
            }
        } catch (e) {
            console.warn("Could not load local favourites:", e);
            this.favourites = [];
        }
    },

    saveLocalFavourites() {
        try {
            localStorage.setItem(this.LOCAL_KEY, JSON.stringify(this.favourites));
            const ids = this.favourites.map(f => {
                if (f.entry && f.entry.id) return f.entry.id;
                if (f.id) return f.id;
                return null;
            }).filter(Boolean);
            localStorage.setItem(this.LOCAL_IDS_KEY, JSON.stringify(ids));
        } catch (e) {
            console.warn("Could not save local favourites:", e);
        }
    },

    async loadFavourites() {
        try {
            if (!API.getToken()) {
                this.loadLocalFavourites();
                this.renderFavouritesList();
                this.updateAllHeartIcons();
                return;
            }
            const res = await API.get("/favourites");
            if (res.success && Array.isArray(res.data)) {
                const serverData = res.data;
                const serverEntryIds = new Set(serverData.map(f => f.entry ? String(f.entry.id) : String(f.id)));

                // Sync any locally saved items that are not yet on the server
                if (this.favourites && this.favourites.length > 0) {
                    for (const localItem of this.favourites) {
                        const localId = localItem.entry ? String(localItem.entry.id) : String(localItem.id);
                        if (localId && !serverEntryIds.has(localId)) {
                            try {
                                await API.post(`/favourites/${localId}/toggle`);
                            } catch (syncErr) {
                                console.warn("Syncing favourite to server:", syncErr);
                            }
                        }
                    }
                    try {
                        const updatedRes = await API.get("/favourites");
                        if (updatedRes.success && Array.isArray(updatedRes.data)) {
                            this.favourites = updatedRes.data;
                        } else {
                            this.favourites = serverData;
                        }
                    } catch (e) {
                        this.favourites = serverData;
                    }
                } else {
                    this.favourites = serverData;
                }

                this.saveLocalFavourites();
                this.renderFavouritesList();
                this.updateAllHeartIcons();
            }
        } catch (e) {
            console.error("Error loading favourites from server:", e);
            this.loadLocalFavourites();
            this.renderFavouritesList();
            this.updateAllHeartIcons();
        }
    },

    async loadCollections() {
        try {
            if (!API.getToken()) {
                this.collections = [];
                this.renderCollectionsList();
                return;
            }
            const res = await API.get("/collections");
            if (res.success && Array.isArray(res.data)) {
                this.collections = res.data;
                this.renderCollectionsList();
                this.updateCollectionDropdowns();
            }
        } catch (e) {
            console.error("Error loading collections:", e);
        }
    },

    async toggleFavourite(entryId, explicitEntry) {
        if (!entryId) return;

        // 1. Locate the entry object to save complete data (for rendering cards)
        let entry = explicitEntry || null;
        if (!entry && window.App) {
            if (window.App.currentDetailItem && String(window.App.currentDetailItem.id) === String(entryId)) {
                entry = window.App.currentDetailItem;
            } else {
                const pools = [
                    ...(window.App.featured || []),
                    ...(window.App.recent || []),
                    ...(window.App.hiddenGems || [])
                ];
                entry = pools.find(p => String(p.id) === String(entryId)) || null;
            }
        }

        const isCurrentlyFav = this.isEntryFavourited(entryId);

        if (isCurrentlyFav) {
            // Remove from favourites
            this.favourites = this.favourites.filter(f => {
                const fId = f.entry ? f.entry.id : f.id;
                return String(fId) !== String(entryId);
            });
            this.saveLocalFavourites();
            this.updateAllHeartIcons();
            this.renderFavouritesList();
            API.showToast("Removed from My Saved Library", "info");

            // If user has token, sync delete with backend
            if (API.getToken()) {
                try {
                    await API.post(`/favourites/${entryId}/toggle`);
                } catch (err) {
                    console.warn("Backend toggle favourite error:", err);
                }
            }
        } else {
            // If entry object is not available yet, attempt a quick fetch or create fallback
            if (!entry) {
                try {
                    const fetchRes = await API.get(`/cultural/${entryId}`);
                    if (fetchRes.success && fetchRes.data) {
                        entry = fetchRes.data;
                    }
                } catch (e) {}
            }

            const itemToSave = {
                id: Date.now(),
                entry: entry || {
                    id: entryId,
                    title: "Tamil Cultural Heritage Site",
                    shortDescription: "Saved heritage item in your collection.",
                    coverImageUrl: "/images/placeholders/place.svg",
                    district: { nameEn: "Tamil Nadu", nameTa: "தமிழ்நாடு" },
                    category: { nameEn: "Heritage", nameTa: "பாரம்பரியம்" }
                },
                createdAt: new Date().toISOString()
            };

            this.favourites.unshift(itemToSave);
            this.saveLocalFavourites();
            this.updateAllHeartIcons();
            this.renderFavouritesList();
            API.showToast("Saved to My Saved Library ❤️", "success");

            // If user has token, sync add with backend
            if (API.getToken()) {
                try {
                    await API.post(`/favourites/${entryId}/toggle`);
                } catch (err) {
                    console.warn("Backend toggle favourite error:", err);
                }
            }
        }
    },

    isEntryFavourited(entryId) {
        if (!entryId || !this.favourites || !Array.isArray(this.favourites)) return false;
        return this.favourites.some(f => {
            if (f.entry && String(f.entry.id) === String(entryId)) return true;
            if (String(f.id) === String(entryId)) return true;
            return false;
        });
    },

    updateAllHeartIcons() {
        // 1. Update all card and list buttons with [data-favourite-entry-id]
        document.querySelectorAll("[data-favourite-entry-id]").forEach(btn => {
            const id = btn.getAttribute("data-favourite-entry-id");
            if (!id) return;
            const isFav = this.isEntryFavourited(id);

            // Special handling for the Detail Modal button
            if (btn.id === "detailFavToggleBtn") {
                if (isFav) {
                    btn.className = "btn btn-danger btn-sm";
                    btn.innerHTML = '<i class="bi bi-heart-fill me-1"></i>Saved in Library';
                    btn.title = "Remove from Saved Library";
                } else {
                    btn.className = "btn btn-outline-danger btn-sm";
                    btn.innerHTML = '<i class="bi bi-heart me-1"></i>Save to Library';
                    btn.title = "Save to My Library";
                }
                return;
            }

            // Normal card heart buttons
            const icon = btn.querySelector("i");
            if (icon) {
                if (isFav) {
                    icon.className = "bi bi-heart-fill text-danger";
                    btn.classList.add("is-favourited");
                    btn.title = "Remove from Saved Library";
                } else {
                    icon.className = "bi bi-heart";
                    btn.classList.remove("is-favourited");
                    btn.title = "Save to My Library";
                }
            }
        });

        // 2. Also check if detail modal button exists without data attribute or needs sync
        const modalFavBtn = document.getElementById("detailFavToggleBtn");
        if (modalFavBtn && window.App && window.App.currentDetailEntryId) {
            const isFav = this.isEntryFavourited(window.App.currentDetailEntryId);
            modalFavBtn.setAttribute("data-favourite-entry-id", window.App.currentDetailEntryId);
            if (isFav) {
                modalFavBtn.className = "btn btn-danger btn-sm";
                modalFavBtn.innerHTML = '<i class="bi bi-heart-fill me-1"></i>Saved in Library';
                modalFavBtn.title = "Remove from Saved Library";
            } else {
                modalFavBtn.className = "btn btn-outline-danger btn-sm";
                modalFavBtn.innerHTML = '<i class="bi bi-heart me-1"></i>Save to Library';
                modalFavBtn.title = "Save to My Library";
            }
        }

        // 3. Update counter badges
        const count = this.favourites.length;
        const countBadge = document.getElementById("savedCountNum");
        if (countBadge) countBadge.textContent = count;

        const profileStatSavedCount = document.getElementById("profileStatSavedCount");
        if (profileStatSavedCount) profileStatSavedCount.textContent = count;
    },

    async handleCreateCollection(e) {
        e.preventDefault();
        const nameInput = document.getElementById("collectionNameInput");
        const descInput = document.getElementById("collectionDescInput");
        const isPrivateInput = document.getElementById("collectionPrivateCheck");

        const name = nameInput.value.trim();
        const description = descInput ? descInput.value.trim() : "";
        const isPrivate = isPrivateInput ? isPrivateInput.checked : true;

        if (!name) {
            API.showToast("Collection name is required.", "warning");
            return;
        }

        try {
            const res = await API.post("/collections", { name, description, isPrivate });
            if (res.success) {
                API.showToast(`Collection "${name}" created successfully!`, "success");
                nameInput.value = "";
                if (descInput) descInput.value = "";
                await this.loadCollections();

                const modal = bootstrap.Modal.getInstance(document.getElementById("createCollectionModal"));
                if (modal) modal.hide();
            }
        } catch (error) {
            API.showToast(error.message, "error");
        }
    },

    async addEntryToCollection(collectionId, entryId) {
        try {
            const res = await API.post(`/collections/${collectionId}/items/${entryId}`);
            API.showToast("Item added to collection!", "success");
            await this.loadCollections();
        } catch (error) {
            API.showToast(error.message, "error");
        }
    },

    async removeItemFromCollection(collectionId, entryId) {
        try {
            const res = await API.delete(`/collections/${collectionId}/items/${entryId}`);
            API.showToast("Item removed from collection.", "info");
            await this.loadCollections();
        } catch (error) {
            API.showToast(error.message, "error");
        }
    },

    async deleteCollection(collectionId) {
        if (!confirm("Are you sure you want to delete this collection?")) return;

        try {
            const res = await API.delete(`/collections/${collectionId}`);
            API.showToast("Collection deleted.", "info");
            await this.loadCollections();
        } catch (error) {
            API.showToast(error.message, "error");
        }
    },

    renderFavouritesList() {
        const container = document.getElementById("savedItemsContainer") || document.getElementById("userFavouritesContainer");
        const countBadge = document.getElementById("savedCountNum");
        if (countBadge) countBadge.textContent = this.favourites.length;

        if (!container) return;

        if (this.favourites.length === 0) {
            container.innerHTML = `
                <div class="col-12 text-center py-5">
                    <div class="p-4 bg-light rounded-4 max-w-500 mx-auto border shadow-sm">
                        <i class="bi bi-heart text-danger fs-1 mb-3 d-block opacity-75"></i>
                        <h5 class="fw-bold">Your Saved Heritage Library is Empty</h5>
                        <p class="text-muted small mb-3">Explore ancient temples, folk dances, classical music, and secret hidden sanctuaries. Tap the heart icon on any card to save it here for quick access!</p>
                        <button class="btn btn-primary btn-sm px-3 rounded-pill" onclick="App.switchDashboardTab('gems')">
                            <i class="bi bi-compass me-1"></i> Explore Hidden Gems
                        </button>
                    </div>
                </div>
            `;
            return;
        }

        const isTa = window.I18n && window.I18n.getLanguage() === "ta";

        container.innerHTML = this.favourites.map(fav => {
            const p = fav.entry || fav;
            if (!p || !p.id) return '';
            const catName = p.category ? (isTa && p.category.nameTa ? p.category.nameTa : (p.category.nameEn || p.category)) : 'Heritage';
            const distName = p.district ? (isTa && p.district.nameTa ? p.district.nameTa : (p.district.nameEn || p.district)) : 'Tamil Nadu';
            const title = isTa && p.titleTa ? p.titleTa : (p.title || 'Heritage Site');

            return `
                <div class="col-6 col-sm-6 col-lg-4">
                    <div class="dash-card h-100" onclick="App.openDetailModal(${p.id})">
                        <div class="position-relative">
                            <img src="${p.coverImageUrl || '/images/placeholders/place.svg'}" class="dash-card-cover" alt="${title}" loading="lazy" onerror="this.onerror=null;this.src='/images/placeholders/place.svg';">
                            <button class="btn btn-sm btn-light text-danger position-absolute top-0 end-0 m-2 rounded-circle shadow-sm btn-favourite-toggle is-favourited"
                                    data-favourite-entry-id="${p.id}"
                                    title="Remove from Saved Library"
                                    onclick="event.stopPropagation(); Collections.toggleFavourite(${p.id});">
                                <i class="bi bi-heart-fill text-danger"></i>
                            </button>
                            <span class="badge bg-dark bg-opacity-75 text-white position-absolute bottom-0 start-0 m-2 small">
                                <i class="bi bi-geo-alt-fill text-warning me-1"></i>${distName}
                            </span>
                        </div>
                        <div class="dash-card-body d-flex flex-column justify-content-between">
                            <div>
                                <div class="d-flex justify-content-between align-items-center mb-1">
                                    <span class="badge bg-primary bg-opacity-10 text-primary small">${catName}</span>
                                    <span class="small text-warning"><i class="bi bi-star-fill me-1"></i>${p.averageRating && p.averageRating > 0 ? p.averageRating.toFixed(1) : '4.8'}</span>
                                </div>
                                <h6 class="fw-bold mb-1 text-truncate">${title}</h6>
                                <p class="text-muted small mb-3 text-truncate-2">${p.shortDescription || ''}</p>
                            </div>
                            <div class="d-flex justify-content-between align-items-center pt-2 border-top">
                                <span class="badge bg-success bg-opacity-10 text-success small"><i class="bi bi-bookmark-check-fill me-1"></i>Saved</span>
                                <span class="text-primary small fw-semibold">View Details <i class="bi bi-arrow-right"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }).join('');
    },

    renderCollectionsList() {
        const container = document.getElementById("userCollectionsContainer");
        if (!container) return;

        if (this.collections.length === 0) {
            container.innerHTML = `
                <div class="col-12 text-center py-5 text-muted">
                    <i class="bi bi-folder-plus fs-1 mb-2 d-block"></i>
                    <p>No custom collections yet. Create collections like "Places I Want to Visit" or "Tamil Folk Arts"!</p>
                </div>
            `;
            return;
        }

        container.innerHTML = this.collections.map(col => `
            <div class="col-md-6 mb-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div>
                            <h5 class="fw-bold mb-1">${col.name}</h5>
                            <p class="text-muted small mb-0">${col.description || 'Personal Heritage Collection'}</p>
                        </div>
                        <div class="d-flex align-items-center gap-2">
                            <span class="badge bg-light text-dark border">
                                <i class="bi ${col.private ? 'bi-lock-fill' : 'bi-globe'} me-1"></i>${col.private ? 'Private' : 'Public'}
                            </span>
                            <button class="btn btn-sm btn-outline-danger" onclick="Collections.deleteCollection(${col.id})">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>
                    </div>
                    <div class="mt-3">
                        <h6 class="small fw-bold text-muted text-uppercase mb-2">Saved Items (${col.items ? col.items.length : 0})</h6>
                        ${col.items && col.items.length > 0 ? `
                            <div class="list-group list-group-flush">
                                ${col.items.map(item => `
                                    <div class="list-group-item d-flex justify-content-between align-items-center px-0 py-2">
                                        <div class="d-flex align-items-center gap-2 cursor-pointer" onclick="window.App.openDetailModal(${item.entry.id})">
                                            <img src="${item.entry.coverImageUrl || '/images/placeholders/place.svg'}" class="rounded" style="width: 36px; height: 36px; object-fit: cover;" onerror="this.onerror=null;this.src='/images/placeholders/place.svg';">
                                            <span class="small fw-semibold text-truncate" style="max-width: 220px;">${item.entry.title}</span>
                                        </div>
                                        <button class="btn btn-sm text-danger" onclick="Collections.removeItemFromCollection(${col.id}, ${item.entry.id})">
                                            <i class="bi bi-x-circle"></i>
                                        </button>
                                    </div>
                                `).join('')}
                            </div>
                        ` : `
                            <p class="small text-muted mb-0">No items added to this collection yet.</p>
                        `}
                    </div>
                </div>
            </div>
        `).join('');
    },

    updateCollectionDropdowns() {
        const dropdownList = document.getElementById("saveToCollectionDropdownMenu");
        if (!dropdownList) return;

        if (this.collections.length === 0) {
            dropdownList.innerHTML = `<li><span class="dropdown-item-text text-muted small">No collections created</span></li>`;
            return;
        }

        dropdownList.innerHTML = this.collections.map(col => `
            <li>
                <button class="dropdown-item small" onclick="Collections.addEntryToCollection(${col.id}, window.App.currentDetailEntryId)">
                    <i class="bi bi-folder me-2"></i>${col.name}
                </button>
            </li>
        `).join('');
    }
};

window.Collections = Collections;
