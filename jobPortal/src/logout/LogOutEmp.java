package logout;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

@WebServlet("/LogOutEmp")
public class LogOutEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LogOutEmp() {
        super();
     
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession(false);
		
		session.getAttribute("eid");
		response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
		session.invalidate();
		response.sendRedirect("index.html");	
	}

}