package com.fitervari.model.Fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity(name="exercise")
public class Exercise implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="sort_identifier")
    private int sortIdentifier;

    @OneToOne(fetch = FetchType.EAGER)
    private DeviceGroup deviceGroup;

    @ManyToOne
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "exercise")
    private List<ExerciseSet> exerciseSets;
}
