package getter_setter;

//SRNO         NOT NULL NUMBER(3)     
//COMPANY_NAME          VARCHAR2(100) 
//JOBREQ                VARCHAR2(20)  
//WORKEXP               VARCHAR2(10)  
//FIELD                 VARCHAR2(5)   
//DESIGNATION           VARCHAR2(20)  
//VACCANY               VARCHAR2(50)  
//LOGO                  VARCHAR2(100) 
public class jobs {
String srno,strCnm,strjobreq,strwrkexp,strfild,strdesi,strvaccy,strlogo;

public jobs() {
	super();
	// TODO Auto-generated constructor stub
}

public jobs(String srno, String strCnm, String strjobreq, String strwrkexp, String strfild, String strdesi,
		String strvaccy, String strlogo) {
	super();
	this.srno = srno;
	this.strCnm = strCnm;
	this.strjobreq = strjobreq;
	this.strwrkexp = strwrkexp;
	this.strfild = strfild;
	this.strdesi = strdesi;
	this.strvaccy = strvaccy;
	this.strlogo = strlogo;
}

@Override
public String toString() {
	return "jobs [srno=" + srno + ", strCnm=" + strCnm + ", strjobreq=" + strjobreq + ", strwrkexp=" + strwrkexp
			+ ", strfild=" + strfild + ", strdesi=" + strdesi + ", strvaccy=" + strvaccy + ", strlogo=" + strlogo + "]";
}

public String getSrno() {
	return srno;
}

public void setSrno(String srno) {
	this.srno = srno;
}

public String getStrCnm() {
	return strCnm;
}

public void setStrCnm(String strCnm) {
	this.strCnm = strCnm;
}

public String getStrjobreq() {
	return strjobreq;
}

public void setStrjobreq(String strjobreq) {
	this.strjobreq = strjobreq;
}

public String getStrwrkexp() {
	return strwrkexp;
}

public void setStrwrkexp(String strwrkexp) {
	this.strwrkexp = strwrkexp;
}

public String getStrfild() {
	return strfild;
}

public void setStrfild(String strfild) {
	this.strfild = strfild;
}

public String getStrdesi() {
	return strdesi;
}

public void setStrdesi(String strdesi) {
	this.strdesi = strdesi;
}

public String getStrvaccy() {
	return strvaccy;
}

public void setStrvaccy(String strvaccy) {
	this.strvaccy = strvaccy;
}

public String getStrlogo() {
	return strlogo;
}

public void setStrlogo(String strlogo) {
	this.strlogo = strlogo;
}
}
