package com.tamilnadu.culture.service;

import com.tamilnadu.culture.dto.CollectionRequest;
import com.tamilnadu.culture.entity.*;
import com.tamilnadu.culture.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@SuppressWarnings("null")
public class FavouriteAndCollectionService {

    private final FavouriteRepository favouriteRepository;
    private final CulturalCollectionRepository collectionRepository;
    private final CollectionItemRepository collectionItemRepository;
    private final CulturalEntryRepository entryRepository;
    private final UserRepository userRepository;

    public FavouriteAndCollectionService(FavouriteRepository favouriteRepository,
                                         CulturalCollectionRepository collectionRepository,
                                         CollectionItemRepository collectionItemRepository,
                                         CulturalEntryRepository entryRepository,
                                         UserRepository userRepository) {
        this.favouriteRepository = favouriteRepository;
        this.collectionRepository = collectionRepository;
        this.collectionItemRepository = collectionItemRepository;
        this.entryRepository = entryRepository;
        this.userRepository = userRepository;
    }

    @Transactional
    public boolean toggleFavourite(String userEmail, Long entryId) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));
        CulturalEntry entry = entryRepository.findById(entryId)
                .orElseThrow(() -> new IllegalArgumentException("Entry not found: " + entryId));

        if (favouriteRepository.existsByUserIdAndEntryId(user.getId(), entryId)) {
            favouriteRepository.deleteByUserIdAndEntryId(user.getId(), entryId);
            return false; // Removed
        } else {
            Favourite favourite = new Favourite(user, entry);
            favouriteRepository.save(favourite);
            return true; // Added
        }
    }

    public boolean isFavourite(String userEmail, Long entryId) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));
        return favouriteRepository.existsByUserIdAndEntryId(user.getId(), entryId);
    }

    public List<Favourite> getUserFavourites(String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));
        return favouriteRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
    }

    public List<CulturalCollection> getUserCollections(String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));
        return collectionRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
    }

    @Transactional
    public CulturalCollection createCollection(String userEmail, CollectionRequest request) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));

        CulturalCollection collection = new CulturalCollection(
                user,
                request.getName(),
                request.getDescription(),
                request.isPrivate()
        );
        return collectionRepository.save(collection);
    }

    @Transactional
    public void deleteCollection(String userEmail, Long collectionId) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));

        CulturalCollection collection = collectionRepository.findByIdAndUserId(collectionId, user.getId())
                .orElseThrow(() -> new IllegalArgumentException("Collection not found or access denied."));

        collectionRepository.delete(collection);
    }

    @Transactional
    public CollectionItem addEntryToCollection(String userEmail, Long collectionId, Long entryId) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));

        CulturalCollection collection = collectionRepository.findByIdAndUserId(collectionId, user.getId())
                .orElseThrow(() -> new IllegalArgumentException("Collection not found or unauthorized"));

        CulturalEntry entry = entryRepository.findById(entryId)
                .orElseThrow(() -> new IllegalArgumentException("Entry not found: " + entryId));

        if (collectionItemRepository.existsByCollectionIdAndEntryId(collectionId, entryId)) {
            throw new IllegalStateException("Entry is already in this collection.");
        }

        CollectionItem item = new CollectionItem(collection, entry);
        return collectionItemRepository.save(item);
    }

    @Transactional
    public void removeEntryFromCollection(String userEmail, Long collectionId, Long entryId) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));

        CulturalCollection collection = collectionRepository.findByIdAndUserId(collectionId, user.getId())
                .orElseThrow(() -> new IllegalArgumentException("Collection not found or unauthorized"));

        collectionItemRepository.deleteByCollectionIdAndEntryId(collection.getId(), entryId);
    }
}
