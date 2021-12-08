package com.fitervari.endpoints;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.LocalDate;

@Path("/fitervari/health")
public class FitervariHealthEndpoint {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello Fitervari Health";
    }

    @GET
    @Path("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDataByUser(@QueryParam("id") Long id) {

        // TODO: RESPONSE: 200 (OK) / 400 (BAD REQUEST: Invalid user id)

        String response = "You received all the Health Data from the user: " + id;

        return Response.ok(response).build();
    }

    /*@GET
    @Path("user/{date}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDataByUser(@PathParam("date") LocalDate date) {

        // TODO: RESPONSE: 200 (OK) / 400 (BAD REQUEST)

        String response = "You received all the Health Data from the date: " + date;

        return Response.ok(response).build();
    }*/

    @POST
    @Path("user")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response addHealthDataForUser(String healthData) {

        // TODO: RESPONSE: 201 (CREATED) / 400 (BAD REQUEST: Invalid Input)

        String response = "You successfully added health data for the user: " + healthData;

        return Response.ok(response).build();
    }


}
