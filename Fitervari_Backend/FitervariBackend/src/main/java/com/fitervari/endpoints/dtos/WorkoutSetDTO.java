package com.fitervari.endpoints.dtos;

import java.io.Serializable;

public class WorkoutSetDTO implements Serializable {
    private long id;
    private String description;
    private String repetitions;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRepetitions() {
        return repetitions;
    }

    public void setRepetitions(String repetitions) {
        this.repetitions = repetitions;
    }

    public WorkoutSetDTO(long id, String description, String repetitions) {
        this.id = id;
        this.description = description;
        this.repetitions = repetitions;
    }
}
