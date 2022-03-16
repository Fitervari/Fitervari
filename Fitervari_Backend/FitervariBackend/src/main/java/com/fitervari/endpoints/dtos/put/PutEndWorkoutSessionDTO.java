package com.fitervari.endpoints.dtos.put;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PutEndWorkoutSessionDTO implements Serializable {
    private long sessionId;
    private LocalTime endTime;
}
