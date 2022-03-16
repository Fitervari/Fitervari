package com.fitervari.repositories;

import com.fitervari.endpoints.dtos.get.*;
import com.fitervari.endpoints.dtos.post.PostDeviceDTO;
import com.fitervari.endpoints.dtos.post.PostStartWorkoutSessionDTO;
import com.fitervari.endpoints.dtos.post.PostUserDTO;
import com.fitervari.endpoints.dtos.post.PostWorkoutPlanDTO;
import com.fitervari.endpoints.dtos.put.*;
import com.fitervari.model.fitervari.*;
import io.vertx.ext.auth.User;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
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

    /*private List<ActivationCodeDTO> getConvertedActivationCodes(List<ActivationCode> codes) {
        return codes.stream().map(a -> new ActivationCodeDTO(a.getId(), a.getCode(), a.isValid())).collect(Collectors.toList());
    }*/

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
                            c.getAuthToken(),
                            c.getActivationToken())
                            //getConvertedActivationCodes(c.getActivationCodes()))
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
                    customer.getAuthToken(),
                    customer.getActivationToken()
                    //getConvertedActivationCodes(customer.getActivationCodes())
            )
        );
    }

    @Transactional
    public Customer updateUser(long id, PutUserDTO newUser) throws NoResultException {
        var cityQuery = em.createQuery("SELECT c FROM city c WHERE c.id=:id", City.class);
        cityQuery.setParameter("id", newUser.getCity());
        var city = cityQuery.getSingleResult();

        var studioQuery = em.createQuery("SELECT s FROM studio s WHERE s.id=:id", Studio.class);
        studioQuery.setParameter("id", newUser.getStudio());
        var studio = studioQuery.getSingleResult();

        var userQuery = em.createQuery("SELECT c FROM customer c WHERE c.id=:id", Customer.class);
        userQuery.setParameter("id", id);
        var user = userQuery.getSingleResult();


        user.setFirstName(newUser.getFirstName());
        user.setLastName(newUser.getLastName());
        user.setAddress(newUser.getAddress());
        user.setCity(city);
        user.setStudio(studio);

        em.merge(user);

        return user;
    }

    @Transactional
    public Customer deleteUser(long id) throws NoResultException {
        var userQuery = em.createQuery("SELECT c FROM customer c WHERE c.id=:id", Customer.class);
        userQuery.setParameter("id", id);
        var user = userQuery.getSingleResult();

        em.remove(user);

        return user;
    }

    @Transactional
    public UserDTO activateUser(PostUserDTO user) throws NoResultException {

        var cityQuery = em.createQuery("SELECT c FROM city c WHERE c.id=:id", City.class);
        cityQuery.setParameter("id", user.getCity());
        var city = cityQuery.getSingleResult();

        var studioQuery = em.createQuery("SELECT s FROM studio s WHERE s.id=:id", Studio.class);
        studioQuery.setParameter("id", user.getStudio());
        var studio = studioQuery.getSingleResult();

        var customer = new Customer(user.getFirstName(), user.getLastName(), user.getEmail(), user.getAddress(), user.getBirthDate(), user.getActivationToken(), studio, city);

        em.persist(customer);

        return new UserDTO(customer.getId(), customer.getFirstName(), customer.getLastName(), customer.getBirthDate(), customer.getAddress(), customer.getEmail(), getConvertedStudio(customer.getStudio()), getConvertedCity(customer.getCity()), customer.getAuthToken(), customer.getActivationToken());
    }

    /* TODO:
        --------------------------------------------------------------
                                TODO: Auth
TODO:   --------------------------------------------------------------
     */

    private String genToken(int length) {
        int leftLimit = 48; // numeral '0'
        int rightLimit = 90; // letter 'Z'
        Random random = new Random();

        return random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65))
                .limit(length)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
    }

    private String genAuthToken(String activationToken) {
        var firstSegmentStart = ThreadLocalRandom.current().nextInt(0, 9);
        var firstSegmentEnd = ThreadLocalRandom.current().nextInt(9, 17);
        var secondSegmentStart = ThreadLocalRandom.current().nextInt(17, 25);
        var secondSegmentEnd = ThreadLocalRandom.current().nextInt(25, 33);

        return activationToken.substring(firstSegmentStart, firstSegmentEnd)
                + genToken(32 - (firstSegmentEnd - firstSegmentStart) - (secondSegmentEnd - secondSegmentStart))
                + activationToken.substring(secondSegmentStart, secondSegmentEnd);
    }

    @Transactional
    public String genAuthTokenFromActivationToken(String activationCode) throws NoResultException {

        var customerQuery = em.createQuery("SELECT c FROM customer c WHERE c.activationToken=:activationToken", Customer.class);
        customerQuery.setParameter("activationToken", activationCode);

        var customer = customerQuery.getSingleResult();

        var authToken = genAuthToken(activationCode);

        var authTokenAlreadyExists = em.createQuery(String.format("SELECT c FROM customer c WHERE c.authToken='%s'", authToken), Customer.class).getResultList().size() > 0;

        while(authTokenAlreadyExists) {
            authToken = genAuthToken(activationCode);
            authTokenAlreadyExists = em.createQuery(String.format("SELECT c FROM customer c WHERE c.authToken='%s'", authToken), Customer.class).getResultList().size() > 0;
        }

        customer.setAuthToken(authToken);

        em.merge(customer);

        return authToken;
    }

    @Transactional
    public String getAuthTokenForTrainer(String username, String password) {
        return "SAMPLE AUTH TOKEN FOR TRAINER";
    }

    @Transactional
    public String genActivationTokenForUser(long id) throws NoResultException {

        var customerQuery = em.createQuery("SELECT c FROM customer c WHERE c.id=:id", Customer.class);
        customerQuery.setParameter("id", id);

        var customer = customerQuery.getSingleResult();

        var token = genToken(32);

        var tokenAlreadyExists = em.createQuery(String.format("SELECT c FROM customer c WHERE c.activationToken='%s'", token), Customer.class).getResultList().size() > 0;

        while(tokenAlreadyExists) {
            token = genToken(32);
            tokenAlreadyExists = em.createQuery(String.format("SELECT c FROM customer c WHERE c.activationToken='%s'", token), Customer.class).getResultList().size() > 0;
        }

        customer.setActivationToken(token);
        customer.setAuthToken(null);

        em.merge(customer);

        return token;
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

    private TrainingDTO getConvertedTraining(Training training) {
        return new TrainingDTO(
                training.getId(),
                training.getDate(),
                training.getStartTime(),
                training.getEndTime(),
                getConvertedWorkoutPlan(training.getWorkoutPlan())
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
                t.getStartTime(),
                t.getEndTime(),
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
                        t.getStartTime(),
                        t.getEndTime(),
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

    @Transactional
    public WorkoutPlan addWorkoutPlanForUser(long userId, PostWorkoutPlanDTO workoutPlan) throws NoResultException {
        var customerQuery = em.createQuery("SELECT c FROM customer c WHERE c.id =:id", Customer.class);

        customerQuery.setParameter("id", userId);

        var user = customerQuery.getSingleResult();

        var exercises = new LinkedList<Exercise>();

        var i = 0;

        for (var exercise : workoutPlan.getExercises()) {
            exercises.add(new Exercise(
                    exercise.getId(),
                    exercise.getName(),
                    exercise.getDescription(),
                    i,
                    new DeviceGroup(
                            exercise.getDeviceGroup().getId(),
                            exercise.getDeviceGroup().getName(),
                            exercise.getDeviceGroup().getDescription(),
                            exercise.getDeviceGroup().getDevices().stream().map(d ->
                                    new Device(d.getId(), d.getUniqueNumber())
                            ).collect(Collectors.toList())
                    )
            ));
            i++;
        }

        var newWorkoutPlan = new WorkoutPlan(
                workoutPlan.getValidFrom(),
                workoutPlan.getValidTo(),
                workoutPlan.getName(),
                workoutPlan.getDescription(),
                workoutPlan.isArchived(),
                user,
                exercises
        );

        em.persist(newWorkoutPlan);
        return newWorkoutPlan;
    }

    @Transactional
    public TrainingDTO addWorkoutSessionForWorkoutPlan(long wopId, PostStartWorkoutSessionDTO wos) throws NoResultException {
        var workoutPlanQuery = em.createQuery("SELECT wp FROM workoutPlan wp WHERE wp.id = :id", WorkoutPlan.class);
        workoutPlanQuery.setParameter("id", wopId);

        var woP = workoutPlanQuery.getSingleResult();

        var training = new Training(wos.getDate(), wos.getStartTime(), woP);
        em.persist(training);

        return getConvertedTraining(training);
    }

    @Transactional
    public TrainingDTO updateWorkoutSessionForWorkoutPlan(PutEndWorkoutSessionDTO wos) throws NoResultException {
        var trainingQuery = em.createQuery("SELECT t FROM training t where t.id=:id", Training.class);
        trainingQuery.setParameter("id", wos.getSessionId());

        var training = trainingQuery.getSingleResult();
        training.setEndTime(wos.getEndTime());

        em.merge(training);

        return getConvertedTraining(training);
    }

    @Transactional
    public WorkoutPlan updateWorkoutPlan(long id, PutWorkoutPlanDTO newWop) throws NoResultException {
        var userQuery = em.createQuery("SELECT c FROM customer c WHERE c.id=:id", Customer.class);
        userQuery.setParameter("id", newWop.getUser());
        var user = userQuery.getSingleResult();

        var wopQuery = em.createQuery("SELECT w FROM workoutPlan w WHERE w.id=:id", WorkoutPlan.class);
        wopQuery.setParameter("id", id);
        var wop = wopQuery.getSingleResult();

        wop.setArchived(newWop.isArchived());
        wop.setName(newWop.getName());
        wop.setDescription(newWop.getDescription());
        wop.setValidFrom(newWop.getValidFrom());
        wop.setValidTill(newWop.getValidTill());
        wop.setCustomer(user);

        em.merge(wop);

        return wop;
    }

    @Transactional
    public Training deleteWorkoutSession(long id) throws NoResultException {
        var tQuery = em.createQuery("SELECT t FROM training t WHERE t.id=:id", Training.class);
        tQuery.setParameter("id", id);
        var training = tQuery.getSingleResult();

        em.remove(training);

        return training;
    }

    @Transactional
    public WorkoutPlan deleteWorkoutPlan(long id) throws NoResultException {
        var wopQuery = em.createQuery("SELECT wop FROM workoutPlan wop WHERE wop.id=:id", WorkoutPlan.class);
        wopQuery.setParameter("id", id);
        var workoutPlan = wopQuery.getSingleResult();

        em.remove(workoutPlan);

        return workoutPlan;
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

    @Transactional
    public Device addDevice(PostDeviceDTO postDevice) throws NoResultException {
        var studioQuery = em.createQuery("SELECT s FROM studio s WHERE s.id=:sId", Studio.class);
        var deviceGroupQuery = em.createQuery("SELECT dg FROM deviceGroup dg WHERE dg.id=:dgId", DeviceGroup.class);

        studioQuery.setParameter("sId", postDevice.getStudioId());
        deviceGroupQuery.setParameter("dgId", postDevice.getDeviceGroupId());

        var studio = studioQuery.getSingleResult();
        var deviceGroup = deviceGroupQuery.getSingleResult();

        var device = new Device(
                postDevice.getName(),
                postDevice.getDescription(),
                postDevice.getUniqueNumber(),
                studio,
                deviceGroup
        );

        em.persist(device);

        return device;
    }

    @Transactional
    public Device updateDevice(long id, PutDeviceDTO device) throws NoResultException {
        var deviceGroupQuery = em.createQuery("SELECT dg FROM deviceGroup dg WHERE dg.id=:id", DeviceGroup.class);
        deviceGroupQuery.setParameter("id", device.getDeviceGroup());
        var dg = deviceGroupQuery.getSingleResult();

        var studioQuery = em.createQuery("SELECT s FROM studio s WHERE s.id=:id", Studio.class);
        studioQuery.setParameter("id", device.getStudio());
        var studio = studioQuery.getSingleResult();

        var currentQuery = em.createQuery("SELECT d FROM device d WHERE d.id=:id", Device.class);
        currentQuery.setParameter("id", id);
        var current = currentQuery.getSingleResult();

        current.setDescription(device.getDescription());
        current.setName(device.getName());
        current.setUniqueNumber(device.getUniqueNumber());
        current.setDeviceGroup(dg);
        current.setStudio(studio);

        em.merge(current);

        return current;
    }

    @Transactional
    public DeviceGroup updateDeviceGroup(long id, PutDeviceGroupDTO deviceGroup) throws NoResultException {
        var dgQuery = em.createQuery("SELECT dg FROM deviceGroup dg WHERE dg.id=:id", DeviceGroup.class);
        dgQuery.setParameter("id", id);
        var dg = dgQuery.getSingleResult();

        dg.setDescription(deviceGroup.getDescription());
        dg.setName(deviceGroup.getName());

        em.merge(dg);

        return dg;
    }

    @Transactional
    public Device deleteDevice(long id) throws NoResultException {
        var dQuery = em.createQuery("SELECT d FROM device d WHERE d.id=:id", Device.class);
        dQuery.setParameter("id", id);
        var device = dQuery.getSingleResult();

        em.remove(device);

        return device;
    }

    @Transactional
    public DeviceGroup deleteDeviceGroup(long id) throws NoResultException {
        var dgQuery = em.createQuery("SELECT dg FROM deviceGroup dg WHERE dg.id=:id", DeviceGroup.class);
        dgQuery.setParameter("id", id);
        var dg = dgQuery.getSingleResult();

        em.remove(dg);

        return dg;
    }
}