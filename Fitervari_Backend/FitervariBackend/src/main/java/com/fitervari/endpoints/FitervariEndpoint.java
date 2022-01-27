package com.fitervari.endpoints;

import com.fitervari.repositories.FitervariRepository;

import javax.inject.Inject;
import javax.persistence.NoResultException;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/")
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
    @Produces(MediaType.APPLICATION_JSON)
    public Response getSpecificUser(@PathParam("userId") long id) {
        try {
            var user = repo.getUsers(id);
            return Response.ok(user).build();
        } catch(NoResultException e) {
            return Response.status(Response.Status.NOT_FOUND.getStatusCode(), "The user with the given id was not found!").build();
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
}