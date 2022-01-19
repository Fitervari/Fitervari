package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name="device")
@NamedQueries(
        @NamedQuery(name=Device.GETALL, query="SELECT d FROM device d")
)
public class Device implements Serializable {
    public static final String GETALL = "Device.GetAll";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="description")
    private String description;

    @ManyToOne
    private Studio studio;

    @ManyToOne
    private DeviceGroup deviceGroup;

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

    public Studio getStudio() {
        return studio;
    }

    public void setStudio(Studio studio) {
        this.studio = studio;
    }

    public DeviceGroup getDeviceGroup() {
        return deviceGroup;
    }

    public void setDeviceGroup(DeviceGroup deviceGroup) {
        this.deviceGroup = deviceGroup;
    }
}
