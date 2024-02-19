

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DBhandler;


@WebServlet("/deleteJob")
public class deleteJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public deleteJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  int srno=Integer.parseInt( request.getParameter("srno"));
	  DBhandler dao=new DBhandler();
	  dao.deletejob(srno);
	  response.sendRedirect("removejobs.jsp");
	}

}
