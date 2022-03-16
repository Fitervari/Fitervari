package com.fitervari.endpoints.dtos.get;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudioDTO implements Serializable {
    private long id;
    private String name;
    private String address;
    private CityDTO city;
    private List<DeviceGroupDTO> deviceGroups;
}
