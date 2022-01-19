package com.fitervari.endpoints.dtos;

import java.io.Serializable;

public class PostHealthDataDTO implements Serializable {

    private long type;
    private String value;
    private long training;
    private long workoutSet;

    public long getType() {
        return type;
    }

    public void setType(long type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public long getTraining() {
        return training;
    }

    public void setTraining(long training) {
        this.training = training;
    }

    public long getWorkoutSet() {
        return workoutSet;
    }

    public void setWorkoutSet(long workoutSet) {
        this.workoutSet = workoutSet;
    }
}
