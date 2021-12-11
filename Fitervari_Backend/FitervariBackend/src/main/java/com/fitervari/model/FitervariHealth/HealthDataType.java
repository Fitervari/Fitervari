package com.fitervari.model.FitervariHealth;

import javax.persistence.*;
import java.util.List;

@Entity(name="healthDataType")
public class HealthDataType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "healthDataType")
    private List<HealthData> healthData;
}
