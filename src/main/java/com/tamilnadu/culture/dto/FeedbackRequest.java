package com.tamilnadu.culture.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class FeedbackRequest {

    @NotBlank(message = "Category is required")
    private String category; // USABILITY, NAVIGATION, ACCESSIBILITY, TRANSLATION, CHATBOT, GENERAL

    @NotNull(message = "Rating is required")
    @Min(1) @Max(5)
    private Integer rating;

    @NotBlank(message = "Comments are required")
    @Size(min = 5, max = 2000)
    private String comments;

    public FeedbackRequest() {}

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Integer getRating() { return rating; }
    public void setRating(Integer rating) { this.rating = rating; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }
}
