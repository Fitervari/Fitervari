package com.fitervari.repositories;

import com.fitervari.endpoints.dtos.DeviceDTO;
import com.fitervari.endpoints.dtos.DeviceGroupDTO;
import com.fitervari.model.Fitervari.Device;
import com.fitervari.model.Fitervari.DeviceGroup;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class FitervariRepository {

    @Inject
    EntityManager em;

    public List<DeviceGroupDTO> getAllDevices() {
        /*TypedQuery<Device> q = em.createNamedQuery(Device.GETALL, Device.class);
        var queryResult = q.getResultList();
        var deviceGroups = queryResult.stream().map(Device::getDeviceGroup).distinct().collect(Collectors.toList());

        for(Device d: queryResult) {
            var devices = deviceGroups.get(deviceGroups.indexOf(d.getDeviceGroup())).getDevices();
            if (!devices.contains(d)) {
                devices.add(d);
            }
        }

        return deviceGroups.stream().map(d -> new DeviceGroupDTO(d.getId(), d.getName(), d.getDevices().get(0).getDescription(), d.getDevices().stream().map(dev -> new DeviceDTO(dev.getId())).collect(Collectors.toList()))).collect(Collectors.toList());
        */
        var query = em.createNamedQuery(DeviceGroup.GETALL, DeviceGroup.class);
        var deviceGroups = query.getResultList();
        return deviceGroups.stream().map(dg ->
                new DeviceGroupDTO(
                        dg.getId(),
                        dg.getName(),
                        dg.getDescription(),
                        dg.getDevices().stream().map(d ->
                                new DeviceDTO(d.getUniqueNumber())
                        ).collect(Collectors.toList()))
                ).collect(Collectors.toList());
    }
}
