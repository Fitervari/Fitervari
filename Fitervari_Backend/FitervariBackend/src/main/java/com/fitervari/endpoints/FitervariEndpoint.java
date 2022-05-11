package com.fitervari.endpoints;

import com.fitervari.endpoints.dtos.post.*;
import com.fitervari.endpoints.dtos.put.*;
import com.fitervari.model.fitervari.*;
import com.fitervari.repositories.FitervariRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.NoResultException;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.net.URI;
import java.net.URISyntaxException;

@Path("/")
@ApplicationScoped
public class FitervariEndpoint {

    @Inject
    FitervariRepository repo;

    /*
        --------------------------------------------------------------
                                Users
        --------------------------------------------------------------
     */

    @GET
    @Path("users")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllUsers() {
        var users = repo.getUsers(null);
        return Response.ok(users).build();
    }

    @GET
    @Path("users/{userId}")
    @Produces({MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN})
    public Response getSpecificUser(@PathParam("userId") long id) {
        try {
            var user = repo.getUsers(id);
            return Response.ok(user).build();
        } catch(NoResultException e) {
            return Response.status(Response.Status.NOT_FOUND).entity("The user with the given ID was not found!").build();
        }
    }

    @GET
    @Path("users/{userId}/workoutSessions")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getWorkoutSessionsForUser(@PathParam("userId") long userId, @DefaultValue("-1") @QueryParam("month") int month, @DefaultValue("-1") @QueryParam("year") int year) {
        var sessions = repo.getTrainingsForUser(userId, month, year);
        return Response.ok(sessions).build();
    }

    @PUT
    @Path("users/{userId}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateUser(@PathParam("userId") long userId, PutUserDTO user) {
        var result = repo.updateUser(userId, user);
        return Response.noContent().build();
    }

    @DELETE
    @Path("users/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteUser(@PathParam("userId") long id){
        var user = repo.deleteUser(id);
        return Response.ok(user).build();
    }

    @POST
    @Path("users")
    @Produces(MediaType.TEXT_PLAIN)
    public Response activateUser(PostUserDTO user) {
        try {
            var response = repo.activateUser(user);
            return Response.created(new URI("/users/" + response.getId())).build();
        } catch(NoResultException ex) {
            return Response.status(Response.Status.NOT_FOUND).entity("Ether studio or city is invalid!").build();
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }
    }

    /*
        --------------------------------------------------------------
                                Auth
        --------------------------------------------------------------
     */

    @GET
    @Path("authToken")
    @Produces(MediaType.APPLICATION_JSON)
    public Response genAuthTokenFromActivationToken(@QueryParam("activationToken") String activationToken) {
        var token = repo.genAuthTokenFromActivationToken(activationToken);
        return Response.ok(token).build();
    }

    @GET
    @Path("adminToken")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAuthTokenForTrainer(@QueryParam("username") String username, @QueryParam("password") String password) {
        var token = repo.getAuthTokenForTrainer(username, password);
        return Response.ok(token).build();
    }

    @GET
    @Path("users/{userId}/activationToken")
    @Produces(MediaType.APPLICATION_JSON)
    public Response generateActivationTokenForUser(@PathParam("userId") long id) {
        var token = repo.genActivationTokenForUser(id);
        return Response.ok(token).build();
    }

    @GET
    @Path("auth/{activationToken}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response activateUser(@PathParam("activationToken") String token) {
        var user = repo.resolveUser(token);
        return Response.ok(user).build();
    }

    @POST
    @Path("auth/trainer")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response authenticateUser(Trainer trainerObj) {
        var trainer = repo.validateTrainer(trainerObj.getUsername(), trainerObj.getPassword());

        if(trainer == null)
            return Response.status(Response.Status.FORBIDDEN).build();

        return Response.ok(trainer).build();
    }



    /*
        --------------------------------------------------------------
                                WorkoutPlans
        --------------------------------------------------------------
     */

    @GET
    @Path("users/{userId}/workoutPlans")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getWorkoutPlansFromSpecificUser(@PathParam("userId") long id) {
        var workoutPlans = repo.getWorkoutPlansForSpecificUser(id);
        return Response.ok(workoutPlans).build();
    }

    @GET
    @Path("workoutPlans/{workoutPlanId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getSpecificWorkoutPlan(@PathParam("workoutPlanId") long id) {
        try {
            var workoutPlan = repo.getSpecificWorkoutPlan(id);
            return Response.ok(workoutPlan).build();
        } catch(NoResultException e) {
            return Response.status(Response.Status.NOT_FOUND.getStatusCode(), "The workoutPlan with the given id was not found!").build();
        }
    }

    @GET
    @Path("workoutPlans/{workoutPlanId}/workoutSessions")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getWorkoutSessionsForSpecificWorkoutPlan(@PathParam("workoutPlanId") long id) {
        try {
            var trainings = repo.getTrainingsFromSpecificWorkoutPlan(id);
            return Response.ok(trainings).build();
        } catch (NoResultException e) {
            return Response.status(Response.Status.NOT_FOUND.getStatusCode(), "The specified workout plan id is invalid!").build();
        }
    }

    @GET
    @Path("workoutSessions/{workoutSessionId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getSpecificWorkoutSession(@PathParam("workoutSessionId") long id) {
        try {
            var training = repo.getSpecificTraining(id);
            return Response.ok(training).build();
        } catch(NoResultException e) {
            return Response.status(Response.Status.NOT_FOUND.getStatusCode(), "The session with the given id was not found!").build();
        }
    }

    @POST
    @Path("users/{userId}/workoutPlans")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addWorkoutPlanForUser(@PathParam("userId") long id, PostWorkoutPlanDTO workoutPlan) {
        var result = repo.addWorkoutPlanForUser(id, workoutPlan);
        return Response.status(Response.Status.CREATED).entity(result).build();
    }

    @POST
    @Path("workoutPlans/{workoutPlanId}/workoutSessions")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addWorkoutSessionForWorkoutPlan(@PathParam("workoutPlanId") long id, PostStartWorkoutSessionDTO wos) {
        var result = repo.addWorkoutSessionForWorkoutPlan(id, wos);
        return Response.status(Response.Status.CREATED).entity(result).build();
    }

    @PUT
    @Path("workoutPlans/{workoutPlanId}/workoutSessions")
    @Produces(MediaType.TEXT_PLAIN)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response endTraining(@PathParam("workoutPlanId") long id, PutEndWorkoutSessionDTO wos) {
        var result = repo.updateWorkoutSessionForWorkoutPlan(wos);
        return Response.status(Response.Status.NO_CONTENT).build();
    }

    @PUT
    @Path("workoutPlans/{workoutPlanId}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateWorkoutPlan(@PathParam("workoutPlanId") long id, PutWorkoutPlanDTO wop) {
        var result = repo.updateWorkoutPlan(id, wop);
        return Response.noContent().build();
    }

    @DELETE
    @Path("workoutPlans/{workoutPlanId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteWorkoutPlan(@PathParam("workoutPlanId") long id) {
        var wop = repo.deleteWorkoutPlan(id);
        return Response.ok(wop).build();
    }

    @DELETE
    @Path("workoutSessions/{workoutSessionId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteWorkoutSession(@PathParam("workoutSessionId") long id) {
        var wos = repo.deleteWorkoutSession(id);
        return Response.ok(wos).build();
    }

    /*
        --------------------------------------------------------------
                                Devices / DeviceGroups
        --------------------------------------------------------------
     */

    @GET
    @Path("devices")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDevices() {
        var devices = repo.getAllDevices();
        return Response.ok(devices).build();
    }

    @GET
    @Path("deviceGroups")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDeviceGroups() {
        var deviceGroups = repo.getAllDeviceGroups();
        return Response.ok(deviceGroups).build();
    }

    @POST
    @Path("devices")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addDevice(PostDeviceDTO postDevice) {
        var result = repo.addDevice(postDevice);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("devices/{deviceId}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateDevice(@PathParam("deviceId") long id, PutDeviceDTO device) {
        var result = repo.updateDevice(id, device);
        return Response.noContent().build();
    }

    @PUT
    @Path("deviceGroups/{deviceGroupId}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateDeviceGroup(@PathParam("deviceGroupId") long id, PutDeviceGroupDTO deviceGroup) {
        var result = repo.updateDeviceGroup(id, deviceGroup);
        return Response.noContent().build();
    }

    @POST
    @Path("deviceGroups")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response insertDeviceGroup(PostDeviceGroupDTO deviceGroup) {
        var newDeviceGroup = repo.addDeviceGroup(deviceGroup);

        return Response.status(Response.Status.CREATED).entity(newDeviceGroup).build();
    }

    @DELETE
    @Path("devices/{deviceId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteDevice(@PathParam("deviceId") long id) {
        var device = repo.deleteDevice(id);
        return Response.ok(device).build();
    }

    @DELETE
    @Path("deviceGroups/{deviceGroupId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteDeviceGroup(@PathParam("deviceGroupId") long id) {
        var deviceGroup = repo.deleteDeviceGroup(id);
        return Response.ok(deviceGroup).build();
    }
}