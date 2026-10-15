package com.tamilnadu.culture.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "collection_items", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"collection_id", "entry_id"})
})
public class CollectionItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "collection_id", nullable = false)
    private CulturalCollection collection;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "entry_id", nullable = false)
    private CulturalEntry entry;

    @Column(nullable = false, updatable = false)
    private LocalDateTime addedAt = LocalDateTime.now();

    public CollectionItem() {}

    public CollectionItem(CulturalCollection collection, CulturalEntry entry) {
        this.collection = collection;
        this.entry = entry;
        this.addedAt = LocalDateTime.now();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public CulturalCollection getCollection() { return collection; }
    public void setCollection(CulturalCollection collection) { this.collection = collection; }

    public CulturalEntry getEntry() { return entry; }
    public void setEntry(CulturalEntry entry) { this.entry = entry; }

    public LocalDateTime getAddedAt() { return addedAt; }
    public void setAddedAt(LocalDateTime addedAt) { this.addedAt = addedAt; }
}
