package com.fitervari.endpoints;

import com.fitervari.endpoints.dtos.HealthDataDTO;
import com.fitervari.endpoints.dtos.HealthDataTypeDTO;
import com.fitervari.endpoints.dtos.WorkoutSetDTO;
import com.fitervari.model.FitervariHealth.HealthData;
import com.fitervari.repositories.FitervariHealthRepository;
import org.jboss.resteasy.annotations.Body;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

@Path("/fitervari/healthdata")
@ApplicationScoped
public class FitervariHealthEndpoint {

    @Inject
    FitervariHealthRepository repo;

    @GET
    @Path("connection")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTestDataForConnectionTesting() {
        var healthData1 = new HealthDataDTO(
                69420L,
                LocalDateTime.now(),
                new HealthDataTypeDTO(4L, "Puls"),
                "127",
                new WorkoutSetDTO(420L, "20kg", "5")
        );

        var healthData2 = new HealthDataDTO(
                420L,
                LocalDateTime.now(),
                new HealthDataTypeDTO(2L, "Blutdruck"),
                "80",
                new WorkoutSetDTO(69L, "5kg", "15")
        );

        var healthData3 = new HealthDataDTO(
                69L,
                LocalDateTime.now(),
                new HealthDataTypeDTO(4L, "Puls"),
                "121",
                new WorkoutSetDTO(69L, "5kg", "15")
        );

        var healthDataList = new LinkedList<HealthDataDTO>();
        healthDataList.add(healthData1);
        healthDataList.add(healthData2);
        healthDataList.add(healthData3);

        return Response.ok(healthDataList).build();
    }


    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getDataForTrainingOrWorkoutSet(@DefaultValue("-1") @QueryParam("training") long training,
                                                   @DefaultValue("-1") @QueryParam("workoutSet") long workoutSet,
                                                   @DefaultValue("-1") @QueryParam("type") long type) {
        if(training == -1 && workoutSet == -1)
            return Response.status(
                    Response.Status.BAD_REQUEST.getStatusCode(),
                    "Neither training nor workoutSet specified! At least one of them needs to be specified."
                    ).build();

        List<HealthDataDTO> result = repo.getDataByCriteria(training, workoutSet, type);
        return Response.ok(result).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response postDataInDB(HealthData data) {
        return Response.ok().build();
    }


    /*@GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello Fitervari Health";
    }*/

    /*@GET
    @Path("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDataByUser(@QueryParam("id") Long id) {

        // TODO: RESPONSE: 200 (OK) / 400 (BAD REQUEST: Invalid user id)

        String response = "You received all the Health Data from the user: " + id;

        return Response.ok(response).build();
    }

    @GET
    @Path("user/{date}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDataByUser(@PathParam("date") LocalDate date) {

        // TODO: RESPONSE: 200 (OK) / 400 (BAD REQUEST)

        String response = "You received all the Health Data from the date: " + date;

        return Response.ok(response).build();
    }

    @POST
    @Path("user")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response addHealthDataForUser(String healthData) {

        // TODO: RESPONSE: 201 (CREATED) / 400 (BAD REQUEST: Invalid Input)

        String response = "You successfully added health data for the user: " + healthData;

        return Response.ok(response).build();
    }

    */


}
