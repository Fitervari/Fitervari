package com.fitervari.model.fitervari;

import com.fitervari.model.fitervariHealth.HealthData;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity(name="training")
@Data
public class Training implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="date", nullable = false)
    private LocalDate date;

    @Column(name="startTime", nullable = false)
    private LocalTime startTime;

    @Column(name="endTime")
    private LocalTime endTime;

    @ManyToOne
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "training")
    private List<HealthData> healthData;

    // Getter & Setter
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public WorkoutPlan getWorkoutPlan() {
        return workoutPlan;
    }

    public void setWorkoutPlan(WorkoutPlan workoutPlan) {
        this.workoutPlan = workoutPlan;
    }

    public List<HealthData> getHealthData() {
        return healthData;
    }

    public void setHealthData(List<HealthData> healthData) {
        this.healthData = healthData;
    }

    public Training() {
    }

    public Training(LocalDate date, LocalTime startTime, WorkoutPlan workoutPlan) {
        this.date = date;
        this.startTime = startTime;
        this.workoutPlan = workoutPlan;
    }
}
