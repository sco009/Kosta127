package cosmos.ranking.model;

public class CodeRanking {
	private String memberID;
	private String memberName;
	private int code_point;
	
	public CodeRanking(){};
	
	public CodeRanking(String memberID, String memberName, int code_point) {
		super();
		this.memberID = memberID;
		this.memberName = memberName;
		this.code_point = code_point;
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

	public int getCode_point() {
		return code_point;
	}

	public void setCode_point(int code_point) {
		this.code_point = code_point;
	}
}
