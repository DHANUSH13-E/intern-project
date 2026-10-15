package com.tamilnadu.culture.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class ReportRequest {

    @NotNull(message = "Entry ID is required")
    private Long entryId;

    @NotBlank(message = "Report type is required")
    private String reportType; // INCORRECT_HISTORY, MISLEADING_CLAIM, TRANSLATION_ERROR, QUESTIONABLE_SOURCE, CULTURAL_INSENSITIVITY, OTHER

    @NotBlank(message = "Details are required")
    @Size(min = 10, max = 2000, message = "Details must be between 10 and 2000 characters")
    private String details;

    public ReportRequest() {}

    public ReportRequest(Long entryId, String reportType, String details) {
        this.entryId = entryId;
        this.reportType = reportType;
        this.details = details;
    }

    public Long getEntryId() { return entryId; }
    public void setEntryId(Long entryId) { this.entryId = entryId; }

    public String getReportType() { return reportType; }
    public void setReportType(String reportType) { this.reportType = reportType; }

    public String getDetails() { return details; }
    public void setDetails(String details) { this.details = details; }
}
