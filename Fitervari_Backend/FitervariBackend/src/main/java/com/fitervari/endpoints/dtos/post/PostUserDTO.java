package com.fitervari.endpoints.dtos.post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostUserDTO {
    private String activationToken, address, email, firstName, lastName;
    private long city, studio;
    private LocalDate birthDate;
}