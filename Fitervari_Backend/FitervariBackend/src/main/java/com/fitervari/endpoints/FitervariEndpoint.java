package com.fitervari.endpoints;

import com.fitervari.repositories.FitervariRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/")
public class FitervariEndpoint {

    @Inject
    FitervariRepository repo;

    @GET
    @Path("devices")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDevices() {
        var result = repo.getAllDevices();
        return Response.ok(result).build();
    }

    /*@GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello Fitervari";
    }

    /*
        --------------------------------------------------------------
                                Android/iOS APP
        --------------------------------------------------------------
     */
    /*@PUT
    @Path("users")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response alterUser(String user) {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You altered the user : " + user;

        return Response.ok(response).build();
    }

    /*
        --------------------------------------------------------------
                                  WebApp
        --------------------------------------------------------------
     */
    /*@GET
    @Path("users")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllUsers() {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You received all users";

        return Response.ok(response).build();
    }

    @GET
    @Path("token")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getNewTokenForUser(@QueryParam("user") Long id) {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You received a new token for the user: " + id;

        return Response.ok(response).build();
    }

    @PUT
    @Path("workoutPlans")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response alterWorkoutPlan(String workoutPlan) {

        // TODO: RESPONSE: 200 (OK) / 201 (CREATED) / 400 (BAD REQUEST: Invalid Input)

        String response = "You altered the workoutPlan: " + workoutPlan;

        return Response.ok(response).build();
    }

    @DELETE
    @Path("workoutPlans/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteWorkoutPlanById(@PathParam("id") Long id) {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You deleted the following workout plan: " + id;

        return Response.ok(response).build();
    }

    /*
        --------------------------------------------------------------
                                Android/iOS APP & WebApp
        --------------------------------------------------------------
     */
    /*@GET
    @Path("workoutPlans")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getWorkoutPlanByUser(@QueryParam("user") Long id) {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You received all workout plans for user: " + id;

        return Response.ok(response).build();
    }

    @GET
    @Path("workoutPlans/{id}")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getWorkoutPlanById(@PathParam("id") Long id) {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You received the workout plan with the id: " + id;

        return Response.ok(response).build();
    }

    @GET
    @Path("users/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getUserById(@PathParam("id") Long id) {

        // TODO: RESPONSE: 200 (OK) / 404 (NOT FOUND)

        String response = "You received the user with the id: " + id;

        return Response.ok(response).build();
    }

    /*
        --------------------------------------------------------------
                                Miscellaneous
        --------------------------------------------------------------
     */
}