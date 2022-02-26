package com.fitervari.model.fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="studio")
@Data
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

    @OneToMany(mappedBy = "studio")
    private List<Customer> customers;
}
