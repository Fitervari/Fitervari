package com.fitervari.model.Fitervari;

import com.fitervari.model.FitervariHealth.HealthData;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="workoutSet")
public class WorkoutSet implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="repetitions", nullable = false)
    private String repetitions;

    @Column(name="description")
    private String description;

    @ManyToOne
    private Workout workout;

    @OneToMany(mappedBy = "workoutSet")
    private List<HealthData> healthData;
}
