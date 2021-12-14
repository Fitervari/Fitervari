package com.fitervari.model.FitervariHealth;

import com.fitervari.model.Fitervari.Training;
import com.fitervari.model.Fitervari.WorkoutSet;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity(name="healthdata")
@NamedQueries({
        @NamedQuery(name = HealthData.GETALLWITHCRITERIA,
                query = "SELECT h FROM healthdata h WHERE (:workoutSetId=-1L or h.workoutSet=:workoutSetId) and (:trainingsId=-1L or h.training.id=:trainingsId) and (:type=-1L or h.healthDataType.id=:type)")
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
    private WorkoutSet workoutSet;

    @ManyToOne
    private Training training;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private HealthDataType healthDataType;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public WorkoutSet getWorkoutSet() {
        return workoutSet;
    }

    public void setWorkoutSet(WorkoutSet workoutSet) {
        this.workoutSet = workoutSet;
    }

    public Training getTraining() {
        return training;
    }

    public void setTraining(Training training) {
        this.training = training;
    }

    public HealthDataType getHealthDataType() {
        return healthDataType;
    }

    public void setHealthDataType(HealthDataType healthDataType) {
        this.healthDataType = healthDataType;
    }

    public HealthData() {

    }

    public HealthData(String value, LocalDateTime time, HealthDataType type, WorkoutSet set, Training training) {
        this.value = value;
        this.time = time;
        this.healthDataType = type;
        this.workoutSet = set;
        this.training = training;
    }

}
