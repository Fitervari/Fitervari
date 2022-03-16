package com.fitervari.endpoints.dtos.get;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthDataDTO implements Serializable {

    private long id;
    private LocalDateTime time;
    private String type;
    private double value;
    private ExerciseSetDTO exerciseSet;
}
