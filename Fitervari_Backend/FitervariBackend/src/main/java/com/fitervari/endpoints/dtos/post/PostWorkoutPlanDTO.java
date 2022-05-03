package com.fitervari.endpoints.dtos.post;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fitervari.endpoints.dtos.get.ExerciseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostWorkoutPlanDTO implements Serializable {
    private long id;
    private String name, description;

    //@JsonFormat(pattern = "yyyy-MM-ddTHH:mm:ss.SSSZ", timezone = "UTC")
    private Date validFrom, validTill;
    //@JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", timezone = "UTC")
    //private LocalDateTime validTill;
    private List<ExerciseDTO> exercises;
    private boolean archived;
}