package com.fitervari.model.Fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
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

    @OneToOne(mappedBy = "deviceGroup", fetch = FetchType.LAZY)
    @Transient
    private Exercise exercise;

    @OneToMany(mappedBy = "deviceGroup")
    private List<Device> devices;
}
