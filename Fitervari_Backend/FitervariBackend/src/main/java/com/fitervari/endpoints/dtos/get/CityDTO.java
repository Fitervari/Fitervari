package com.fitervari.endpoints.dtos.get;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CityDTO implements Serializable {
    private long id;
    private String postalCode;
    private String city;
    private CountryDTO country;
}
