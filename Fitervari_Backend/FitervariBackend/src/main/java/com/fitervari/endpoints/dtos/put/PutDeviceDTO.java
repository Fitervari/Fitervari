package com.fitervari.endpoints.dtos.put;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PutDeviceDTO implements Serializable {
    private String name, description;
    private int uniqueNumber;
    private long deviceGroup, studio;
}
