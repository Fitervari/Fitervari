package com.fitervari.endpoints.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainingDTO {

    private long id;
    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;
    private WorkoutPlanDTO workoutPlan;
    private List<HealthDataDTO> healthData;

    public TrainingDTO(long id, LocalDate date, LocalTime startTime, LocalTime endTime, List<HealthDataDTO> healthData) {
        this.id = id;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.healthData = healthData;
    }
}
