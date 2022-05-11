package com.fitervari.model.fitervari;

import lombok.Data;

import javax.json.bind.annotation.JsonbTransient;
import javax.persistence.*;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

@Entity(name="deviceGroup")
@Data
public class DeviceGroup implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="description")
    private String description;

    @OneToOne(mappedBy = "deviceGroup", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @Transient
    private Exercise exercise;

    @OneToMany(mappedBy = "deviceGroup", cascade = CascadeType.ALL)
    private List<Device> devices;

    public DeviceGroup() {
    }

    public DeviceGroup(long id, String name, String description, List<Device> devices) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.devices = devices;
    }

    public DeviceGroup(String name, String description, List<Device> devices) {
        this.name = name;
        this.description = description;
        this.devices = devices;
    }

    public DeviceGroup(String name, String description) {
        this.name = name;
        this.description = description;
    }
}