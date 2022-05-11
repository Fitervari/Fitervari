package com.fitervari.endpoints.dtos.put;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fitervari.endpoints.dtos.get.ExerciseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.json.bind.annotation.JsonbDateFormat;
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
    //@JsonbDateFormat(value = "yyyy-MM-dd hh:mm:ss")
    private LocalDate validFrom, validTill;
    private List<ExerciseDTO> exercises;
    //private long user;
}