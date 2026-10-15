/**
 * Tamil Nadu Cultural Heritage Discovery Platform
 * REST API Client & Notification Engine
 */

const API = {
    BASE_URL: "/api",

    getToken() {
        return localStorage.getItem("tn_culture_token");
    },

    setToken(token) {
        if (token) {
            localStorage.setItem("tn_culture_token", token);
        } else {
            localStorage.removeItem("tn_culture_token");
        }
    },

    getUser() {
        try {
            const userStr = localStorage.getItem("tn_culture_user");
            return userStr ? JSON.parse(userStr) : null;
        } catch (e) {
            return null;
        }
    },

    setUser(user) {
        if (user) {
            localStorage.setItem("tn_culture_user", JSON.stringify(user));
        } else {
            localStorage.removeItem("tn_culture_user");
        }
    },

    clearAuth() {
        this.setToken(null);
        this.setUser(null);
    },

    async request(endpoint, options = {}) {
        const url = `${this.BASE_URL}${endpoint}`;
        const headers = {
            "Content-Type": "application/json",
            ...(options.headers || {})
        };

        const token = this.getToken();
        if (token) {
            headers["Authorization"] = `Bearer ${token}`;
        }

        try {
            const response = await fetch(url, {
                ...options,
                headers
            });

            const data = await response.json();

            if (!response.ok) {
                const message = data.message || `Request failed with status ${response.status}`;
                throw new Error(message);
            }

            return data;
        } catch (error) {
            console.error(`API Error on [${options.method || 'GET'} ${endpoint}]:`, error);
            throw error;
        }
    },

    get(endpoint, params = {}) {
        const query = new URLSearchParams();
        Object.entries(params).forEach(([key, val]) => {
            if (val !== null && val !== undefined && val !== "") {
                query.append(key, val);
            }
        });
        const qs = query.toString();
        const url = qs ? `${endpoint}?${qs}` : endpoint;
        return this.request(url, { method: "GET" });
    },

    post(endpoint, body) {
        return this.request(endpoint, {
            method: "POST",
            body: JSON.stringify(body)
        });
    },

    put(endpoint, body) {
        return this.request(endpoint, {
            method: "PUT",
            body: JSON.stringify(body)
        });
    },

    delete(endpoint) {
        return this.request(endpoint, { method: "DELETE" });
    },

    // UI Toast Notification helper
    showToast(message, type = "info") {
        const container = document.getElementById("toastContainer");
        if (!container) return;

        const toastId = "toast_" + Date.now();
        const bgClass = type === "success" ? "bg-success text-white" :
                        type === "error" ? "bg-danger text-white" :
                        type === "warning" ? "bg-warning text-dark" : "bg-dark text-white";

        const iconClass = type === "success" ? "bi-check-circle-fill" :
                          type === "error" ? "bi-exclamation-triangle-fill" :
                          type === "warning" ? "bi-exclamation-circle-fill" : "bi-info-circle-fill";

        const toastHtml = `
            <div id="${toastId}" class="toast align-items-center ${bgClass} border-0 shadow-lg mb-2" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body d-flex align-items-center gap-2">
                        <i class="bi ${iconClass} fs-5"></i>
                        <span>${message}</span>
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        `;

        container.insertAdjacentHTML("beforeend", toastHtml);
        const toastEl = document.getElementById(toastId);
        const toast = new bootstrap.Toast(toastEl, { delay: 4000 });
        toast.show();

        toastEl.addEventListener("hidden.bs.toast", () => {
            toastEl.remove();
        });
    }
};

window.API = API;
