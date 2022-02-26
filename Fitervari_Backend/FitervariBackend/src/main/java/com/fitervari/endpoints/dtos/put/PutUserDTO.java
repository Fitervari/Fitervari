package com.fitervari.endpoints.dtos.put;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PutUserDTO implements Serializable {
    private String firstName, lastName, email, address;
    private long city, studio;
}
