package com.learnitguide.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.learnitguide.model.MenuItem;
import com.learnitguide.service.MenuService;

@WebListener
public class MenuLoaderListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        MenuService menuService = new MenuService();
        
        // Load your JSON file from src/main/resources/
        List<MenuItem> menuData = menuService.loadMenu("userhome/userhome_menu.json");

        // Store globally in Application Scope
        sce.getServletContext().setAttribute("menuData", menuData);
        
        System.out.println(">>> MenuLoaderListener: Menu successfully loaded into Application Scope!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {}
}