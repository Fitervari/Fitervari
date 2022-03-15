package com.fitervari.endpoints;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.awt.geom.Line2D;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/health/{uniqueId}")
@ApplicationScoped
public class HealthWebsocket {

    Map<String, List<Session>> sessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("uniqueId") String uniqueId) {

        if(sessions.containsKey(uniqueId)) {
            sessions.get(uniqueId).add(session);
            return;
        }

        var list = new LinkedList<Session>();
        list.add(session);

        sessions.put(uniqueId, list);
    }

    @OnClose
    public void onClose(Session session, @PathParam("uniqueId") String uniqueId) {
        sessions.get(uniqueId).remove(session);
    }

    @OnError
    public void onError(Session session, @PathParam("uniqueId") String uniqueId, Throwable throwable) {
        sessions.remove(uniqueId);
        broadcast("User " + uniqueId + " left on error: " + throwable);
    }

    @OnMessage
    public void onMessage(String message, @PathParam("uniqueId") String uniqueId) {
        sessions.get(uniqueId).forEach(s ->
                s.getAsyncRemote().sendObject(message, result -> {
                    if (result.getException() != null) {
                        System.out.println("Unable to send message: " + result.getException());
                    }
                })
        );
    }

    private void broadcast(String message) {
        sessions.values().forEach(s -> {
            s.forEach(session -> {
                session.getAsyncRemote().sendObject(message, result -> {
                    if (result.getException() != null) {
                        System.out.println("Unable to send message: " + result.getException());
                    }
                });
            });
        });
    }
}