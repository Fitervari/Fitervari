package com.fitervari.model.fitervari;

import com.fitervari.model.fitervariHealth.HealthData;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

    @Column(name="date2")
    private LocalDateTime date2;

    @Column(name="startTime", nullable = false)
    private LocalTime startTime;

    @Column(name="endTime")
    private LocalTime endTime;

    @ManyToOne(cascade = CascadeType.ALL)
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "training", cascade = CascadeType.ALL)
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

    public LocalDateTime getDate2() {
        return date2;
    }

    public void setDate2(LocalDateTime date) {
        this.date2 = date;
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

    public Training(LocalDate date, LocalDateTime date2, LocalTime startTime, WorkoutPlan workoutPlan) {
        this.date = date;
        this.startTime = startTime;
        this.date2 = date2;
        this.workoutPlan = workoutPlan;
    }
}