package com.fitervari.model.FitervariHealth;

import javax.persistence.*;

@Entity(name="healthDataType")
public class HealthDataType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @OneToOne(mappedBy = "healthDataType")
    private HealthData healthData;
}
