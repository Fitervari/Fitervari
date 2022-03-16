package com.fitervari.model.fitervari;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity(name="customer")
@Data
public class Customer implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private long id;

    @Column(name="firstname", nullable = false)
    private String firstName;

    @Column(name="lastname", nullable = false)
    private String lastName;

    @Column(name="birthdate", nullable = false)
    private LocalDate birthDate;

    @Column(name="address", nullable = false)
    private String address;

    @Column(name="email")
    private String email;

    @Column(name="auth_token")
    private String authToken;

    @Column(name="activation_token")
    private String activationToken;

    @ManyToOne
    private Studio studio;

    @OneToMany(mappedBy = "customer")
    private List<WorkoutPlan> workoutPlans;

    @ManyToOne
    private City city;

    /*@OneToMany(mappedBy = "customer")
    private List<ActivationCode> activationCodes;*/

    public Customer() {

    }

    public Customer(String firstName, String lastName, String email, String address, LocalDate birthDate, String activationToken, Studio studio, City city) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.address = address;
        this.birthDate = birthDate;
        this.activationToken = activationToken;
        this.studio = studio;
        this.city = city;
    }
}