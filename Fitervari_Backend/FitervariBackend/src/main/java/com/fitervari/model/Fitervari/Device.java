package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name="device")
public class Device implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="description")
    private String description;

    @ManyToOne
    private Studio studio;

    @ManyToOne
    private DeviceGroup deviceGroup;
}
