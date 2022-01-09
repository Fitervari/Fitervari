package com.fitervari.model.Fitervari;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity(name="customer")
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

    @ManyToOne
    private Studio studio;

    @OneToMany(mappedBy = "customer")
    private List<WorkoutPlan> workoutPlans;

    @ManyToOne
    private City city;

    @OneToMany(mappedBy = "customer")
    private List<ActivationCode> activationCodes;
}
