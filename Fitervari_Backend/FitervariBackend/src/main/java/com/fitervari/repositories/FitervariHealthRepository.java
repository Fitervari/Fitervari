package com.fitervari.repositories;

import com.fitervari.endpoints.dtos.HealthDataDTO;
import com.fitervari.endpoints.dtos.PostHealthDataDTO;
import com.fitervari.endpoints.dtos.ExerciseSetDTO;
import com.fitervari.model.Fitervari.Training;
import com.fitervari.model.Fitervari.ExerciseSet;
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

    public List<HealthDataDTO> getDataByCriteria(long training, long exerciseSet, long type) {
        TypedQuery<HealthData> healthDataTQ = em.createNamedQuery(HealthData.GETALLWITHCRITERIA, HealthData.class);

        healthDataTQ.setParameter("trainingsId", training);
        healthDataTQ.setParameter("exerciseSetId", exerciseSet);
        healthDataTQ.setParameter("type", type);

        var queryResult = healthDataTQ.getResultList();

        return queryResult.stream().map(d ->
                new HealthDataDTO(d.getId(),
                    d.getTime(),
                    d.getHealthDataType().getName(),
                    //new HealthDataTypeDTO(d.getHealthDataType().getId(), d.getHealthDataType().getName()),
                    d.getValue(),
                    new ExerciseSetDTO(d.getExerciseSet().getId(), d.getExerciseSet().getDescription(), d.getExerciseSet().getRepetitions())
        )).collect(Collectors.toList());
    }

    @Transactional
    public int postHealthData(PostHealthDataDTO dto) {
        var healthType = getHealthType(dto.getType());
        var exerciseSet = getWorkoutSet(dto.getExerciseSet());
        var training = getTraining(dto.getTraining());

        if(healthType == null)
            return -1;
        if(exerciseSet == null)
            return -2;
        if(training == null)
            return -3;
        var data = new HealthData(dto.getValue(), LocalDateTime.now(), healthType, exerciseSet, training);

        em.persist(data);
        return 1;
    }

    private HealthDataType getHealthType(long id) {
        var tq = em.createQuery("SELECT hdt FROM healthDataType hdt WHERE hdt.id = :id", HealthDataType.class);
        tq.setParameter("id", id);
        var healthDataType = tq.getResultList().stream().findFirst();
        if(healthDataType.isEmpty())
            return null;
        return healthDataType.get();
    }

    private ExerciseSet getWorkoutSet(long id) {
        var tq = em.createQuery("SELECT exs FROM exerciseSet exs WHERE exs.id = :id", ExerciseSet.class);
        tq.setParameter("id", id);
        var exerciseSet = tq.getResultList().stream().findFirst();
        if(exerciseSet.isEmpty())
            return null;
        return exerciseSet.get();
    }

    private Training getTraining(long id) {
        var tq = em.createQuery("SELECT t FROM training t WHERE t.id = :id", Training.class);
        tq.setParameter("id", id);
        var training = tq.getResultList().stream().findFirst();
        if(training.isEmpty())
            return null;
        return training.get();
    }
}
