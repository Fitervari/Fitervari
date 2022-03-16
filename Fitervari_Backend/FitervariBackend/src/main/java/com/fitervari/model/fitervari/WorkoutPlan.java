package com.fitervari.model.fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Data
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

    @Column(name="description", nullable = false)
    private String description;

    @Column(name="archived", nullable = false)
    private boolean archived;

    @ManyToOne
    private Customer customer;

    @OneToMany(mappedBy = "workoutPlan")
    private List<Exercise> exercises;

    @OneToMany(mappedBy = "workoutPlan")
    private List<Training> trainings;

    public WorkoutPlan() {
    }

    public WorkoutPlan(LocalDate validFrom, LocalDate validTill, String name, String description, boolean archived, Customer customer, List<Exercise> exercises) {
        this.validFrom = validFrom;
        this.validTill = validTill;
        this.name = name;
        this.description = description;
        this.archived = archived;
        this.customer = customer;
        this.exercises = exercises;
    }
}
