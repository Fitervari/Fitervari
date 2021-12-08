package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="studio")
public class Studio implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="address", nullable = false)
    private String address;

    @ManyToOne
    private City city;

    @OneToMany(mappedBy = "studio")
    private List<Device> devices;
}
