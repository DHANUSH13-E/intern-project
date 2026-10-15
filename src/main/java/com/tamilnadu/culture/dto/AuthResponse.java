package com.tamilnadu.culture.dto;

public class AuthResponse {
    private String token;
    private Long id;
    private String fullName;
    private String email;
    private String role;
    private String preferredLanguage;

    public AuthResponse() {}

    public AuthResponse(String token, Long id, String fullName, String email, String role, String preferredLanguage) {
        this.token = token;
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
        this.preferredLanguage = preferredLanguage;
    }

    public String getToken() { return token; }
    public void setToken(String token) { this.token = token; }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getPreferredLanguage() { return preferredLanguage; }
    public void setPreferredLanguage(String preferredLanguage) { this.preferredLanguage = preferredLanguage; }
}
