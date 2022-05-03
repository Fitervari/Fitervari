package com.fitervari.endpoints.dtos.post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostDeviceGroupDTO implements Serializable {
    private long id;
    private String name, description;
}