package com.laji.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
	}

	public void contextInitialized(ServletContextEvent arg0) {
		ServletContext context = arg0.getServletContext();
		context.setAttribute("ctx", context.getContextPath());//${ctx}
		System.err.println("---------Servlet容器创建成功 context被放到ServletContext作用域-------");
	}

}
