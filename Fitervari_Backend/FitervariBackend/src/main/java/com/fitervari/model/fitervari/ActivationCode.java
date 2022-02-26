package com.fitervari.model.fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name="activationCode")
@Data
public class ActivationCode implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="code", nullable = false)
    private String code;

    @Column(name="valid", nullable = false)
    private boolean valid;

    @ManyToOne
    private Customer customer;
}
