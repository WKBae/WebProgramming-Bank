package net.wkbae.assignment.wp; /**
 * Created by William on 2016-12-28.
 */

import javax.el.ELContextEvent;
import javax.el.ELContextListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.jsp.JspFactory;
import java.io.IOException;

@WebListener()
public class BankContextListener implements ServletContextListener,
		HttpSessionListener, HttpSessionAttributeListener {
	
	// Public constructor is required by servlet spec
	public BankContextListener() {
	}
	
	// -------------------------------------------------------
	// ServletContextListener implementation
	// -------------------------------------------------------
	public void contextInitialized(ServletContextEvent sce) {
		JspFactory.getDefaultFactory().getJspApplicationContext(sce.getServletContext()).addELContextListener(new ELContextListener() {
			@Override
			public void contextCreated(ELContextEvent e) {
				e.getELContext().getImportHandler().importPackage("net.wkbae.assignment.wp");
			}
		});
		
		try {
			Users.init();
		} catch(IOException e) {
			throw new IllegalStateException(e);
		}
	}
	
	public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
	}
	
	// -------------------------------------------------------
	// HttpSessionListener implementation
	// -------------------------------------------------------
	public void sessionCreated(HttpSessionEvent se) {
      /* Session is created. */
	}
	
	public void sessionDestroyed(HttpSessionEvent se) {
      /* Session is destroyed. */
	}
	
	// -------------------------------------------------------
	// HttpSessionAttributeListener implementation
	// -------------------------------------------------------
	
	public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
	}
	
	public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
	}
	
	public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attibute
         is replaced in a session.
      */
	}
}
