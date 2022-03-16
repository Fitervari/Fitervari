package com.fitervari.model.fitervari;

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

    public Exercise() {
    }

    public Exercise(long id, String name, String description, int sortIdentifier, DeviceGroup deviceGroup) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sortIdentifier = sortIdentifier;
        this.deviceGroup = deviceGroup;
    }
}
