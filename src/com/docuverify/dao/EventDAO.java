package com.docuverify.dao;

import com.docuverify.model.Event;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        String sql = "SELECT * FROM events ORDER BY event_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Event e = new Event();
                e.setId(rs.getInt("id"));
                e.setEventName(rs.getString("event_name"));
                e.setCategory(rs.getString("category"));
                e.setEventDate(rs.getDate("event_date"));
                e.setCoordinatorName(rs.getString("coordinator_name"));
                e.setDescription(rs.getString("description"));
                events.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public List<Event> getEventsByCategory(String category) {
        List<Event> events = new ArrayList<>();
        String sql = "SELECT * FROM events WHERE category = ? ORDER BY event_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Event e = new Event();
                e.setId(rs.getInt("id"));
                e.setEventName(rs.getString("event_name"));
                e.setCategory(rs.getString("category"));
                e.setEventDate(rs.getDate("event_date"));
                e.setCoordinatorName(rs.getString("coordinator_name"));
                e.setDescription(rs.getString("description"));
                events.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }
}
