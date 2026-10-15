/**
 * Tamil Nadu Cultural Heritage Discovery Platform
 * AI Cultural Assistant & District Travel Guide
 */

const Chatbot = {
    isOpen: false,

    init() {
        this.bindEvents();
    },

    bindEvents() {
        const input = document.getElementById("chatbotInput");
        if (input) {
            input.addEventListener("keydown", (e) => {
                if (e.key === "Enter" && !e.shiftKey) {
                    e.preventDefault();
                    this.sendMessage();
                }
            });
        }
    },

    getDrawer() {
        return document.getElementById("chatbotDrawer") || document.getElementById("chatbotPanel");
    },

    getMessagesContainer() {
        return document.getElementById("chatbotMessages") || document.getElementById("chatbotMessagesContainer");
    },

    toggleWindow() {
        const drawer = this.getDrawer();
        if (!drawer) return;
        this.isOpen = !this.isOpen;
        if (this.isOpen) {
            drawer.classList.add("active");
            setTimeout(() => {
                document.getElementById("chatbotInput")?.focus();
            }, 100);
        } else {
            drawer.classList.remove("active");
        }
    },

    openWindow() {
        const drawer = this.getDrawer();
        if (drawer) {
            drawer.classList.add("active");
            this.isOpen = true;
            setTimeout(() => {
                document.getElementById("chatbotInput")?.focus();
            }, 100);
        }
    },

    closeWindow() {
        const drawer = this.getDrawer();
        if (drawer) {
            drawer.classList.remove("active");
            this.isOpen = false;
        }
    },

    askPreset(question) {
        this.openWindow();
        const input = document.getElementById("chatbotInput");
        if (input) {
            input.value = question;
            this.sendMessage();
        }
    },

    async sendMessage() {
        const input = document.getElementById("chatbotInput");
        if (!input) return;

        const message = input.value.trim();
        if (!message) return;

        input.value = "";
        this.appendMessage("user", message);

        const typingId = "typing_" + Date.now();
        this.appendTypingIndicator(typingId);

        try {
            const lang = window.I18n ? window.I18n.getLanguage() : "en";
            const res = await API.post("/chatbot/message", {
                message: message,
                languageCode: lang
            });

            this.removeTypingIndicator(typingId);

            if (res && res.success && res.data) {
                this.appendMessage("assistant", res.data.reply, res.data.suggestions);
            } else {
                this.appendMessage("assistant", "I apologize, but I could not process your query at this moment. Please try again.");
            }
        } catch (error) {
            this.removeTypingIndicator(typingId);
            this.appendMessage("assistant", "Unable to connect to the cultural knowledge service. Please check your connection and try again.");
        }
    },

    appendMessage(sender, text, suggestions = []) {
        const msgContainer = this.getMessagesContainer();
        if (!msgContainer) return;

        const isUser = sender === "user";
        const msgDiv = document.createElement("div");
        msgDiv.className = `d-flex mb-3 ${isUser ? 'justify-content-end' : 'justify-content-start'}`;

        let suggestionsHtml = "";
        if (suggestions && suggestions.length > 0) {
            suggestionsHtml = `
                <div class="mt-2 pt-2 border-top">
                    <span class="small fw-bold text-muted d-block mb-2" style="font-size: 0.72rem;">Related Heritage Records:</span>
                    <div class="d-flex flex-column gap-2">
                        ${suggestions.map(s => `
                            <div class="card p-2 bg-body border rounded-2 cursor-pointer shadow-sm hover-shadow" onclick="window.App && window.App.openDetailModal(${s.id})" style="cursor: pointer;">
                                <div class="d-flex align-items-center gap-2">
                                    <img src="${s.coverImageUrl || '/images/placeholders/place.svg'}" class="rounded" style="width: 44px; height: 44px; object-fit: cover;" onerror="this.onerror=null;this.src='/images/placeholders/place.svg';">
                                    <div class="overflow-hidden flex-grow-1">
                                        <div class="small fw-bold text-truncate text-dark">${s.title}</div>
                                        <div class="d-flex align-items-center gap-1 small text-muted" style="font-size: 0.7rem;">
                                            <span class="badge bg-light text-dark border py-0 px-1">${s.districtName || 'Tamil Nadu'}</span>
                                            <span class="text-truncate">${s.categoryName || 'Heritage'}</span>
                                        </div>
                                    </div>
                                    <i class="bi bi-chevron-right text-muted small"></i>
                                </div>
                            </div>
                        `).join('')}
                    </div>
                </div>
            `;
        }

        // Format message with line breaks and bold markers
        const formattedText = text
            .replace(/\n/g, '<br>')
            .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');

        msgDiv.innerHTML = `
            <div class="chat-bubble ${isUser ? 'chat-bubble-user' : 'chat-bubble-assistant'} shadow-sm">
                <div class="bubble-text">${formattedText}</div>
                ${suggestionsHtml}
            </div>
        `;

        msgContainer.appendChild(msgDiv);
        msgContainer.scrollTop = msgContainer.scrollHeight;
    },

    appendTypingIndicator(id) {
        const msgContainer = this.getMessagesContainer();
        if (!msgContainer) return;

        const typingDiv = document.createElement("div");
        typingDiv.id = id;
        typingDiv.className = "d-flex mb-3 justify-content-start";
        typingDiv.innerHTML = `
            <div class="chat-bubble chat-bubble-assistant text-muted small py-2 px-3">
                <span class="spinner-grow spinner-grow-sm me-1 text-success" role="status"></span>
                <span>Consulting Tamil Nadu cultural heritage database...</span>
            </div>
        `;
        msgContainer.appendChild(typingDiv);
        msgContainer.scrollTop = msgContainer.scrollHeight;
    },

    removeTypingIndicator(id) {
        const el = document.getElementById(id);
        if (el) el.remove();
    }
};

window.Chatbot = Chatbot;
document.addEventListener("DOMContentLoaded", () => Chatbot.init());
