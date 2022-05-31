package kr.co.goodstore.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;



public class ParameterConfig implements ServletContextListener{
	

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String domain =  Common.DOMAIN;
		
		sce.getServletContext().setInitParameter("domain",domain);
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}



}
