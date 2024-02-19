package loginpart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DBhandler;

@WebServlet("/loginUser")
public class loginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginUser() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        DBhandler objdb=new DBhandler();
        HttpSession session=request.getSession();
		boolean result;
		
        String strEmail=request.getParameter("email");
		String strpass=request.getParameter("pass");
		
	    session.setAttribute("eid",strEmail );
		result=objdb.isValidUser(strEmail,strpass);
		
		if(result==true)
		{
		   
			response.sendRedirect("empPage.jsp");
		}
		else {
			PrintWriter out=response.getWriter();
			out.println("<script>alert('sorry password incorrect'); window.location= \"login.html.\"");
		}
	}

}
