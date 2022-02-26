package com.fitervari.endpoints.dtos.put;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PutDeviceGroupDTO implements Serializable {
    private String name, description;
}
