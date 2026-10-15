package com.tamilnadu.culture.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class CollectionRequest {

    @NotBlank(message = "Collection name is required")
    @Size(min = 2, max = 120)
    private String name;

    @Size(max = 500)
    private String description;

    private boolean isPrivate = true;

    public CollectionRequest() {}

    public CollectionRequest(String name, String description, boolean isPrivate) {
        this.name = name;
        this.description = description;
        this.isPrivate = isPrivate;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public boolean isPrivate() { return isPrivate; }
    public void setPrivate(boolean aPrivate) { isPrivate = aPrivate; }
}
