/**
 * Tamil Nadu Cultural Heritage Discovery Platform
 * Administrative Portal & Moderation Workflow Engine
 */

const Admin = {
    async init() {
        if (!API.getToken()) return;
        const user = API.getUser();
        if (!user || user.role !== "ROLE_ADMIN") return;

        this.bindEvents();
        await this.loadDashboardStats();
        await this.loadSubmissions("PENDING");
        await this.loadReports();
        await this.loadUsers();
        await this.loadFeedback();
    },

    bindEvents() {
        const subFilter = document.getElementById("adminSubmissionFilter");
        if (subFilter) {
            subFilter.addEventListener("change", (e) => this.loadSubmissions(e.target.value));
        }
    },

    async loadDashboardStats() {
        try {
            const res = await API.get("/admin/dashboard");
            if (res.success && res.data) {
                const d = res.data;
                document.getElementById("statTotalPublished").textContent = d.totalPublished || 0;
                document.getElementById("statPendingSubmissions").textContent = d.totalPendingSubmissions || 0;
                document.getElementById("statTotalUsers").textContent = d.totalUsers || 0;
                document.getElementById("statTotalReports").textContent = d.totalReports || 0;
            }
        } catch (e) {
            console.error("Error loading dashboard stats:", e);
        }
    },

    async loadSubmissions(status = "PENDING") {
        const container = document.getElementById("adminSubmissionsTableBody");
        if (!container) return;

        container.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-muted"><span class="spinner-border spinner-border-sm me-2"></span>Loading submissions...</td></tr>`;

        try {
            const res = await API.get(`/admin/submissions?status=${status}`);
            if (res.success && res.data) {
                const list = res.data;
                if (list.length === 0) {
                    container.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-muted">No submissions found with status: ${status}</td></tr>`;
                    return;
                }

                container.innerHTML = list.map(item => `
                    <tr>
                        <td>
                            <div class="fw-bold">${item.title}</div>
                            <div class="small text-muted">${item.titleTa || ''}</div>
                        </td>
                        <td>${item.category ? item.category.nameEn : 'General'}</td>
                        <td>${item.district ? item.district.nameEn : 'Tamil Nadu'}</td>
                        <td>${item.contributor ? item.contributor.fullName : 'Anonymous'}</td>
                        <td>
                            <span class="badge ${item.status === 'APPROVED' ? 'bg-success' : item.status === 'PENDING' ? 'bg-warning text-dark' : 'bg-danger'}">
                                ${item.status}
                            </span>
                        </td>
                        <td class="text-end">
                            <button class="btn btn-sm btn-outline-primary me-1" onclick="Admin.inspectSubmission(${item.id})">
                                Inspect
                            </button>
                            <button class="btn btn-sm btn-success me-1" onclick="Admin.quickModerate(${item.id}, 'APPROVED')">
                                Approve
                            </button>
                            <button class="btn btn-sm btn-danger" onclick="Admin.quickModerate(${item.id}, 'REJECTED')">
                                Reject
                            </button>
                        </td>
                    </tr>
                `).join('');
            }
        } catch (e) {
            container.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-danger">Failed to load submissions: ${e.message}</td></tr>`;
        }
    },

    async quickModerate(id, status) {
        const notes = prompt(`Enter moderation notes for setting status to ${status} (optional):`, `Reviewed by Administrator`);
        if (notes === null) return;

        try {
            const res = await API.put(`/admin/submissions/${id}/moderate`, { status, notes });
            API.showToast(res.message, "success");
            await this.loadDashboardStats();
            const filter = document.getElementById("adminSubmissionFilter")?.value || "PENDING";
            await this.loadSubmissions(filter);
            if (window.App) window.App.refreshData();
        } catch (e) {
            API.showToast(e.message, "error");
        }
    },

    async inspectSubmission(id) {
        window.App.openDetailModal(id);
    },

    async loadReports() {
        const container = document.getElementById("adminReportsTableBody");
        if (!container) return;

        try {
            const res = await API.get("/admin/reports");
            if (res.success && res.data) {
                const list = res.data;
                if (list.length === 0) {
                    container.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-muted">No correction reports registered.</td></tr>`;
                    return;
                }

                container.innerHTML = list.map(r => `
                    <tr>
                        <td>${r.entry ? r.entry.title : 'Entry #' + r.id}</td>
                        <td><span class="badge bg-secondary">${r.reportType}</span></td>
                        <td class="small" style="max-width: 250px;">${r.details}</td>
                        <td>${r.user ? r.user.email : 'Public User'}</td>
                        <td><span class="badge ${r.status === 'RESOLVED' ? 'bg-success' : 'bg-warning text-dark'}">${r.status}</span></td>
                        <td class="text-end">
                            <button class="btn btn-sm btn-outline-success" onclick="Admin.resolveReport(${r.id})">
                                Resolve
                            </button>
                        </td>
                    </tr>
                `).join('');
            }
        } catch (e) {
            console.error("Error loading reports:", e);
        }
    },

    async resolveReport(id) {
        const notes = prompt("Enter investigation resolution notes:", "Fact-checked against archival records and corrected.");
        if (notes === null) return;

        try {
            const res = await API.put(`/admin/reports/${id}/resolve?status=RESOLVED&adminNotes=${encodeURIComponent(notes)}`);
            API.showToast("Report marked as resolved.", "success");
            await this.loadReports();
            await this.loadDashboardStats();
        } catch (e) {
            API.showToast(e.message, "error");
        }
    },

    async loadUsers() {
        const container = document.getElementById("adminUsersTableBody");
        if (!container) return;

        try {
            const res = await API.get("/admin/users");
            if (res.success && res.data) {
                container.innerHTML = res.data.map(u => `
                    <tr>
                        <td class="fw-bold">${u.fullName}</td>
                        <td>${u.email}</td>
                        <td>${u.country}</td>
                        <td><span class="badge ${u.role === 'ROLE_ADMIN' ? 'bg-danger' : 'bg-primary'}">${u.role}</span></td>
                        <td><span class="badge ${u.enabled ? 'bg-success' : 'bg-secondary'}">${u.enabled ? 'Active' : 'Unverified'}</span></td>
                        <td class="text-end">
                            ${u.role !== 'ROLE_ADMIN' ? `
                                <button class="btn btn-sm ${u.enabled ? 'btn-outline-danger' : 'btn-outline-success'}" onclick="Admin.toggleUser(${u.id}, ${!u.enabled})">
                                    ${u.enabled ? 'Disable' : 'Enable'}
                                </button>
                            ` : '<span class="badge bg-light text-muted">Admin Account</span>'}
                        </td>
                    </tr>
                `).join('');
            }
        } catch (e) {
            console.error("Error loading users:", e);
        }
    },

    async toggleUser(id, enabled) {
        try {
            const res = await API.put(`/admin/users/${id}/toggle-status?enabled=${enabled}`);
            API.showToast(res.message, "info");
            await this.loadUsers();
        } catch (e) {
            API.showToast(e.message, "error");
        }
    },

    async loadFeedback() {
        const container = document.getElementById("adminFeedbackTableBody");
        if (!container) return;

        try {
            const res = await API.get("/admin/feedback");
            if (res.success && res.data) {
                container.innerHTML = res.data.map(f => `
                    <tr>
                        <td><span class="badge bg-info text-dark">${f.category}</span></td>
                        <td>${'★'.repeat(f.rating)}${'☆'.repeat(5 - f.rating)}</td>
                        <td class="small">${f.comments}</td>
                        <td>${f.user ? f.user.fullName : 'Guest'}</td>
                        <td class="small text-muted">${new Date(f.createdAt).toLocaleDateString()}</td>
                    </tr>
                `).join('');
            }
        } catch (e) {
            console.error("Error loading feedback:", e);
        }
    }
};

window.Admin = Admin;
