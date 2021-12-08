package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="deviceGroup")
public class DeviceGroup implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @OneToOne(mappedBy = "deviceGroup")
    private Workout workout;

    @OneToMany(mappedBy = "deviceGroup")
    private List<Device> devices;
}
