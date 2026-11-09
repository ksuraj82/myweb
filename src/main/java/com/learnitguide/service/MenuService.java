package com.learnitguide.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.learnitguide.model.MenuItem;

import java.io.InputStream;
import java.util.List;

public class MenuService {

    public List<MenuItem> loadMenu(String resourcePath) {
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(resourcePath)) {
            if (inputStream == null) {
                throw new RuntimeException("Menu resource file not found: " + resourcePath);
            }
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(inputStream, new TypeReference<List<MenuItem>>() {});
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}