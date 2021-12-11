package com.fitervari.model.Fitervari;

import com.fitervari.model.FitervariHealth.HealthData;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity(name="training")
public class Training implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="date", nullable = false)
    private LocalDate date;

    @ManyToOne
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "training")
    private List<HealthData> healthData;
}