

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DBhandler;

@WebServlet("/changeAdminPass")
public class changeAdminPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public changeAdminPass() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 DBhandler dao=new DBhandler();
	 HttpSession session =request.getSession(false);
	 String userId=(String) session.getAttribute("eidadmin");
	 System.out.println(userId);
	 String oldpass=dao.getAdminOldPass(userId);
	 System.out.println(oldpass);
		String stroldpass=request.getParameter("oldpass");
	 String strNewPass=request.getParameter("newpass");
	 System.out.println("old pass "+stroldpass);
	 if(oldpass.equals(stroldpass))
	 {
		 System.out.println("old pass "+stroldpass);
		 dao.changeAdminPass(userId, strNewPass);
		 PrintWriter out=response.getWriter();
		 out.println("<script>alert('update successfully');"
		 		+ "window.location= passwordchange.html'</script>");
		
	 }
	 
	}

}
