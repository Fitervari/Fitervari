package com.fitervari.model.fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="city")
@Data
public class City implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="postalcode", nullable = false)
    private String postalCode;

    @Column(name="city", nullable = false)
    private String city;

    @ManyToOne
    private Country country;

    @OneToMany(mappedBy = "city")
    private List<Studio> studios;
}
