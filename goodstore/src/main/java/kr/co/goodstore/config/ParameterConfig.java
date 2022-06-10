package kr.co.goodstore.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;



public class ParameterConfig implements ServletContextListener{
	

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String domain =  Common.DOMAIN;
		String staticPath =  Common.STATICPATH;
		String commonUrl = Common.COMMONURL;
		String uploadPath = Common.UPLOADPATH;
		String middlePath = Common.MIDDLEPATH;
		sce.getServletContext().setInitParameter("domain",domain);
		sce.getServletContext().setInitParameter("staticPath",staticPath);
		sce.getServletContext().setInitParameter("commonUrl",commonUrl);
		sce.getServletContext().setInitParameter("uploadPath",uploadPath);
		sce.getServletContext().setInitParameter("middlePath",middlePath);
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}



}
