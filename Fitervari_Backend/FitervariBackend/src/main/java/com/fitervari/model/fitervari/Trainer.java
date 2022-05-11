package com.fitervari.model.fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name="trainer")
@Data
public class Trainer implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="username")
    private String username;

    @Column(name="password")
    private String password;

    public Trainer() {
    }

    public Trainer(long id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }
}