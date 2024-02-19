

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DBhandler;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    DBhandler dao=new DBhandler();
    HttpSession session=request.getSession();
    
		String stremail=request.getParameter("email");
    String strpass=request.getParameter("pass");
    session.setAttribute( "eidadmin",stremail);
    boolean res=dao.isValidAdmin(stremail, strpass);
    if(res==true)
    {
    	response.sendRedirect("admin.jsp");
    }
    else {
    	PrintWriter out=response.getWriter();
		out.println("<script>alert('sorry password incorrect'); window.location= \"login.html.\"");
	}
	}

}
