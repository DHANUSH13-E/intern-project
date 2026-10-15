package com.tamilnadu.culture.dto;

import jakarta.validation.constraints.NotBlank;

public class ChatRequest {

    @NotBlank(message = "Question or message is required")
    private String message;

    private String languageCode = "en";
    private String districtCode;
    private String categoryCode;

    public ChatRequest() {}

    public ChatRequest(String message, String languageCode, String districtCode, String categoryCode) {
        this.message = message;
        this.languageCode = languageCode;
        this.districtCode = districtCode;
        this.categoryCode = categoryCode;
    }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getLanguageCode() { return languageCode; }
    public void setLanguageCode(String languageCode) { this.languageCode = languageCode; }

    public String getDistrictCode() { return districtCode; }
    public void setDistrictCode(String districtCode) { this.districtCode = districtCode; }

    public String getCategoryCode() { return categoryCode; }
    public void setCategoryCode(String categoryCode) { this.categoryCode = categoryCode; }
}
