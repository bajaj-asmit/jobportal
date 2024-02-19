

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Database.DBhandler;

@WebServlet("/addjobs")

public class addjobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addjobs() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DBhandler dao=new DBhandler();
		int srno=dao.getMaxSrno();
		String strcnm=request.getParameter("cmpnm");
		String strjreq=request.getParameter("jreq");
		String strwrkexp=request.getParameter("jobexp");
		String strfield=request.getParameter("jobexp");
		String strdesi=request.getParameter("desi");
		String strvaca=request.getParameter("vacc");
		String strlogo=request.getParameter("img");
		dao.insertIntoJobs(srno, strcnm, strjreq, strwrkexp, strfield, strdesi, strvaca, strlogo);
		
	}

}
