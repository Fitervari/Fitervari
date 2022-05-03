package com.fitervari.endpoints.dtos.get;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainingDTO {

    private long id;
    private LocalDate date;
    private LocalDateTime date2;
    private LocalTime startTime;
    private LocalTime endTime;
    private WorkoutPlanDTO workoutPlan;
    private List<HealthDataDTO> healthData;
/*
    public TrainingDTO(long id, LocalDate date, LocalTime startTime, LocalTime endTime, WorkoutPlanDTO workoutPlan, List<HealthDataDTO> healthData) {
        this.id = id;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.workoutPlan = workoutPlan;
        this.healthData = healthData;
    }
*/
    public TrainingDTO(long id, LocalDate date, LocalDateTime date2, LocalTime startTime, LocalTime endTime, List<HealthDataDTO> healthData) {
        this.id = id;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.date2 = date2;
        this.healthData = healthData;
    }

    public TrainingDTO(long id, LocalDate date, LocalDateTime date2, LocalTime startTime, LocalTime endTime, WorkoutPlanDTO workoutPlan) {
        this.id = id;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.date2 = date2;
        this.workoutPlan = workoutPlan;
    }
}