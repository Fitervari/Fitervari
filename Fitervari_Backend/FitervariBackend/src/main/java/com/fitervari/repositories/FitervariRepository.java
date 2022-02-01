package com.fitervari.repositories;

import com.fitervari.endpoints.dtos.*;
import com.fitervari.model.Fitervari.*;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class FitervariRepository {

    @Inject
    EntityManager em;

    /*
        --------------------------------------------------------------
                                Users
        --------------------------------------------------------------
     */

    private StudioDTO getConvertedStudio(Studio studio) {
        var city = studio.getCity();
        var country = city.getCountry();
        var deviceGroups = studio.getDevices().stream().map(Device::getDeviceGroup).distinct().collect(Collectors.toList());
        return new StudioDTO(
                studio.getId(),
                studio.getName(),
                studio.getAddress(),
                new CityDTO(
                        city.getId(),
                        city.getPostalCode(),
                        city.getCity(),
                        new CountryDTO(country.getId(), country.getCode(), country.getName())
                ),
                deviceGroups.stream().map(dg -> new DeviceGroupDTO(dg.getId(), dg.getName(), dg.getDescription(), getConvertedDevices(dg))).collect(Collectors.toList())
        );
    }

    private List<DeviceDTO> getConvertedDevices(DeviceGroup dg) {
        return dg.getDevices().stream().map(d -> new DeviceDTO(d.getId(), d.getUniqueNumber())).collect(Collectors.toList());
    }

    private CityDTO getConvertedCity(City city) {
        var country = city.getCountry();
        return new CityDTO(city.getId(), city.getPostalCode(), city.getCity(), new CountryDTO(country.getId(), country.getCode(), country.getName()));
    }

    private List<ActivationCodeDTO> getConvertedActivationCodes(List<ActivationCode> codes) {
        return codes.stream().map(a -> new ActivationCodeDTO(a.getId(), a.getCode(), a.isValid())).collect(Collectors.toList());
    }

    public List<UserDTO> getUsers(Long id) throws NoResultException {
        if (id == null) {
            // Return all Users (Customers)
            var query = em.createQuery("SELECT c FROM customer c", Customer.class);
            var customers = query.getResultList();
            return customers.stream().map(c ->
                    new UserDTO(
                            c.getId(),
                            c.getFirstName(),
                            c.getLastName(),
                            c.getBirthDate(),
                            c.getAddress(),
                            c.getEmail(),
                            getConvertedStudio(c.getStudio()),
                            getConvertedCity(c.getCity()),
                            getConvertedActivationCodes(c.getActivationCodes()))
            ).collect(Collectors.toList());
        }

        // Return only the specific User
        var query = em.createQuery("SELECT c FROM customer c WHERE c.id = :id", Customer.class);
        query.setParameter("id", id);
        var customer = query.getSingleResult();

        return List.of(
            new UserDTO(
                    customer.getId(),
                    customer.getFirstName(),
                    customer.getLastName(),
                    customer.getBirthDate(),
                    customer.getAddress(),
                    customer.getEmail(),
                    getConvertedStudio(customer.getStudio()),
                    getConvertedCity(customer.getCity()),
                    getConvertedActivationCodes(customer.getActivationCodes())
            )
        );
    }

    /* TODO:
        --------------------------------------------------------------
                                TODO: Auth
TODO:   --------------------------------------------------------------
     */

    public String genAuthTokenFromActivationToken(String activationCode) {
        return "SAMPLE AUTH TOKEN";
    }

    public String getAuthTokenForTrainer(String username, String password) {
        return "SAMPLE AUTH TOKEN FOR TRAINER";
    }

    public String genActivationTokenForUser(long id) {
        return "SAMPLE ACTIVATION TOKEN FOR USER: " + id;
    }

    /*
        --------------------------------------------------------------
                                WorkoutPlans
        --------------------------------------------------------------
     */

    private WorkoutPlanDTO getConvertedWorkoutPlan(WorkoutPlan woP) {
        return new WorkoutPlanDTO(
                woP.getId(),
                woP.getValidFrom(),
                woP.getValidTill(),
                woP.getName(),
                woP.isArchived(),
                woP.getExercises().stream()
                        .sorted(Comparator.comparingInt(Exercise::getSortIdentifier))
                        .map(ex ->
                        new ExerciseDTO(
                                ex.getId(),
                                ex.getName(),
                                ex.getDescription(),
                                ex.getExerciseSets().stream()
                                        .sorted(Comparator.comparingInt(ExerciseSet::getSortIdentifier))
                                        .map(exS ->
                                        new ExerciseSetDTO(
                                                exS.getId(),
                                                exS.getDescription(),
                                                exS.getRepetitions()
                                        )
                                ).collect(Collectors.toList()),
                                new DeviceGroupDTO(
                                        ex.getDeviceGroup().getId(),
                                        ex.getDeviceGroup().getName(),
                                        ex.getDeviceGroup().getDescription(),
                                        getConvertedDevices(ex.getDeviceGroup())
                                )
                        )
                ).collect(Collectors.toList())
        );
    }

    private ExerciseSetDTO getConvertedExerciseSet(ExerciseSet wos) {
        return new ExerciseSetDTO(
                wos.getId(),
                wos.getDescription(),
                wos.getRepetitions()
        );
    }

    public List<WorkoutPlanDTO> getWorkoutPlansForSpecificUser(long id) {

        var query = em.createQuery("SELECT wp FROM workoutPlan wp WHERE customer.id = :id", WorkoutPlan.class);
        query.setParameter("id", id);
        var woPlans = query.getResultList();
        return woPlans.stream().map(this::getConvertedWorkoutPlan).collect(Collectors.toList());
    }

    public WorkoutPlanDTO getSpecificWorkoutPlan(long id) throws NoResultException {

        var query = em.createQuery("SELECT wp FROM workoutPlan wp WHERE wp.id = :id", WorkoutPlan.class);
        query.setParameter("id", id);

        var woP = query.getSingleResult();

        return getConvertedWorkoutPlan(woP);
    }

    public TrainingDTO getSpecificTraining(long id) throws NoResultException {
        var query = em.createQuery("SELECT t FROM training t WHERE t.id = :id", Training.class);
        query.setParameter("id", id);
        var t = query.getSingleResult();

        return new TrainingDTO(
                t.getId(),
                t.getDate(),
                getConvertedWorkoutPlan(t.getWorkoutPlan()),
                t.getHealthData().stream().map(h ->
                        new HealthDataDTO(
                                h.getId(),
                                h.getTime(),
                                h.getHealthDataType().getName(),
                                h.getValue(),
                                getConvertedExerciseSet(h.getExerciseSet())
                        )
                ).collect(Collectors.toList())
        );
    }

    public List<TrainingDTO> getTrainingsFromSpecificWorkoutPlan(long id) throws NoResultException {

        var query = em.createQuery("SELECT wop FROM workoutPlan wop WHERE wop.id = :id", WorkoutPlan.class);
        query.setParameter("id", id);

        var workoutPlan = query.getSingleResult();

        return workoutPlan.getTrainings().stream().map(t ->
                new TrainingDTO(
                        t.getId(),
                        t.getDate(),
                        t.getHealthData().stream().map(h ->
                                new HealthDataDTO(
                                        h.getId(),
                                        h.getTime(),
                                        h.getHealthDataType().getName(),
                                        h.getValue(),
                                        getConvertedExerciseSet(h.getExerciseSet())
                                )
                        ).collect(Collectors.toList())
                )
        ).collect(Collectors.toList());
    }

    /*
        --------------------------------------------------------------
                                Devices / DeviceGroups
        --------------------------------------------------------------
     */

    public List<DeviceDTO> getAllDevices() {
        var query = em.createQuery("SELECT d FROM device d", Device.class);
        var devices = query.getResultList();

        return devices.stream().map(d ->
                new DeviceDTO(
                        d.getId(),
                        d.getUniqueNumber()
                )
        ).collect(Collectors.toList());
    }

    public List<DeviceGroupDTO> getAllDeviceGroups() {
        var query = em.createQuery("SELECT dg FROM deviceGroup dg", DeviceGroup.class);
        var deviceGroups = query.getResultList();
        return deviceGroups.stream().map(dg ->
                new DeviceGroupDTO(
                        dg.getId(),
                        dg.getName(),
                        dg.getDescription(),
                        dg.getDevices().stream().map(d ->
                                new DeviceDTO(d.getId(), d.getUniqueNumber())
                        ).collect(Collectors.toList()))
                ).collect(Collectors.toList());
    }
}
