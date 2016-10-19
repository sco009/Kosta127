package cosmos.login.model;

import java.io.Serializable;

public class AccessRecord implements Serializable {
	private String ar_id;
	private String logintime;
	private String logouttime;
	private String memberid;
	
	public AccessRecord(){}
	public AccessRecord(String ar_id, String logintime, String logouttime, String memberid) {
		super();
		this.ar_id = ar_id;
		this.logintime = logintime;
		this.logouttime = logouttime;
		this.memberid = memberid;
	}
	
	public String getAr_id() {
		return ar_id;
	}
	
	public void setAr_id(String ar_id) {
		this.ar_id = ar_id;
	}
	public String getLogintime() {
		return logintime;
	}
	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}
	public String getLogouttime() {
		return logouttime;
	}
	public void setLogouttime(String logouttime) {
		this.logouttime = logouttime;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	
}
