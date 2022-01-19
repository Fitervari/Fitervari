package com.fitervari.model.FitervariHealth;

import javax.persistence.*;
import java.util.List;

@Entity(name="healthDataType")
@NamedQueries(
        @NamedQuery(name=HealthDataType.GETONEBYID, query = "SELECT t FROM healthDataType t WHERE t.id=:id")
)
public class HealthDataType {

    public static final String GETONEBYID = "HealthDataType.GetOneById";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "healthDataType")
    private List<HealthData> healthData;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<HealthData> getHealthData() {
        return healthData;
    }

    public void setHealthData(List<HealthData> healthData) {
        this.healthData = healthData;
    }
}
