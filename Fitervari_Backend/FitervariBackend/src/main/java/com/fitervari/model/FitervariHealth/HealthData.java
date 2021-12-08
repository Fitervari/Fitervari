package com.fitervari.model.FitervariHealth;

import com.fitervari.model.Fitervari.Training;
import com.fitervari.model.Fitervari.WorkoutSet;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity(name="healthdata")
public class HealthData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="value", nullable = false)
    private String value;

    @Column(name="time", nullable = false)
    private LocalDateTime time;

    @ManyToOne
    private WorkoutSet workoutSet;

    @ManyToOne
    private Training training;

    @OneToOne
    private HealthDataType healthDataType;

}
