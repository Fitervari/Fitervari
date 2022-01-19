package com.fitervari.endpoints;

import com.fitervari.endpoints.dtos.HealthDataDTO;
import com.fitervari.endpoints.dtos.HealthDataTypeDTO;
import com.fitervari.endpoints.dtos.PostHealthDataDTO;
import com.fitervari.endpoints.dtos.WorkoutSetDTO;
import com.fitervari.model.FitervariHealth.HealthData;
import com.fitervari.repositories.FitervariHealthRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

@Path("/healthdata")
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
    public Response postDataInDB(PostHealthDataDTO data) {
        var result = repo.postHealthData(data);
        switch(result) {
            case -1:
                return Response.status(Response.Status.BAD_REQUEST.getStatusCode(), "Wrong type specified").build();
            case -2:
                return Response.status(Response.Status.BAD_REQUEST.getStatusCode(), "Wrong workoutSet specified").build();
            case -3:
                return Response.status(Response.Status.BAD_REQUEST.getStatusCode(), "Wrong training specified").build();
            default:
                return Response.created(null).build();
        }
    }
}
