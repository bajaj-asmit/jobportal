import Database.DBhandler;

public class entry {

	public static void main(String[] args) {

		DBhandler dao=new DBhandler();
		System.out.println(dao.getEmpnobyEmailId("a@gmail.com"));
		System.out.println(dao.getjobsBySrno(1));
	    System.out.println(dao.getempbySrno(2));
	}

}
