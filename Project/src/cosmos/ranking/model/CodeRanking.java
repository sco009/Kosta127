package cosmos.ranking.model;

import java.io.Serializable;

public class CodeRanking implements Serializable {
	private String memberID;
	private String memberName;
	private int code_point;
	private int code_ranking;
	
	public CodeRanking(){};
	
	public CodeRanking(String memberID, String memberName, int code_point, int code_ranking) {
		super();
		this.memberID = memberID;
		this.memberName = memberName;
		this.code_point = code_point;
		this.code_ranking = code_ranking;
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

	public int getCode_ranking() {
		return code_ranking;
	}

	public void setCode_ranking(int code_ranking) {
		this.code_ranking = code_ranking;
	}
	
}
