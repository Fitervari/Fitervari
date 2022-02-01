package com.fitervari.endpoints.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExerciseDTO implements Serializable {
    private long id;
    private String name, description;
    private List<ExerciseSetDTO> exerciseSets;
    private DeviceGroupDTO deviceGroups;
}
