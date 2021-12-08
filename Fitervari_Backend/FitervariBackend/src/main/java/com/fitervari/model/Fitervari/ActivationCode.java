package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name="activationCode")
public class ActivationCode implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="code", nullable = false)
    private String code;

    @Column(name="valid", nullable = false)
    private boolean isValid;

    @ManyToOne
    private Customer customer;
}
