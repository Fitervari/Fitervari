package com.fitervari.endpoints.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainingDTO {

    private long id;
    private LocalDate date;
    private WorkoutPlanDTO workoutPlan;
    private List<HealthDataDTO> healthData;

    public TrainingDTO(long id, LocalDate date, List<HealthDataDTO> healthData) {
        this.id = id;
        this.date = date;
        this.healthData = healthData;
    }
}
