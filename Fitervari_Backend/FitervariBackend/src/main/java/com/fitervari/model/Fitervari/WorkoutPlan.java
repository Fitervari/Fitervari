package com.fitervari.model.Fitervari;

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

    @Column(name="archived", nullable = false)
    private boolean archived;

    @ManyToOne
    private Customer customer;

    @OneToMany(mappedBy = "workoutPlan")
    private List<Exercise> exercises;

    @OneToMany(mappedBy = "workoutPlan")
    private List<Training> trainings;
}
