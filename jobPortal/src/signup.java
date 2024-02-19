

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Database.DBhandler;
import getter_setter.employe;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public signup() {
        super();
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    DBhandler dao=new DBhandler();
     int num=dao.getmaxEmpno();
     System.out.println("num in signup"+num);
     num=num+1;
	String strname=request.getParameter("nm");
    String stremail=request.getParameter("email");
    String strdao=request.getParameter("dob");
    String strpass=request.getParameter("pass");
    String strsec=request.getParameter("sector");
    String strphn=request.getParameter("phnno");
    String strimg=request.getParameter("img");
   String path=request.getRealPath("img");
   System.out.println(path);
 
    dao.signup(num, strname, stremail, strpass, strdao, strsec, strphn, strimg);
    PrintWriter out=response.getWriter();
    out.println("<script>alert('signup successfully'); window.location.href = \"signup.html\";</script>");
    
	}

}
