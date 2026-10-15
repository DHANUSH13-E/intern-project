package com.tamilnadu.culture.dto;

import com.tamilnadu.culture.entity.SubmissionStatus;
import jakarta.validation.constraints.NotNull;

public class ModerationRequest {

    @NotNull(message = "Moderation status is required")
    private SubmissionStatus status;

    private String notes;

    public ModerationRequest() {}

    public ModerationRequest(SubmissionStatus status, String notes) {
        this.status = status;
        this.notes = notes;
    }

    public SubmissionStatus getStatus() { return status; }
    public void setStatus(SubmissionStatus status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
