package cosmos.login.model;

import java.io.Serializable;

public class Login implements Serializable{
	private String memberID;
	private String memberName;
	
	public Login(){}

	public Login(String memberID, String memberName) {
		super();
		this.memberID = memberID;
		this.memberName = memberName;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
}
