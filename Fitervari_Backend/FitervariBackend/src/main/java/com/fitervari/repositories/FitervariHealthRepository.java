package com.fitervari.repositories;

import com.fitervari.endpoints.dtos.HealthDataDTO;
import com.fitervari.endpoints.dtos.HealthDataTypeDTO;
import com.fitervari.endpoints.dtos.PostHealthDataDTO;
import com.fitervari.endpoints.dtos.WorkoutSetDTO;
import com.fitervari.model.Fitervari.Training;
import com.fitervari.model.Fitervari.WorkoutSet;
import com.fitervari.model.FitervariHealth.HealthData;
import com.fitervari.model.FitervariHealth.HealthDataType;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
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

    @Transactional
    public int postHealthData(PostHealthDataDTO dto) {
        var healthType = getHealthType(dto.getType());
        var workoutSet = getWorkoutSet(dto.getWorkoutSet());
        var training = getTraining(dto.getTraining());

        if(healthType == null)
            return -1;
        if(workoutSet == null)
            return -2;
        if(training == null)
            return -3;
        var data = new HealthData(dto.getValue(), LocalDateTime.now(), healthType, workoutSet, training);

        em.persist(data);
        return 1;
    }

    private HealthDataType getHealthType(long id) {
        var tq = em.createNamedQuery(HealthDataType.GETONEBYID, HealthDataType.class);
        tq.setParameter("id", id);
        var healthDataType = tq.getResultList().stream().findFirst();
        if(healthDataType.isEmpty())
            return null;
        return healthDataType.get();
    }

    private WorkoutSet getWorkoutSet(long id) {
        var tq = em.createNamedQuery(WorkoutSet.GETONEBYID, WorkoutSet.class);
        tq.setParameter("id", id);
        var workoutSet = tq.getResultList().stream().findFirst();
        if(workoutSet.isEmpty())
            return null;
        return workoutSet.get();
    }

    private Training getTraining(long id) {
        var tq = em.createNamedQuery(Training.GETONEBYID, Training.class);
        tq.setParameter("id", id);
        var training = tq.getResultList().stream().findFirst();
        if(training.isEmpty())
            return null;
        return training.get();
    }
}
