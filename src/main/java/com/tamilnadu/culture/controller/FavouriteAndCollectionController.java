package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.dto.CollectionRequest;
import com.tamilnadu.culture.entity.CollectionItem;
import com.tamilnadu.culture.entity.CulturalCollection;
import com.tamilnadu.culture.entity.Favourite;
import com.tamilnadu.culture.service.FavouriteAndCollectionService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class FavouriteAndCollectionController {

    private final FavouriteAndCollectionService favouriteService;

    public FavouriteAndCollectionController(FavouriteAndCollectionService favouriteService) {
        this.favouriteService = favouriteService;
    }

    @PostMapping("/favourites/{entryId}/toggle")
    public ResponseEntity<ApiResponse<Boolean>> toggleFavourite(@PathVariable Long entryId, Authentication authentication) {
        boolean added = favouriteService.toggleFavourite(authentication.getName(), entryId);
        String msg = added ? "Added to favourites." : "Removed from favourites.";
        return ResponseEntity.ok(ApiResponse.ok(msg, added));
    }

    @GetMapping("/favourites/check/{entryId}")
    public ResponseEntity<ApiResponse<Boolean>> isFavourite(@PathVariable Long entryId, Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.ok(ApiResponse.ok(false));
        }
        boolean fav = favouriteService.isFavourite(authentication.getName(), entryId);
        return ResponseEntity.ok(ApiResponse.ok(fav));
    }

    @GetMapping("/favourites")
    public ResponseEntity<ApiResponse<List<Favourite>>> getFavourites(Authentication authentication) {
        List<Favourite> list = favouriteService.getUserFavourites(authentication.getName());
        return ResponseEntity.ok(ApiResponse.ok(list));
    }

    @GetMapping("/collections")
    public ResponseEntity<ApiResponse<List<CulturalCollection>>> getCollections(Authentication authentication) {
        List<CulturalCollection> list = favouriteService.getUserCollections(authentication.getName());
        return ResponseEntity.ok(ApiResponse.ok(list));
    }

    @PostMapping("/collections")
    public ResponseEntity<ApiResponse<CulturalCollection>> createCollection(
            @Valid @RequestBody CollectionRequest request, Authentication authentication) {
        CulturalCollection collection = favouriteService.createCollection(authentication.getName(), request);
        return ResponseEntity.ok(ApiResponse.ok("Collection created successfully.", collection));
    }

    @DeleteMapping("/collections/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteCollection(@PathVariable Long id, Authentication authentication) {
        favouriteService.deleteCollection(authentication.getName(), id);
        return ResponseEntity.ok(ApiResponse.ok("Collection deleted successfully.", null));
    }

    @PostMapping("/collections/{collectionId}/items/{entryId}")
    public ResponseEntity<ApiResponse<CollectionItem>> addItemToCollection(
            @PathVariable Long collectionId, @PathVariable Long entryId, Authentication authentication) {
        CollectionItem item = favouriteService.addEntryToCollection(authentication.getName(), collectionId, entryId);
        return ResponseEntity.ok(ApiResponse.ok("Saved to collection.", item));
    }

    @DeleteMapping("/collections/{collectionId}/items/{entryId}")
    public ResponseEntity<ApiResponse<Void>> removeItemFromCollection(
            @PathVariable Long collectionId, @PathVariable Long entryId, Authentication authentication) {
        favouriteService.removeEntryFromCollection(authentication.getName(), collectionId, entryId);
        return ResponseEntity.ok(ApiResponse.ok("Removed from collection.", null));
    }
}
