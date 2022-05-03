package com.fitervari.endpoints.dtos.post;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PostHealthDataDTO implements Serializable {

    private long type;
    private LocalDateTime time;
    private double value;
    private long training;
    private long exerciseSet;
}