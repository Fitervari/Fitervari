package com.fitervari.endpoints.dtos.post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PostHealthDataDTO implements Serializable {

    private long type;
    private long value;
    private long training;
    private long exerciseSet;
}
