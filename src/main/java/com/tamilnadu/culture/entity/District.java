package com.tamilnadu.culture.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "districts")
public class District {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 50)
    private String code;

    @Column(nullable = false, length = 100)
    private String nameEn;

    @Column(nullable = false, length = 150)
    private String nameTa;

    @Column(nullable = false, length = 50)
    private String region; // Northern, Central / Kaveri Delta, Western / Kongu Nadu, Southern / Pandia Nadu

    private Double latitude;
    private Double longitude;

    @Column(length = 1000)
    private String description;

    public District() {}

    public District(String code, String nameEn, String nameTa, String region, Double latitude, Double longitude, String description) {
        this.code = code;
        this.nameEn = nameEn;
        this.nameTa = nameTa;
        this.region = region;
        this.latitude = latitude;
        this.longitude = longitude;
        this.description = description;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getNameEn() { return nameEn; }
    public void setNameEn(String nameEn) { this.nameEn = nameEn; }

    public String getNameTa() { return nameTa; }
    public void setNameTa(String nameTa) { this.nameTa = nameTa; }

    public String getRegion() { return region; }
    public void setRegion(String region) { this.region = region; }

    public Double getLatitude() { return latitude; }
    public void setLatitude(Double latitude) { this.latitude = latitude; }

    public Double getLongitude() { return longitude; }
    public void setLongitude(Double longitude) { this.longitude = longitude; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
