package com.docuverify.model;

import java.sql.Date;

/**
 * Event model representing official college events
 */
public class Event {
    private int id;
    private String eventName;
    private String category;
    private Date eventDate;
    private String coordinatorName;
    private String description;

    public Event() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEventName() { return eventName; }
    public void setEventName(String eventName) { this.eventName = eventName; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Date getEventDate() { return eventDate; }
    public void setEventDate(Date eventDate) { this.eventDate = eventDate; }

    public String getCoordinatorName() { return coordinatorName; }
    public void setCoordinatorName(String coordinatorName) { this.coordinatorName = coordinatorName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
