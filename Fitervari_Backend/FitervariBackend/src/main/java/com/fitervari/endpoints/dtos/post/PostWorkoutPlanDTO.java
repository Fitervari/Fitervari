package com.fitervari.endpoints.dtos.post;

import com.fitervari.endpoints.dtos.get.ExerciseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostWorkoutPlanDTO implements Serializable {
    private String name, description;
    private LocalDate validFrom, validTo;
    private List<ExerciseDTO> exercises;
    private boolean archived;
}
