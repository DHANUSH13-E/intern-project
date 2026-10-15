package com.tamilnadu.culture.dto;

import com.tamilnadu.culture.entity.AuthenticityType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class ContributionRequest {

    @NotBlank(message = "Title is required")
    @Size(max = 200)
    private String title;

    private String titleTa;
    private String alternateNames;

    @NotBlank(message = "Short description is required")
    @Size(max = 1000)
    private String shortDescription;

    private String fullDescription;

    @NotNull(message = "Category is required")
    private Long categoryId;

    private Long districtId;
    private String townVillage;

    private Double latitude;
    private Double longitude;

    private AuthenticityType authenticityType = AuthenticityType.COMMUNITY_ORAL_HISTORY;
    private String religionCommunity;

    private String historyOrigin;
    private String culturalSignificance;
    private String festivalsCustoms;
    private String relatedArts;
    private String traditionalClothing;
    private String traditionalCuisine;
    private String folkloreStories;

    private String coverImageUrl;
    private String sourceReferences;
    private String tags;

    public ContributionRequest() {}

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

    public Long getCategoryId() { return categoryId; }
    public void setCategoryId(Long categoryId) { this.categoryId = categoryId; }

    public Long getDistrictId() { return districtId; }
    public void setDistrictId(Long districtId) { this.districtId = districtId; }

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

    public String getTags() { return tags; }
    public void setTags(String tags) { this.tags = tags; }
}
