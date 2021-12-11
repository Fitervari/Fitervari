package com.fitervari.model.FitervariHealth;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fitervari.model.Fitervari.Training;
import com.fitervari.model.Fitervari.WorkoutSet;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity(name="healthdata")
@NamedQueries({
        @NamedQuery(name = HealthData.GETALLFORTRAINING,
                query = "SELECT h FROM healthdata h JOIN FETCH h.healthDataType WHERE h.training.id=:trainingsId and (:type=-1L or h.healthDataType.id=:type)"),
        @NamedQuery(name = HealthData.GETALLFORWORKOUTSET,
                query = "SELECT h FROM healthdata h WHERE h.workoutSet=:workoutSetId")
})
public class HealthData {

    public static final String GETALLFORTRAINING = "HealthData.GetAllForTraining";
    public static final String GETALLFORWORKOUTSET = "HealthData.GetAllForWorkoutSet";
    public static final String GETALLWITH = "HealthData.GetAllForTraining";

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
    @JsonIgnore
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

}
