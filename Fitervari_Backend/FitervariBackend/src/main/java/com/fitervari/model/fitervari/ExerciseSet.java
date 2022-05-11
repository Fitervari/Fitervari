package com.fitervari.model.fitervari;

import com.fitervari.model.fitervariHealth.HealthData;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="exerciseSet")
@Data
public class ExerciseSet implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="repetitions", nullable = false)
    private long repetitions;

    @Column(name="description")
    private String description;

    @Column(name="sort_identifier")
    private int sortIdentifier;

    @ManyToOne(fetch = FetchType.LAZY)
    private Exercise exercise;

    @OneToMany(mappedBy = "exerciseSet", cascade = CascadeType.ALL)
    private List<HealthData> healthData;

    public ExerciseSet() {
    }

    public ExerciseSet(long repetitions, String description, int sortIdentifier) {
        this.repetitions = repetitions;
        this.description = description;
        this.sortIdentifier = sortIdentifier;
    }
}