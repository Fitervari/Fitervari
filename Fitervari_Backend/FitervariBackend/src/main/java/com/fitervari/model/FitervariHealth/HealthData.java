package com.fitervari.model.FitervariHealth;

import com.fitervari.model.Fitervari.Training;
import com.fitervari.model.Fitervari.ExerciseSet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity(name="healthdata")
@Data
@AllArgsConstructor
@NoArgsConstructor
@NamedQueries({
        @NamedQuery(name = HealthData.GETALLWITHCRITERIA,
                query = "SELECT h FROM healthdata h WHERE (:exerciseSetId=-1L or h.exerciseSet=:exerciseSetId) and (:trainingsId=-1L or h.training.id=:trainingsId) and (:type=-1L or h.healthDataType.id=:type)")
})
public class HealthData {

    public static final String GETALLWITHCRITERIA = "HealthData.GetAllWithCriteria";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="value", nullable = false)
    private String value;

    @Column(name="time", nullable = false)
    private LocalDateTime time;

    @ManyToOne
    private ExerciseSet exerciseSet;

    @ManyToOne
    private Training training;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private HealthDataType healthDataType;

    public HealthData(String value, LocalDateTime time, HealthDataType type, ExerciseSet exerciseSet, Training training) {
        this.value = value;
        this.time = time;
        this.healthDataType = type;
        this.exerciseSet = exerciseSet;
        this.training = training;
    }
}
