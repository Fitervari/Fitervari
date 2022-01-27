package com.fitervari.endpoints.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActivationCodeDTO implements Serializable {

    private long id;
    private String code;
    private boolean valid;
}
