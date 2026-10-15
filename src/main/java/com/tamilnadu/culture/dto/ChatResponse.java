package com.tamilnadu.culture.dto;

import java.util.ArrayList;
import java.util.List;

public class ChatResponse {

    private String reply;
    private String intent;
    private String languageCode;
    private List<EntryCardSummary> suggestions = new ArrayList<>();

    public static class EntryCardSummary {
        private Long id;
        private String title;
        private String shortDescription;
        private String categoryName;
        private String districtName;
        private String coverImageUrl;

        public EntryCardSummary() {}

        public EntryCardSummary(Long id, String title, String shortDescription, String categoryName, String districtName, String coverImageUrl) {
            this.id = id;
            this.title = title;
            this.shortDescription = shortDescription;
            this.categoryName = categoryName;
            this.districtName = districtName;
            this.coverImageUrl = coverImageUrl;
        }

        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getShortDescription() { return shortDescription; }
        public void setShortDescription(String shortDescription) { this.shortDescription = shortDescription; }

        public String getCategoryName() { return categoryName; }
        public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

        public String getDistrictName() { return districtName; }
        public void setDistrictName(String districtName) { this.districtName = districtName; }

        public String getCoverImageUrl() { return coverImageUrl; }
        public void setCoverImageUrl(String coverImageUrl) { this.coverImageUrl = coverImageUrl; }
    }

    public ChatResponse() {}

    public ChatResponse(String reply, String intent, String languageCode, List<EntryCardSummary> suggestions) {
        this.reply = reply;
        this.intent = intent;
        this.languageCode = languageCode;
        this.suggestions = suggestions != null ? suggestions : new ArrayList<>();
    }

    public String getReply() { return reply; }
    public void setReply(String reply) { this.reply = reply; }

    public String getIntent() { return intent; }
    public void setIntent(String intent) { this.intent = intent; }

    public String getLanguageCode() { return languageCode; }
    public void setLanguageCode(String languageCode) { this.languageCode = languageCode; }

    public List<EntryCardSummary> getSuggestions() { return suggestions; }
    public void setSuggestions(List<EntryCardSummary> suggestions) { this.suggestions = suggestions; }
}
