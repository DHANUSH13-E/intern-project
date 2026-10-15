/**
 * Tamil Nadu Cultural Heritage Discovery Platform
 * Interactive Map & Accessible District Discovery Engine with Geolocation & Nearby Places
 */

const MapDiscovery = {
    mapInstance: null,
    markers: [],
    userMarker: null,
    radiusCircle: null,
    places: [],
    userLocation: null, // { lat, lng, label }
    viewMode: "map", // "map" or "list"

    async init() {
        this.bindEvents();
        await this.loadMappedPlaces();
        this.populateDropdownFilters();
    },

    bindEvents() {
        const toggleBtn = document.getElementById("toggleMapViewBtn");
        if (toggleBtn) {
            toggleBtn.addEventListener("click", () => this.toggleView());
        }

        const districtSelect = document.getElementById("mapDistrictFilter");
        if (districtSelect) {
            districtSelect.addEventListener("change", () => this.filterPlaces());
        }

        const categorySelect = document.getElementById("mapCategoryFilter");
        if (categorySelect) {
            categorySelect.addEventListener("change", () => this.filterPlaces());
        }
    },

    async populateDropdownFilters() {
        const districtSelect = document.getElementById("mapDistrictFilter");
        const categorySelect = document.getElementById("mapCategoryFilter");

        if (districtSelect && districtSelect.options.length <= 1) {
            try {
                const res = await API.get("/districts");
                if (res.success && res.data) {
                    res.data.forEach(d => {
                        const opt = document.createElement("option");
                        opt.value = d.id;
                        opt.textContent = `${d.nameEn} (${d.region})`;
                        districtSelect.appendChild(opt);
                    });
                }
            } catch (e) {}
        }

        if (categorySelect && categorySelect.options.length <= 1) {
            try {
                const res = await API.get("/categories");
                if (res.success && res.data) {
                    res.data.forEach(c => {
                        const opt = document.createElement("option");
                        opt.value = c.id;
                        opt.textContent = c.nameEn;
                        categorySelect.appendChild(opt);
                    });
                }
            } catch (e) {}
        }
    },

    async loadMappedPlaces() {
        try {
            const res = await API.get("/cultural/map");
            if (res.success && res.data) {
                this.places = res.data;
                this.renderMap();
                this.renderAccessibleList(this.getFilteredPlaces());
            }
        } catch (error) {
            console.error("Failed to load mapped places:", error);
            this.showFallbackMessage();
        }
    },

    // ===================================================================
    // CURRENT LOCATION & NEARBY PLACES DISCOVERY
    // ===================================================================
    findNearbyPlaces() {
        const btn = document.getElementById("btnNearMe");
        if (btn) {
            btn.disabled = true;
            btn.innerHTML = `<span class="spinner-border spinner-border-sm me-2"></span>Locating GPS...`;
        }

        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(
                (pos) => {
                    this.setUserLocation(pos.coords.latitude, pos.coords.longitude, "Your Current Location");
                },
                (err) => {
                    console.warn("Browser GPS prompt error/denied:", err.message);
                    // Fallback to Avadi / Chennai coordinates (Default Citizen Home)
                    this.setUserLocation(13.1147, 80.1009, "Avadi / Chennai (Current Civic Location)");
                    API.showToast("GPS unavailable; detected current regional location: Avadi / Chennai.", "info");
                },
                { enableHighAccuracy: true, timeout: 8000, maximumAge: 60000 }
            );
        } else {
            this.setUserLocation(13.0827, 80.2707, "Chennai (Central Tamil Nadu)");
            API.showToast("Geolocation not supported by device. Displaying places around Chennai.", "info");
        }
    },

    setUserLocation(lat, lng, label) {
        this.userLocation = { lat, lng, label };

        // Calculate Haversine distance in km for every place
        this.places.forEach(p => {
            if (p.latitude && p.longitude) {
                p.distanceKm = this.calculateDistanceKm(lat, lng, p.latitude, p.longitude);
            } else {
                p.distanceKm = 99999;
            }
        });

        // Update UI buttons & status alert
        const btn = document.getElementById("btnNearMe");
        if (btn) {
            btn.disabled = false;
            btn.className = "btn btn-success btn-sm fw-bold d-flex align-items-center gap-2 shadow-sm";
            btn.innerHTML = `<i class="bi bi-geo-alt-fill"></i><span>Location Active</span>`;
        }

        const resetBtn = document.getElementById("btnResetLocation");
        if (resetBtn) {
            resetBtn.style.display = "inline-block";
        }

        const statusBox = document.getElementById("nearbyLocationStatus");
        const statusText = document.getElementById("nearbyLocationStatusText");
        const countBadge = document.getElementById("nearbyPlacesCountBadge");

        const filtered = this.getFilteredPlaces();
        if (statusBox) statusBox.classList.remove("d-none");
        if (statusText) statusText.innerHTML = `Showing nearby heritage places around <strong>${label}</strong> (Lat: ${lat.toFixed(3)}, Lng: ${lng.toFixed(3)})`;
        if (countBadge) countBadge.textContent = `${filtered.length} Sites Nearby`;

        // Render Map with User Marker and Nearby Sites
        this.renderMap();

        // Render Nearby Cards Showcase
        this.renderNearbyShowcase(filtered);

        // Render Table
        this.renderAccessibleList(filtered);

        API.showToast(`Found ${filtered.length} heritage sites near your location!`, "success");
    },

    resetLocationFilter() {
        this.userLocation = null;

        // Reset distance on places
        this.places.forEach(p => delete p.distanceKm);

        const btn = document.getElementById("btnNearMe");
        if (btn) {
            btn.disabled = false;
            btn.className = "btn btn-success btn-sm fw-bold d-flex align-items-center gap-2 shadow-sm";
            btn.innerHTML = `<i class="bi bi-geo-alt-fill"></i><span>Use My Current Location</span>`;
        }

        const resetBtn = document.getElementById("btnResetLocation");
        if (resetBtn) resetBtn.style.display = "none";

        const statusBox = document.getElementById("nearbyLocationStatus");
        if (statusBox) statusBox.classList.add("d-none");

        const showcase = document.getElementById("nearbyPlacesShowcase");
        if (showcase) showcase.classList.add("d-none");

        if (this.userMarker && this.mapInstance) {
            this.mapInstance.removeLayer(this.userMarker);
            this.userMarker = null;
        }
        if (this.radiusCircle && this.mapInstance) {
            this.mapInstance.removeLayer(this.radiusCircle);
            this.radiusCircle = null;
        }

        this.renderMap();
        this.renderAccessibleList(this.getFilteredPlaces());
        API.showToast("Location filter reset. Showing all 38 districts.", "info");
    },

    onRadiusChange() {
        if (this.userLocation) {
            const filtered = this.getFilteredPlaces();
            this.renderMap();
            this.renderNearbyShowcase(filtered);
            this.renderAccessibleList(filtered);
            const countBadge = document.getElementById("nearbyPlacesCountBadge");
            if (countBadge) countBadge.textContent = `${filtered.length} Sites Nearby`;
        }
    },

    calculateDistanceKm(lat1, lon1, lat2, lon2) {
        if (!lat1 || !lon1 || !lat2 || !lon2) return 99999;
        const R = 6371; // Earth's radius in km
        const dLat = (lat2 - lat1) * Math.PI / 180;
        const dLon = (lon2 - lon1) * Math.PI / 180;
        const a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c;
    },

    // ===================================================================
    // MAP RENDERING & MARKER PLACEMENT
    // ===================================================================
    renderMap() {
        const container = document.getElementById("heritageMapContainer");
        if (!container) return;

        if (typeof L !== "undefined") {
            try {
                if (!this.mapInstance) {
                    this.mapInstance = L.map("heritageMapContainer").setView([11.1271, 78.6569], 7);

                    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
                        maxZoom: 18
                    }).addTo(this.mapInstance);
                }

                this.clearMarkers();

                const filtered = this.getFilteredPlaces();
                const boundsGroup = [];

                // 1. If User Location is set, draw user marker and radius circle
                if (this.userLocation) {
                    const uLat = this.userLocation.lat;
                    const uLng = this.userLocation.lng;

                    const userIcon = L.divIcon({
                        className: "user-location-pin",
                        html: `<div style="background:#0d6efd; width:22px; height:22px; border-radius:50%; border:3px solid #fff; box-shadow:0 0 12px rgba(13,110,253,0.9); display:flex; align-items:center; justify-content:center; color:#fff; font-size:10px;"><i class="bi bi-person-fill"></i></div>`,
                        iconSize: [22, 22],
                        iconAnchor: [11, 11]
                    });

                    if (this.userMarker) this.mapInstance.removeLayer(this.userMarker);
                    this.userMarker = L.marker([uLat, uLng], { icon: userIcon })
                        .addTo(this.mapInstance)
                        .bindPopup(`<strong>${this.userLocation.label}</strong><br><span class="badge bg-primary">You are here</span>`);

                    boundsGroup.push([uLat, uLng]);

                    // Add radius circle
                    const radiusVal = parseFloat(document.getElementById("mapRadiusFilter")?.value || "100");
                    if (radiusVal < 9000) {
                        if (this.radiusCircle) this.mapInstance.removeLayer(this.radiusCircle);
                        this.radiusCircle = L.circle([uLat, uLng], {
                            radius: radiusVal * 1000,
                            color: "#198754",
                            fillColor: "#198754",
                            fillOpacity: 0.08,
                            weight: 2
                        }).addTo(this.mapInstance);
                    }
                }

                // 2. Add heritage place markers
                filtered.forEach(place => {
                    if (place.latitude && place.longitude) {
                        const marker = L.marker([place.latitude, place.longitude]).addTo(this.mapInstance);

                        const distanceTag = (typeof place.distanceKm === "number" && place.distanceKm < 9000) ?
                            `<div class="mb-2"><span class="badge bg-success fw-bold"><i class="bi bi-cursor-fill me-1"></i>${place.distanceKm.toFixed(1)} km from you</span></div>` : '';

                        const directionsLink = this.userLocation ?
                            `<a href="https://www.google.com/maps/dir/?api=1&origin=${this.userLocation.lat},${this.userLocation.lng}&destination=${place.latitude},${place.longitude}" target="_blank" class="btn btn-sm btn-outline-success w-100 mb-1 fw-bold">
                                <i class="bi bi-sign-turn-right-fill me-1"></i>Get GPS Directions
                            </a>` : '';

                        const popupContent = `
                            <div class="map-popup-card" style="max-width:240px;">
                                <img src="${place.coverImageUrl || 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400'}" class="img-fluid rounded mb-2" style="max-height: 120px; width: 100%; object-fit: cover;" onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400';">
                                <h6 class="fw-bold mb-1">${place.title}</h6>
                                <p class="small text-muted mb-1">${place.district ? place.district.nameEn : ''} • ${place.category ? place.category.nameEn : ''}</p>
                                ${distanceTag}
                                <p class="small mb-2 text-truncate-2">${place.shortDescription || ''}</p>
                                ${directionsLink}
                                <button class="btn btn-sm btn-primary w-100" onclick="window.App.openDetailModal(${place.id})">
                                    <i class="bi bi-compass me-1"></i>Explore Heritage Guide
                                </button>
                            </div>
                        `;
                        marker.bindPopup(popupContent);
                        this.markers.push(marker);
                        boundsGroup.push([place.latitude, place.longitude]);
                    }
                });

                // Auto-fit bounds if we have points
                if (boundsGroup.length > 0) {
                    if (this.userLocation) {
                        this.mapInstance.setView([this.userLocation.lat, this.userLocation.lng], 9);
                    } else {
                        this.mapInstance.setView([11.1271, 78.6569], 7);
                    }
                }

                setTimeout(() => this.mapInstance.invalidateSize(), 200);
                return;
            } catch (e) {
                console.warn("Leaflet map initialization warning:", e);
            }
        }

        this.renderSvgDistrictMap(container);
    },

    clearMarkers() {
        if (this.markers && this.markers.length) {
            this.markers.forEach(m => {
                if (this.mapInstance) this.mapInstance.removeLayer(m);
            });
            this.markers = [];
        }
    },

    getFilteredPlaces() {
        const districtVal = document.getElementById("mapDistrictFilter")?.value;
        const categoryVal = document.getElementById("mapCategoryFilter")?.value;
        const radiusVal = parseFloat(document.getElementById("mapRadiusFilter")?.value || "100");

        let list = this.places.filter(place => {
            const matchesDistrict = !districtVal || (place.district && place.district.id == districtVal);
            const matchesCategory = !categoryVal || (place.category && place.category.id == categoryVal);

            // If user location is active, filter by distance radius
            let matchesRadius = true;
            if (this.userLocation && typeof place.distanceKm === "number") {
                matchesRadius = (place.distanceKm <= radiusVal);
            }

            return matchesDistrict && matchesCategory && matchesRadius;
        });

        // If user location is active, sort by distance ascending
        if (this.userLocation) {
            list.sort((a, b) => (a.distanceKm || 99999) - (b.distanceKm || 99999));
        }

        return list;
    },

    filterPlaces() {
        this.renderMap();
        const filtered = this.getFilteredPlaces();
        if (this.userLocation) {
            this.renderNearbyShowcase(filtered);
        }
        this.renderAccessibleList(filtered);
    },

    // ===================================================================
    // NEARBY PLACES SUGGESTIONS CARDS SHOWCASE
    // ===================================================================
    renderNearbyShowcase(places) {
        const showcase = document.getElementById("nearbyPlacesShowcase");
        const container = document.getElementById("nearbyCardsContainer");
        if (!showcase || !container) return;

        if (!this.userLocation || places.length === 0) {
            showcase.classList.add("d-none");
            return;
        }

        showcase.classList.remove("d-none");

        container.innerHTML = places.slice(0, 6).map(p => `
            <div class="col-12 col-md-6 col-lg-4">
                <div class="card h-100 border shadow-sm rounded-3 overflow-hidden">
                    <div class="position-relative">
                        <img src="${p.coverImageUrl || 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600'}" class="card-img-top" style="height: 160px; object-fit: cover;" onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600';">
                        <span class="badge bg-success position-absolute top-0 start-0 m-2 fw-bold shadow-sm">
                            <i class="bi bi-cursor-fill me-1"></i>${(p.distanceKm || 0).toFixed(1)} km away
                        </span>
                        <span class="badge bg-dark bg-opacity-75 position-absolute top-0 end-0 m-2">
                            ${p.district ? p.district.nameEn : 'Tamil Nadu'}
                        </span>
                    </div>
                    <div class="card-body p-3 d-flex flex-column">
                        <div class="d-flex justify-content-between align-items-start mb-1">
                            <h6 class="fw-bold mb-0 text-truncate-2">${p.title}</h6>
                        </div>
                        <p class="text-muted small mb-2 text-truncate">${p.titleTa || ''}</p>
                        <p class="small text-muted text-truncate-2 mb-3 flex-grow-1">${p.shortDescription || ''}</p>
                        <div class="d-flex gap-2 mt-auto">
                            <a href="https://www.google.com/maps/dir/?api=1&origin=${this.userLocation.lat},${this.userLocation.lng}&destination=${p.latitude},${p.longitude}" target="_blank" class="btn btn-outline-success btn-sm flex-fill fw-bold">
                                <i class="bi bi-sign-turn-right-fill me-1"></i>Directions
                            </a>
                            <button class="btn btn-primary btn-sm flex-fill fw-bold" onclick="window.App.openDetailModal(${p.id})">
                                Explore Guide
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        `).join('');
    },

    // ===================================================================
    // ACCESSIBLE TABLE DIRECTORY VIEW
    // ===================================================================
    renderAccessibleList(places) {
        const tableBody = document.getElementById("mapTableBody");
        if (!tableBody) return;

        if (places.length === 0) {
            tableBody.innerHTML = `
                <tr>
                    <td colspan="6" class="text-center py-4 text-muted">
                        <i class="bi bi-search fs-2 mb-2 d-block"></i>
                        No heritage places found within this search criteria or radius.
                    </td>
                </tr>
            `;
            return;
        }

        tableBody.innerHTML = places.map(p => {
            const distBadge = (typeof p.distanceKm === "number" && p.distanceKm < 9000)
                ? `<span class="badge bg-success"><i class="bi bi-cursor-fill me-1"></i>${p.distanceKm.toFixed(1)} km</span>`
                : `<span class="text-muted small">—</span>`;

            const directionBtn = (this.userLocation && p.latitude && p.longitude)
                ? `<a href="https://www.google.com/maps/dir/?api=1&origin=${this.userLocation.lat},${this.userLocation.lng}&destination=${p.latitude},${p.longitude}" target="_blank" class="btn btn-sm btn-outline-success me-1" title="Get Directions">
                     <i class="bi bi-sign-turn-right-fill"></i>
                   </a>`
                : '';

            return `
                <tr>
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <img src="${p.coverImageUrl || 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=100'}" class="rounded" style="width: 44px; height: 44px; object-fit: cover;" onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=100';">
                            <div>
                                <div class="fw-bold text-truncate" style="max-width: 200px;">${p.title}</div>
                                <div class="text-muted small">${p.titleTa || ''}</div>
                            </div>
                        </div>
                    </td>
                    <td><span class="badge bg-light text-dark border">${p.district ? p.district.nameEn : 'TN'}</span></td>
                    <td><span class="badge bg-secondary">${p.category ? p.category.nameEn : 'Heritage'}</span></td>
                    <td class="small font-monospace">${p.latitude ? p.latitude.toFixed(4) + ', ' + p.longitude.toFixed(4) : 'N/A'}</td>
                    <td>${distBadge}</td>
                    <td class="text-end">
                        ${directionBtn}
                        <button class="btn btn-sm btn-outline-primary" onclick="window.App.openDetailModal(${p.id})">
                            Guide
                        </button>
                    </td>
                </tr>
            `;
        }).join('');
    },

    toggleView() {
        const mapContainer = document.getElementById("heritageMapContainer");
        const listContainer = document.getElementById("mapTableView");
        const toggleBtn = document.getElementById("toggleMapViewBtn");

        if (this.viewMode === "map") {
            this.viewMode = "list";
            if (mapContainer) mapContainer.classList.add("d-none");
            if (listContainer) listContainer.classList.remove("d-none");
            if (toggleBtn) toggleBtn.innerHTML = `<i class="bi bi-map-fill me-1"></i>Switch to Map View`;
        } else {
            this.viewMode = "map";
            if (listContainer) listContainer.classList.add("d-none");
            if (mapContainer) mapContainer.classList.remove("d-none");
            if (toggleBtn) toggleBtn.innerHTML = `<i class="bi bi-table me-1"></i>Toggle Accessible Table`;
            if (this.mapInstance) this.mapInstance.invalidateSize();
        }
    },

    showFallbackMessage() {
        const container = document.getElementById("heritageMapContainer");
        if (container) {
            container.innerHTML = `
                <div class="p-5 text-center bg-light rounded">
                    <i class="bi bi-map text-muted fs-1 mb-2 d-block"></i>
                    <p class="text-muted">Interactive map data is loading. Please check your internet connection or use Accessible Table view.</p>
                </div>
            `;
        }
    },

    initMap() {
        if (!this.mapInstance) {
            this.init();
        } else {
            setTimeout(() => {
                this.mapInstance.invalidateSize();
                this.populateDropdownFilters();
            }, 150);
        }
    },

    toggleMapView() {
        this.toggleView();
    }
};

window.MapDiscovery = MapDiscovery;
window.MapModule = MapDiscovery;
