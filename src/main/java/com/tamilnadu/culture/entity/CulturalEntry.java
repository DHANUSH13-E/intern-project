package com.tamilnadu.culture.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "cultural_entries")
public class CulturalEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 150)
    private String slug;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(length = 250)
    private String titleTa;

    @Column(length = 250)
    private String alternateNames;

    @Column(nullable = false, length = 1000)
    private String shortDescription;

    @Column(columnDefinition = "TEXT")
    private String fullDescription;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "district_id")
    private District district;

    @Column(length = 150)
    private String townVillage;

    private Double latitude;
    private Double longitude;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 40)
    private AuthenticityType authenticityType = AuthenticityType.HISTORICAL_FACT;

    @Column(length = 100)
    private String religionCommunity;

    @Column(columnDefinition = "TEXT")
    private String historyOrigin;

    @Column(columnDefinition = "TEXT")
    private String culturalSignificance;

    @Column(columnDefinition = "TEXT")
    private String festivalsCustoms;

    @Column(columnDefinition = "TEXT")
    private String relatedArts;

    @Column(columnDefinition = "TEXT")
    private String traditionalClothing;

    @Column(columnDefinition = "TEXT")
    private String traditionalCuisine;

    @Column(columnDefinition = "TEXT")
    private String folkloreStories;

    @Column(length = 500)
    private String coverImageUrl;

    @Column(columnDefinition = "TEXT")
    private String sourceReferences;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contributor_id")
    @com.fasterxml.jackson.annotation.JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "passwordHash"})
    private User contributor;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private SubmissionStatus status = SubmissionStatus.APPROVED;

    @Column(columnDefinition = "TEXT")
    private String moderationNotes;

    @Column(nullable = false)
    private boolean featured = false;

    @Column(nullable = false)
    private boolean hiddenGem = false;

    @Column(nullable = false)
    private Double averageRating = 0.0;

    @Column(nullable = false)
    private int totalRatings = 0;

    @Column(nullable = false)
    private int viewCount = 0;

    @Column(length = 300)
    private String tags;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(nullable = false)
    private LocalDateTime updatedAt = LocalDateTime.now();

    public CulturalEntry() {}

    @PreUpdate
    public void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getSlug() { return slug; }
    public void setSlug(String slug) { this.slug = slug; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getTitleTa() { return titleTa; }
    public void setTitleTa(String titleTa) { this.titleTa = titleTa; }

    public String getAlternateNames() { return alternateNames; }
    public void setAlternateNames(String alternateNames) { this.alternateNames = alternateNames; }

    public String getShortDescription() { return shortDescription; }
    public void setShortDescription(String shortDescription) { this.shortDescription = shortDescription; }

    public String getFullDescription() { return fullDescription; }
    public void setFullDescription(String fullDescription) { this.fullDescription = fullDescription; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }

    public District getDistrict() { return district; }
    public void setDistrict(District district) { this.district = district; }

    public String getTownVillage() { return townVillage; }
    public void setTownVillage(String townVillage) { this.townVillage = townVillage; }

    public Double getLatitude() { return latitude; }
    public void setLatitude(Double latitude) { this.latitude = latitude; }

    public Double getLongitude() { return longitude; }
    public void setLongitude(Double longitude) { this.longitude = longitude; }

    public AuthenticityType getAuthenticityType() { return authenticityType; }
    public void setAuthenticityType(AuthenticityType authenticityType) { this.authenticityType = authenticityType; }

    public String getReligionCommunity() { return religionCommunity; }
    public void setReligionCommunity(String religionCommunity) { this.religionCommunity = religionCommunity; }

    public String getHistoryOrigin() { return historyOrigin; }
    public void setHistoryOrigin(String historyOrigin) { this.historyOrigin = historyOrigin; }

    public String getCulturalSignificance() { return culturalSignificance; }
    public void setCulturalSignificance(String culturalSignificance) { this.culturalSignificance = culturalSignificance; }

    public String getFestivalsCustoms() { return festivalsCustoms; }
    public void setFestivalsCustoms(String festivalsCustoms) { this.festivalsCustoms = festivalsCustoms; }

    public String getRelatedArts() { return relatedArts; }
    public void setRelatedArts(String relatedArts) { this.relatedArts = relatedArts; }

    public String getTraditionalClothing() { return traditionalClothing; }
    public void setTraditionalClothing(String traditionalClothing) { this.traditionalClothing = traditionalClothing; }

    public String getTraditionalCuisine() { return traditionalCuisine; }
    public void setTraditionalCuisine(String traditionalCuisine) { this.traditionalCuisine = traditionalCuisine; }

    public String getFolkloreStories() { return folkloreStories; }
    public void setFolkloreStories(String folkloreStories) { this.folkloreStories = folkloreStories; }

    public String getCoverImageUrl() { return coverImageUrl; }
    public void setCoverImageUrl(String coverImageUrl) { this.coverImageUrl = coverImageUrl; }

    public String getSourceReferences() { return sourceReferences; }
    public void setSourceReferences(String sourceReferences) { this.sourceReferences = sourceReferences; }

    public User getContributor() { return contributor; }
    public void setContributor(User contributor) { this.contributor = contributor; }

    public SubmissionStatus getStatus() { return status; }
    public void setStatus(SubmissionStatus status) { this.status = status; }

    public String getModerationNotes() { return moderationNotes; }
    public void setModerationNotes(String moderationNotes) { this.moderationNotes = moderationNotes; }

    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }

    public boolean isHiddenGem() { return hiddenGem; }
    public void setHiddenGem(boolean hiddenGem) { this.hiddenGem = hiddenGem; }

    public Double getAverageRating() { return averageRating; }
    public void setAverageRating(Double averageRating) { this.averageRating = averageRating; }

    public int getTotalRatings() { return totalRatings; }
    public void setTotalRatings(int totalRatings) { this.totalRatings = totalRatings; }

    public int getViewCount() { return viewCount; }
    public void setViewCount(int viewCount) { this.viewCount = viewCount; }

    public String getTags() { return tags; }
    public void setTags(String tags) { this.tags = tags; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
