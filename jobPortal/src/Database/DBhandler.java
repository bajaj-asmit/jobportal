package Database;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;


import getter_setter.employe;
import getter_setter.jobs;
import oracle.jdbc.pool.OracleDataSource;
import oracle.net.aso.n;

public class DBhandler {
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rSet=null;
	public Connection getDBcon()
	{
		try {
			OracleDataSource ods=new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
			con=ods.getConnection("xe","icsd");
		
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return con;
	}
	
	public int getEmpnobyEmailId(String email_id)
	{
		int empno=0;
		con=getDBcon();
		try {
		stmt=con.prepareStatement("select empno from employe where email=?");
		stmt.setString(1, email_id);
		rSet=stmt.executeQuery();
		while(rSet.next())
		{
		   empno=rSet.getInt(1);
		   return empno;   
		}
		}
		catch (SQLException e) {
			// TODO: handle exception
		}
		return empno;
	}
	
	public LinkedList<employe> getEmployesbyEmpemail(String Emailid)
	{
		LinkedList<employe> list=new LinkedList<>();
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from employe where email=?");
			stmt.setString(1, Emailid);
			rSet=stmt.executeQuery();
			//ENAME         VARCHAR2(30)  
			//EMAIL         VARCHAR2(30)  
			//PASS          VARCHAR2(15)  
			//DOB           VARCHAR2(15)  
			//SECTOR        VARCHAR2(5)   
			//EMPPHOTO      VARCHAR2(100) 
			//EMPNO         NUMBER(4)  

			if(rSet.next())
			{
			String strnm=rSet.getString("ename"),
					stremail=rSet.getString("email"),
					strpass=rSet.getString("pass"),
			strdob=rSet.getString("dob"),
			strsec=rSet.getString("sector"),
			strphoto=rSet.getString("empphoto"),
			strempno=rSet.getString("empno"),
			strEnum=rSet.getString("enum");
			employe emp=new employe(strnm, stremail, strpass, strdob, strsec, strphoto, strempno,strEnum);
			System.out.println("db work");
			list.add(emp);
			}	
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return list;
	}
	
	public boolean isValidUser(String Emailid,String pass)
	{
		boolean res=false;
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from employe where Email=? and pass=?");
			stmt.setString(1, Emailid);
			stmt.setString(2, pass);
			rSet=stmt.executeQuery();
			
			if(rSet.next())
			{
				res=true;
			}
			else {
				res=false;
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return res;
	}
	
	public LinkedList<jobs> getjobs()
	{
		LinkedList<jobs> linkedList = new LinkedList<>();
		
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from jobs ");
			rSet=stmt.executeQuery();
			//SRNO         NOT NULL NUMBER(3)     
			//COMPANY_NAME          VARCHAR2(100) 
			//JOBREQ                VARCHAR2(20)  
			//WORKEXP               VARCHAR2(10)  
			//FIELD                 VARCHAR2(5)   
			//DESIGNATION           VARCHAR2(20)  
			//VACCANY               VARCHAR2(50)  
			//LOGO                  VARCHAR2(100)
			while(rSet.next())
			{
				String strSrno=rSet.getString("srno");
				String strcmpnm=rSet.getString("company_name");
				String strjobreq=rSet.getString("jobreq");
				String strwrkexp=rSet.getString("workexp");
				String strfild=rSet.getString("field");
				String strdesi=rSet.getString("designation");
				String strvaccy=rSet.getString("vaccany");
				String strlogo=rSet.getString("logo");
				jobs objjobs=new jobs(strSrno, strcmpnm, strjobreq, strwrkexp, strfild, strdesi, strvaccy, strlogo);
				linkedList.add(objjobs);
			}
		}
		
		catch (SQLException e) {
			// TODO: handle exception
		}
		
		return linkedList;
	}
	
	public void deletejob(int srno)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement(" delete from jobs where srno=?");
			stmt.setInt(1, srno);
			stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//	ENAME             VARCHAR2(30)  
//	EMAIL             VARCHAR2(30)  
//	PASS              VARCHAR2(15)  
//	DOB               VARCHAR2(15)  
//	SECTOR            VARCHAR2(15)  
//	EMPPHOTO          VARCHAR2(100) 
//	ENUM              VARCHAR2(20)  
//	EMPNO    NOT NULL NUMBER(4) 
	public LinkedList<employe> getemployes()
	{
		LinkedList<employe> list=new LinkedList<>();
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from employe");
			rSet=stmt.executeQuery();
			while(rSet.next()) {
	        String strEnm=rSet.getString("ename");
	        String strEemail=rSet.getString("email");
	        String strEpass=rSet.getString("pass");
	        String strEdao=rSet.getString("dob");
	        String strEsec=rSet.getString("sector");
	        String strEphoto=rSet.getString("empphoto");
	        String strEnum=rSet.getString("enum");
	        String strEno=rSet.getString("empno");
	        employe emp=new employe(strEnm, strEemail, strEpass, strEdao, strEsec, strEphoto, strEno, strEnum);
	        list.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteUser(int srno)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement("delete from employe where empno=?");
			stmt.setInt(1, srno);
			stmt.executeQuery();
		} catch (SQLException e) {
          e.printStackTrace();
		}
	}
	public LinkedList<employe> getempbySrno(int srno)
	{
		LinkedList<employe> list =new LinkedList<>();
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from employe where empno=?");
			stmt.setInt(1, srno);
			rSet=stmt.executeQuery();
			
			if(rSet.next()) {
			String strEnm=rSet.getString("ename");
	        String strEemail=rSet.getString("email");
	        String strEpass=rSet.getString("pass");
	        String strEdao=rSet.getString("dob");
	        String strEsec=rSet.getString("sector");
	        String strEphoto=rSet.getString("empphoto");
	        String strEnum=rSet.getString("enum");
	        String strEno=rSet.getString("empno");
	        employe emp=new employe(strEnm, strEemail, strEpass, strEdao, strEsec, strEphoto, strEno, strEnum);
	        list.add(emp);
			}
		}
			catch (SQLException e) {
			// TODO: handle exception
		}
				return list;
	}
//	ENAME             VARCHAR2(30)  
//	EMAIL             VARCHAR2(30)  
//	PASS              VARCHAR2(15)  
//	DOB               VARCHAR2(15)  
//	SECTOR            VARCHAR2(15)  
//	EMPPHOTO          VARCHAR2(100) 
//	ENUM              VARCHAR2(20)  
//	EMPNO    NOT NULL NUMBER(4) 
	
	public String getAdminOldPass(String userId)
	{
		String pass=null;
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select pass from projectadmin where userid=?");
			stmt.setString(1, userId);
			rSet=stmt.executeQuery();
			if (rSet.next()) {
				pass=rSet.getString("pass");
			}
		} catch (SQLException e) {
             e.printStackTrace();
		}
		return pass;
	}
	
	public void changeAdminPass(String userid,String newPass)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement("update projectadmin set pass=? where userid=?");
			stmt.setString(1, newPass);
			stmt.setString(2, userid);
			stmt.executeQuery();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public void updateData(String strname,String strEmail,String strpass,String stdob,String Strsec,String strphnno,int srno)
	{
		con=getDBcon();
		try {
			
			stmt=con.prepareStatement("update employe set ename=?,email=?,pass=?,dob=?,sector=?,enum=? where empno=?");
			stmt.setString(1, strname);
			stmt.setString(2, strEmail);
			stmt.setString(3, strpass);
			stmt.setString(4, stdob);
			stmt.setString(5, Strsec);
			stmt.setString(6, strphnno);
			stmt.setInt(7, srno);
			stmt.executeQuery();
		}
		catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
	
	public LinkedList<jobs> getjobsbycategory(String strfield)
	{
		LinkedList<jobs> list=new LinkedList<>();
		
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from jobs where field=?");
			stmt.setString(1, strfield);
			rSet=stmt.executeQuery();
			while(rSet.next())
			{
				String strSrno=rSet.getString("srno");
				String strcmpnm=rSet.getString("company_name");
				String strjobreq=rSet.getString("jobreq");
				String strwrkexp=rSet.getString("workexp");
				String strfild=rSet.getString("field");
				String strdesi=rSet.getString("designation");
				String strvaccy=rSet.getString("vaccany");
				String strlogo=rSet.getString("logo");
				jobs objjobs=new jobs(strSrno, strcmpnm, strjobreq, strwrkexp, strfild, strdesi, strvaccy, strlogo);
                list.add(objjobs);
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
		}
		
		return list;
	}
    
	public LinkedList<jobs> getjobsBySrno(int srno)
	{
		LinkedList<jobs> list=new LinkedList<>();
		
		con=getDBcon();
		try {
			
			stmt=con.prepareStatement("select * from jobs where srno=?");
			stmt.setInt(1, srno);
			rSet=stmt.executeQuery();
			if(rSet.next())
			{
				String strSrno=rSet.getString("srno");
				String strcmpnm=rSet.getString("company_name");
				String strjobreq=rSet.getString("jobreq");
				String strwrkexp=rSet.getString("workexp");
				String strfild=rSet.getString("field");
				String strdesi=rSet.getString("designation");
				String strvaccy=rSet.getString("vaccany");
				String strlogo=rSet.getString("logo");
				jobs objjobs=new jobs(strSrno, strcmpnm, strjobreq, strwrkexp, strfild, strdesi, strvaccy, strlogo);
				list.add(objjobs);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return list;
	}
//	EMPNM             VARCHAR2(100) 
//	EMPEMAIL          VARCHAR2(100) 
//	DAO               VARCHAR2(50)  
//	EMPPHN            VARCHAR2(50)  
//	CMPNM             VARCHAR2(50)  
//	JOBSRNO  NOT NULL NUMBER(5)     
//	JOBREQ            VARCHAR2(50)  
//	JOBFIELD          VARCHAR2(50)  
//	JOBDESI           VARCHAR2(50)  
//	RESUM             VARCHAR2(100) 
	public void applyJobsInsert(String StrEmpNm,String StrEmpEmail,String strDao,String Empphn,String StrCmpNm,int srno,
		String jobreq,String jobfield,String jobdesi,String resum)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement("insert into applyjobs values(?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, StrEmpNm);
			stmt.setString(2, StrEmpEmail);
			stmt.setString(3, strDao);
			stmt.setString(4, Empphn);
			stmt.setString(5, StrCmpNm);
			stmt.setInt(6, srno);
			stmt.setString(7, jobreq);
			stmt.setString(8, jobfield);
			stmt.setString(9, jobdesi);
			stmt.setString(10, resum);
			stmt.executeQuery();
			System.out.println("insert sucessfully");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void signup(int empno,String strnm,String stremail,String strpass,String strdao,String sector,String mnum,String profile)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement("insert into employe values(?,?,?,?,?,?,?,?)");
			stmt.setString(1, strnm);
			stmt.setString(2, stremail);
			stmt.setString(3, strpass);
			stmt.setString(4, strdao);
			stmt.setString(5, sector);
			stmt.setString(6, profile);
			stmt.setString(7, mnum);
			stmt.setInt(8, empno);
			stmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	public int getmaxEmpno()
	{
		int max=0;
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select max(empno) from employe");
			rSet=stmt.executeQuery();
			if(rSet.next())
			{
				max=rSet.getInt("max(empno)");
				System.out.println("max="+max);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return max;
				
	}
   
	public void updatePass(String eno,String newPass)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement("update employe set pass=? where empno=?");
			stmt.setString(1, newPass);
			stmt.setString(2, eno);
			stmt.executeQuery();
			
		}
		catch (SQLException e) {
			// TODO: handle exception
		}
	}
//	SRNO         NOT NULL NUMBER(3)     
//	COMPANY_NAME          VARCHAR2(100) 
//	JOBREQ                VARCHAR2(20)  
//	WORKEXP               VARCHAR2(10)  
//	FIELD                 VARCHAR2(5)   
//	DESIGNATION           VARCHAR2(20)  
//	VACCANY               VARCHAR2(50)  
//	LOGO                  VARCHAR2(100) 

	public void insertIntoJobs(int srno,String strcnm,String strjreq,String wrkexp,String strfield,String strdesi,String vaccy,String logo)
	{
		con=getDBcon();
		try {
			stmt=con.prepareStatement("insert into jobs values(?,?,?,?,?,?,?,?)");
			stmt.setInt(1, srno);
			stmt.setString(2, strcnm);
			stmt.setString(3, strjreq);
			stmt.setString(4, wrkexp);
			stmt.setString(5, strfield);
			stmt.setString(6, strdesi);
			stmt.setString(7, vaccy);
			stmt.setString(8, logo);
			stmt.executeQuery();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
	public boolean isValidAdmin(String struserid,String strpass)
	{
		boolean res=true;
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select * from projectadmin where userid=? and pass=?");
			stmt.setString(1, struserid);
			stmt.setString(2, strpass);
			rSet=stmt.executeQuery();
			if(rSet.next())
			{
				res=true;
			}
			else {
				res=false;
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return res;
	}
	
	public int getMaxSrno()
	{
		int srno=0;
		con=getDBcon();
		try {
			stmt=con.prepareStatement("select max(srno) from jobs");
			rSet=stmt.executeQuery();
			if(rSet.next())
			{
				srno=rSet.getInt("max(srno)");
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return srno;
	}
	
}
