package com.tamilnadu.culture.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "content_translations", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"entry_id", "languageCode"})
})
public class ContentTranslation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "entry_id", nullable = false)
    private CulturalEntry entry;

    @Column(nullable = false, length = 10)
    private String languageCode; // ta, hi, te, ml, kn, fr

    @Column(nullable = false, length = 250)
    private String translatedTitle;

    @Column(length = 1000)
    private String translatedShortDescription;

    @Column(columnDefinition = "TEXT")
    private String translatedFullDescription;

    @Column(nullable = false, length = 30)
    private String reviewStatus = "REVIEWED"; // DRAFT, REVIEWED, APPROVED

    @Column(length = 500)
    private String reviewerNotes;

    @Column(nullable = false)
    private LocalDateTime updatedAt = LocalDateTime.now();

    public ContentTranslation() {}

    public ContentTranslation(CulturalEntry entry, String languageCode, String translatedTitle, String translatedShortDescription, String translatedFullDescription, String reviewStatus) {
        this.entry = entry;
        this.languageCode = languageCode;
        this.translatedTitle = translatedTitle;
        this.translatedShortDescription = translatedShortDescription;
        this.translatedFullDescription = translatedFullDescription;
        this.reviewStatus = reviewStatus;
        this.updatedAt = LocalDateTime.now();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public CulturalEntry getEntry() { return entry; }
    public void setEntry(CulturalEntry entry) { this.entry = entry; }

    public String getLanguageCode() { return languageCode; }
    public void setLanguageCode(String languageCode) { this.languageCode = languageCode; }

    public String getTranslatedTitle() { return translatedTitle; }
    public void setTranslatedTitle(String translatedTitle) { this.translatedTitle = translatedTitle; }

    public String getTranslatedShortDescription() { return translatedShortDescription; }
    public void setTranslatedShortDescription(String translatedShortDescription) { this.translatedShortDescription = translatedShortDescription; }

    public String getTranslatedFullDescription() { return translatedFullDescription; }
    public void setTranslatedFullDescription(String translatedFullDescription) { this.translatedFullDescription = translatedFullDescription; }

    public String getReviewStatus() { return reviewStatus; }
    public void setReviewStatus(String reviewStatus) { this.reviewStatus = reviewStatus; }

    public String getReviewerNotes() { return reviewerNotes; }
    public void setReviewerNotes(String reviewerNotes) { this.reviewerNotes = reviewerNotes; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
