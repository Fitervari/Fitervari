package com.fitervari.endpoints.dtos.get;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkoutPlanDTO implements Serializable {
    private long id;
    private LocalDate validFrom;
    private LocalDate validTill;
    private String name;
    private boolean archived;
    private List<ExerciseDTO> exercises;
}
