package com.fitervari.endpoints.dtos.post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostDeviceDTO implements Serializable {
    private String name, description;
    private int uniqueNumber;
    private long deviceGroupId, studioId;
}
