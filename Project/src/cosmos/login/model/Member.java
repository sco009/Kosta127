package cosmos.login.model;

import java.io.Serializable;

public class Member implements Serializable {
	private String memberID ;
	private String memberPw ;
	private String memberName ;
	private String memberPhoneNum ;
	private String memberEmail ;
	private String isLeader;
	
	public Member(){}

	public Member(String memberID, String memberPw, String memberName,
			String memberPhoneNum, String memberEmail, String isLeader) {
		super();
		this.memberID = memberID;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhoneNum = memberPhoneNum;
		this.memberEmail = memberEmail;
		this.isLeader = isLeader;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhoneNum() {
		return memberPhoneNum;
	}

	public void setMemberPhoneNum(String memberPhoneNum) {
		this.memberPhoneNum = memberPhoneNum;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String isLeader() {
		return isLeader;
	}

	public void setLeader(String isLeader) {
		this.isLeader = isLeader;
	}
}