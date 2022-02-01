package com.fitervari.model.Fitervari;

import com.fitervari.model.FitervariHealth.HealthData;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity(name="training")
@Data
public class Training implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="date", nullable = false)
    private LocalDate date;

    @Column(name="startTime", nullable = false)
    private LocalTime startTime;

    @Column(name="endTime", nullable = false)
    private LocalTime endTime;

    @ManyToOne
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "training")
    private List<HealthData> healthData;
}
