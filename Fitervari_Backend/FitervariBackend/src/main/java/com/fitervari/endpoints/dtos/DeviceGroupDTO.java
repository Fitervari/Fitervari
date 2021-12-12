package com.fitervari.endpoints.dtos;

import java.io.Serializable;
import java.util.List;

public class DeviceGroupDTO implements Serializable {
    private long id;
    private String name;
    private String description;
    private List<DeviceDTO> devices;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<DeviceDTO> getDevices() {
        return devices;
    }

    public void setDevices(List<DeviceDTO> devices) {
        this.devices = devices;
    }

    public DeviceGroupDTO(long id, String name, String description, List<DeviceDTO> devices) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.devices = devices;
    }
}
