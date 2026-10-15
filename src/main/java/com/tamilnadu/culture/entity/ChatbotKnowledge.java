package com.tamilnadu.culture.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "chatbot_qa_knowledge")
public class ChatbotKnowledge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String intentKey; // e.g., GREETING, TEMPLE_HISTORY, FOLK_DANCE, CUISINE_RECOMMENDATION, DISTRICT_TRAVEL

    @Column(nullable = false, length = 500)
    private String keywords; // comma-separated keywords e.g. "dance, karagattam, bharatanatyam, thappattam"

    @Column(length = 100)
    private String categoryCode;

    @Column(length = 50)
    private String districtCode;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String responseEn;

    @Column(columnDefinition = "TEXT")
    private String responseTa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "related_entry_id")
    private CulturalEntry relatedEntry;

    @Column(nullable = false)
    private boolean verified = true;

    public ChatbotKnowledge() {}

    public ChatbotKnowledge(String intentKey, String keywords, String categoryCode, String districtCode, String responseEn, String responseTa, CulturalEntry relatedEntry) {
        this.intentKey = intentKey;
        this.keywords = keywords;
        this.categoryCode = categoryCode;
        this.districtCode = districtCode;
        this.responseEn = responseEn;
        this.responseTa = responseTa;
        this.relatedEntry = relatedEntry;
        this.verified = true;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getIntentKey() { return intentKey; }
    public void setIntentKey(String intentKey) { this.intentKey = intentKey; }

    public String getKeywords() { return keywords; }
    public void setKeywords(String keywords) { this.keywords = keywords; }

    public String getCategoryCode() { return categoryCode; }
    public void setCategoryCode(String categoryCode) { this.categoryCode = categoryCode; }

    public String getDistrictCode() { return districtCode; }
    public void setDistrictCode(String districtCode) { this.districtCode = districtCode; }

    public String getResponseEn() { return responseEn; }
    public void setResponseEn(String responseEn) { this.responseEn = responseEn; }

    public String getResponseTa() { return responseTa; }
    public void setResponseTa(String responseTa) { this.responseTa = responseTa; }

    public CulturalEntry getRelatedEntry() { return relatedEntry; }
    public void setRelatedEntry(CulturalEntry relatedEntry) { this.relatedEntry = relatedEntry; }

    public boolean isVerified() { return verified; }
    public void setVerified(boolean verified) { this.verified = verified; }
}
