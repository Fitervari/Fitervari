package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name="deviceGroup")
@NamedQueries(
        @NamedQuery(name=DeviceGroup.GETALL, query="SELECT dg FROM deviceGroup dg")
)
public class DeviceGroup implements Serializable {
    public static final String GETALL = "DeviceGroup.GetAll";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="description")
    private String description;

    @OneToOne(mappedBy = "deviceGroup", fetch = FetchType.LAZY)
    private Workout workout;

    @OneToMany(mappedBy = "deviceGroup")
    private List<Device> devices;

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

    public List<Device> getDevices() {
        return devices;
    }

    public void setDevices(List<Device> devices) {
        this.devices = devices;
    }
}
