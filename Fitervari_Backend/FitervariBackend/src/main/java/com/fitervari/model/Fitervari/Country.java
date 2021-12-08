package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="country")
public class Country implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="code", nullable = false)
    private String code;

    @Column(name="name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "country")
    private List<City> cities;

}
