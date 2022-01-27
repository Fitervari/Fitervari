package com.fitervari.model.Fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name="device")
@Data
public class Device implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="unique_number", nullable = false)
    private int uniqueNumber;

    @ManyToOne
    private Studio studio;

    @ManyToOne
    private DeviceGroup deviceGroup;
}
