package com.fitervari.endpoints.dtos.post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostStartWorkoutSessionDTO implements Serializable {
    private LocalDate date;
    private LocalTime startTime;
}
