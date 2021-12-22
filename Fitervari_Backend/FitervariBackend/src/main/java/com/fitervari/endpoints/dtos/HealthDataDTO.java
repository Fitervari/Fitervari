package com.fitervari.endpoints.dtos;

import java.io.Serializable;
import java.time.LocalDateTime;

public class HealthDataDTO implements Serializable {

    private long id;
    private LocalDateTime time;
    private HealthDataTypeDTO healthDataType;
    private String value;
    private WorkoutSetDTO workoutSet;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public HealthDataTypeDTO getHealthDataType() {
        return healthDataType;
    }

    public void setHealthDataType(HealthDataTypeDTO healthDataType) {
        this.healthDataType = healthDataType;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public WorkoutSetDTO getWorkoutSet() {
        return workoutSet;
    }

    public void setWorkoutSet(WorkoutSetDTO workoutSet) {
        this.workoutSet = workoutSet;
    }

    public HealthDataDTO(long id, LocalDateTime time, HealthDataTypeDTO hdtDto, String value, WorkoutSetDTO woSDTO) {
        this.id = id;
        this.time = time;
        this.healthDataType = hdtDto;
        this.value = value;
        this.workoutSet = woSDTO;
    }
}
