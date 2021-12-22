package com.fitervari.endpoints.dtos;

import java.io.Serializable;

public class HealthDataTypeDTO implements Serializable {

    private long id;
    private String name;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public HealthDataTypeDTO(long id, String name) {
        this.id = id;
        this.name = name;
    }
}
