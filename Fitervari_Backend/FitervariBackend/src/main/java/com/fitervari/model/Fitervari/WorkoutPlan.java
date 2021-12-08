package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity(name="workoutPlan")
public class WorkoutPlan implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="valid_from", nullable = false)
    private LocalDate validFrom;

    @Column(name="valid_till")
    private LocalDate validTill;

    @Column(name="name")
    private String name;

    @Column(name="archived", nullable = false)
    private boolean isArchived;

    @ManyToOne
    private Customer customer;

    @OneToMany(mappedBy = "workoutPlan")
    private List<Workout> workouts;

    @OneToMany(mappedBy = "workoutPlan")
    private List<Training> trainings;
}
