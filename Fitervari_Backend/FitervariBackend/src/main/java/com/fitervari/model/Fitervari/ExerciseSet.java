package com.fitervari.model.Fitervari;

import com.fitervari.model.FitervariHealth.HealthData;
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
    private String repetitions;

    @Column(name="description")
    private String description;

    @Column(name="sort_identifier")
    private int sortIdentifier;

    @ManyToOne
    private Exercise exercise;

    @OneToMany(mappedBy = "exerciseSet")
    private List<HealthData> healthData;
}
