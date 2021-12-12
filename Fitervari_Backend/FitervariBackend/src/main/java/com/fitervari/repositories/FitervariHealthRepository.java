package com.fitervari.repositories;

import com.fitervari.endpoints.dtos.HealthDataDTO;
import com.fitervari.endpoints.dtos.HealthDataTypeDTO;
import com.fitervari.endpoints.dtos.WorkoutSetDTO;
import com.fitervari.model.FitervariHealth.HealthData;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class FitervariHealthRepository {

    @Inject
    EntityManager em;

    public List<HealthDataDTO> getDataByCriteria(long training, long workoutSet, long type) {
        TypedQuery<HealthData> healthDataTQ = em.createNamedQuery(HealthData.GETALLWITHCRITERIA, HealthData.class);

        healthDataTQ.setParameter("trainingsId", training);
        healthDataTQ.setParameter("workoutSetId", workoutSet);
        healthDataTQ.setParameter("type", type);

        var queryResult = healthDataTQ.getResultList();

        var result = queryResult.stream().map(d ->
                new HealthDataDTO(d.getId(),
                    d.getTime(),
                    new HealthDataTypeDTO(d.getHealthDataType().getId(), d.getHealthDataType().getName()),
                    d.getValue(),
                    new WorkoutSetDTO(d.getWorkoutSet().getId(), d.getWorkoutSet().getDescription(), d.getWorkoutSet().getRepetitions())
        )).collect(Collectors.toList());

        return result;
    }
}
