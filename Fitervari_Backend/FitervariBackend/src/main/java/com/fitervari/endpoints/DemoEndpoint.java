package com.fitervari.endpoints;

import com.fitervari.model.DemoModel;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/demo")
public class DemoEndpoint {

    public DemoModel demoData = null;

    @GET
    @Path("/hello")
    public String sayHello() {
        return "Hello";
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public DemoModel getData() {
        return demoData;
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public Response receiveDemoData(DemoModel body) {
        this.demoData = body;
        return Response.ok(body).build();
    }
}
