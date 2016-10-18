package cosmos.login.model;

public class Login {
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
