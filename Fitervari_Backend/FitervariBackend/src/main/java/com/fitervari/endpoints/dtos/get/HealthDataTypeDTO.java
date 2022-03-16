package com.fitervari.endpoints.dtos.get;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthDataTypeDTO implements Serializable {

    private long id;
    private String name;
}
