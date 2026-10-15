package com.tamilnadu.culture.service;

import com.tamilnadu.culture.dto.ContributionRequest;
import com.tamilnadu.culture.entity.*;
import com.tamilnadu.culture.repository.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@SuppressWarnings("null")
public class CulturalEntryService {

    private final CulturalEntryRepository entryRepository;
    private final CategoryRepository categoryRepository;
    private final DistrictRepository districtRepository;
    private final UserRepository userRepository;
    private final ContentTranslationRepository translationRepository;

    public CulturalEntryService(CulturalEntryRepository entryRepository,
                                CategoryRepository categoryRepository,
                                DistrictRepository districtRepository,
                                UserRepository userRepository,
                                ContentTranslationRepository translationRepository) {
        this.entryRepository = entryRepository;
        this.categoryRepository = categoryRepository;
        this.districtRepository = districtRepository;
        this.userRepository = userRepository;
        this.translationRepository = translationRepository;
    }

    public List<CulturalEntry> getFeaturedEntries() {
        return entryRepository.findByStatusAndFeaturedTrue(SubmissionStatus.APPROVED);
    }

    public List<CulturalEntry> getHiddenGems() {
        return entryRepository.findByStatusAndHiddenGemTrue(SubmissionStatus.APPROVED);
    }

    public List<CulturalEntry> getRecentEntries() {
        return entryRepository.findTop6ByStatusOrderByCreatedAtDesc(SubmissionStatus.APPROVED);
    }

    public List<CulturalEntry> getMappedEntries() {
        return entryRepository.findMappedEntries();
    }

    public Page<CulturalEntry> searchEntries(Long categoryId, Long districtId, AuthenticityType authenticityType,
                                             String keyword, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));
        return entryRepository.searchPublishedEntries(SubmissionStatus.APPROVED, categoryId, districtId, authenticityType, keyword, pageable);
    }

    @Transactional
    public CulturalEntry getEntryById(Long id, String languageCode) {
        CulturalEntry entry = entryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Cultural entry not found with id: " + id));

        // Increment view count
        entry.setViewCount(entry.getViewCount() + 1);
        entryRepository.save(entry);

        // If a specific language is requested (other than en/ta where native fields exist), check translation table
        if (languageCode != null && !languageCode.isBlank() && !languageCode.equalsIgnoreCase("en")) {
            Optional<ContentTranslation> translationOpt = translationRepository.findByEntryIdAndLanguageCode(id, languageCode.toLowerCase());
            if (translationOpt.isPresent()) {
                ContentTranslation trans = translationOpt.get();
                if (trans.getTranslatedTitle() != null && !trans.getTranslatedTitle().isBlank()) {
                    entry.setTitle(trans.getTranslatedTitle());
                }
                if (trans.getTranslatedShortDescription() != null && !trans.getTranslatedShortDescription().isBlank()) {
                    entry.setShortDescription(trans.getTranslatedShortDescription());
                }
                if (trans.getTranslatedFullDescription() != null && !trans.getTranslatedFullDescription().isBlank()) {
                    entry.setFullDescription(trans.getTranslatedFullDescription());
                }
            }
        }

        return entry;
    }

    @Transactional
    public CulturalEntry submitContribution(String userEmail, ContributionRequest request) {
        User contributor = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));

        Category category = categoryRepository.findById(request.getCategoryId())
                .orElseThrow(() -> new IllegalArgumentException("Category not found with id: " + request.getCategoryId()));

        District district = null;
        if (request.getDistrictId() != null) {
            district = districtRepository.findById(request.getDistrictId()).orElse(null);
        }

        CulturalEntry entry = new CulturalEntry();
        entry.setTitle(request.getTitle());
        entry.setTitleTa(request.getTitleTa());
        entry.setAlternateNames(request.getAlternateNames());
        entry.setShortDescription(request.getShortDescription());
        entry.setFullDescription(request.getFullDescription());
        entry.setCategory(category);
        entry.setDistrict(district);
        entry.setTownVillage(request.getTownVillage());
        entry.setLatitude(request.getLatitude());
        entry.setLongitude(request.getLongitude());
        entry.setAuthenticityType(request.getAuthenticityType() != null ? request.getAuthenticityType() : AuthenticityType.COMMUNITY_ORAL_HISTORY);
        entry.setReligionCommunity(request.getReligionCommunity());
        entry.setHistoryOrigin(request.getHistoryOrigin());
        entry.setCulturalSignificance(request.getCulturalSignificance());
        entry.setFestivalsCustoms(request.getFestivalsCustoms());
        entry.setRelatedArts(request.getRelatedArts());
        entry.setTraditionalClothing(request.getTraditionalClothing());
        entry.setTraditionalCuisine(request.getTraditionalCuisine());
        entry.setFolkloreStories(request.getFolkloreStories());
        entry.setCoverImageUrl(request.getCoverImageUrl());
        entry.setSourceReferences(request.getSourceReferences());
        entry.setTags(request.getTags());

        // Contribution workflow: Always starts as PENDING for admin review
        entry.setContributor(contributor);
        entry.setStatus(SubmissionStatus.PENDING);
        entry.setModerationNotes("Submitted by community contributor on " + java.time.LocalDate.now());
        entry.setHiddenGem(true); // User submissions default to hidden discoveries

        return entryRepository.save(entry);
    }

    public List<CulturalEntry> getUserContributions(String userEmail) {
        User contributor = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));
        return entryRepository.findByContributorIdOrderByCreatedAtDesc(contributor.getId());
    }
}
