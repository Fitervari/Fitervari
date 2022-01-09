package com.fitervari.model.Fitervari;

import com.fitervari.model.FitervariHealth.HealthData;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="workoutSet")
@NamedQueries(
        @NamedQuery(name=WorkoutSet.GETONEBYID, query = "SELECT ws FROM workoutSet ws WHERE ws.id=:id")
)
public class WorkoutSet implements Serializable {

    public static final String GETONEBYID = "WorkoutSet.GetOneById";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="repetitions", nullable = false)
    private String repetitions;

    @Column(name="description")
    private String description;

    @Column(name="sort_identifier")
    private int sortIdentifier;

    @ManyToOne
    private Workout workout;

    @OneToMany(mappedBy = "workoutSet")
    private List<HealthData> healthData;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRepetitions() {
        return repetitions;
    }

    public void setRepetitions(String repetitions) {
        this.repetitions = repetitions;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Workout getWorkout() {
        return workout;
    }

    public void setWorkout(Workout workout) {
        this.workout = workout;
    }

    public List<HealthData> getHealthData() {
        return healthData;
    }

    public void setHealthData(List<HealthData> healthData) {
        this.healthData = healthData;
    }
}
