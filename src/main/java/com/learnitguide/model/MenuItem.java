package com.learnitguide.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonAlias;

public class MenuItem {
	
	@JsonAlias({"title", "name"})
    private String title;
    
    private String icon;
    private String page;
    
    // Default to true so categories without an explicit "enabled" field show up
    private boolean enabled = true; 
    
    private List<MenuItem> topic;

    // Getters and Setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }

    public String getPage() { return page; }
    public void setPage(String page) { this.page = page; }

    public boolean isEnabled() { return enabled; }
    public void setEnabled(boolean enabled) { this.enabled = enabled; }

    public List<MenuItem> getTopic() { return topic; }
    public void setTopic(List<MenuItem> topic) { this.topic = topic; }
}
