

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Database.DBhandler;
import getter_setter.employe;

/**
 * Servlet implementation class SearchEmp
 */
@WebServlet("/SearchEmp")
public class SearchEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmp() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int srno=Integer.parseInt(request.getParameter("EmpSrNo"));
	DBhandler dao=new DBhandler();
	LinkedList<employe> list=dao.getempbySrno(srno);
	System.out.println(list);
	HttpSession session=request.getSession(true);
	session.setAttribute("empdata", list);
	response.sendRedirect("editUser.jsp");
	}

}
