package com.fitervari.endpoints.dtos.put;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PutWorkoutPlanDTO implements Serializable {
    private boolean archived;
    private String name, description;
    private LocalDate validFrom, validTill;
    private long user;
}
