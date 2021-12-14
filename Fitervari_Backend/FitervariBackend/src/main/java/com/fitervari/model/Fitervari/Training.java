package com.fitervari.model.Fitervari;

import com.fitervari.model.FitervariHealth.HealthData;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity(name="training")
@NamedQueries(
        @NamedQuery(name=Training.GETONEBYID, query = "SELECT t FROM training t WHERE t.id=:id")
)
public class Training implements Serializable {

    public static final String GETONEBYID = "Training.GetOneById";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="date", nullable = false)
    private LocalDate date;

    @ManyToOne
    private WorkoutPlan workoutPlan;

    @OneToMany(mappedBy = "training")
    private List<HealthData> healthData;
}
