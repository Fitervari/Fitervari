package com.fitervari.endpoints.dtos;

import java.io.Serializable;

public class DeviceDTO implements Serializable {

    private long id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public DeviceDTO(long id) {
        this.id = id;
    }

}
