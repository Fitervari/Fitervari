package com.fitervari.endpoints.dtos;

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
    //private HealthDataTypeDTO healthDataType;
    private String type;
    private String value;
    private ExerciseSetDTO exerciseSet;
}
