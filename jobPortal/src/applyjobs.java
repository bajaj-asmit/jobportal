

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DBhandler;

/**
 * Servlet implementation class applyjobs
 */
@WebServlet("/applyjobs")
public class applyjobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public applyjobs() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		EMPNM             VARCHAR2(100) 
//		EMPEMAIL          VARCHAR2(100) 
//		DAO               VARCHAR2(50)  
//		EMPPHN            VARCHAR2(50)  
//		CMPNM             VARCHAR2(50)  
//		JOBSRNO  NOT NULL NUMBER(5)     
//		JOBREQ            VARCHAR2(50)  
//		JOBFIELD          VARCHAR2(50)  
//		JOBDESI           VARCHAR2(50)  
//		RESUM             VARCHAR2(100)
		DBhandler dao=new DBhandler();
		String strempnm=request.getParameter("enm");
		String strEmail=request.getParameter("eid");
		String strdao=request.getParameter("dao");
		String strphn=request.getParameter("phn");
		String strcnm=request.getParameter("cnm");
		String strjreq=request.getParameter("jreq");
		int srno= Integer.parseInt(request.getParameter("srno"));
		String strfield=request.getParameter("field");
		String strdesi=request.getParameter("desi");
		String strresum=request.getParameter("resume");
		dao.applyJobsInsert(strempnm, strEmail, strdao, strphn, strcnm, srno,strjreq, strfield, strdesi, strresum);
	    PrintWriter out=response.getWriter();
	    out.println("<script>alert('succesfully submit')</script>");
	}

}
