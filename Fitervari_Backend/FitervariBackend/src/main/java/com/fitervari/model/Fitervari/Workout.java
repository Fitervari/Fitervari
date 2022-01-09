package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="workout")
public class Workout implements Serializable {

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

    @OneToOne
    private DeviceGroup deviceGroup;

    @ManyToOne
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "workout")
    private List<WorkoutSet> workoutSets;
}
