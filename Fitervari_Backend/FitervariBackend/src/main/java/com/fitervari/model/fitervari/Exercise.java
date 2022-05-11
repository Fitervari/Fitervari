package com.fitervari.model.fitervari;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

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

    @OneToOne(cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private DeviceGroup deviceGroup;

    @ManyToOne(fetch = FetchType.LAZY)
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "exercise", cascade = CascadeType.ALL)
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

    public Exercise(String name, String description, int sortIdentifier, DeviceGroup deviceGroup, List<ExerciseSet> exerciseSets) {
        this.name = name;
        this.description = description;
        this.sortIdentifier = sortIdentifier;
        this.deviceGroup = deviceGroup;
        this.exerciseSets = exerciseSets;
    }

    public Exercise(String name, String description, int sortIdentifier, DeviceGroup deviceGroup) {
        this.name = name;
        this.description = description;
        this.sortIdentifier = sortIdentifier;
        this.deviceGroup = deviceGroup;
    }

    public Exercise(String name, String description, int sortIdentifier, DeviceGroup deviceGroup, WorkoutPlan plan) {
        this.name = name;
        this.description = description;
        this.sortIdentifier = sortIdentifier;
        this.deviceGroup = deviceGroup;
        this.workoutPlan = plan;
    }
}