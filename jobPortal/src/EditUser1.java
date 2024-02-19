

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DBhandler;

@WebServlet("/EditUser1")
public class EditUser1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditUser1() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String strnm=request.getParameter("name");
	String stremail=request.getParameter("email");
	String strpass=request.getParameter("password");
	String strdob=request.getParameter("dob");
	String strSec=request.getParameter("sector");
	String strphnnum=request.getParameter("Enumber");
	int hiddendata= Integer.parseInt(request.getParameter("hiddenData"));
	DBhandler dao=new DBhandler();
	dao.updateData(strnm, stremail, strpass, strdob, strSec, strphnnum,hiddendata);
   PrintWriter out=response.getWriter();
   out.println("<script>alert('update successfully');</script>");
	}

}
