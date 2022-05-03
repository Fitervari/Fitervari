package com.fitervari.endpoints.dtos.put;

import com.fitervari.endpoints.dtos.get.ExerciseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PutWorkoutPlanDTO implements Serializable {
    private boolean archived;
    private String name, description;
    private Date validFrom, validTill;
    private List<ExerciseDTO> exercises;
    //private long user;
}