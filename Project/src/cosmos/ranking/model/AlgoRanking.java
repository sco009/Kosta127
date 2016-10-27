package cosmos.ranking.model;

import java.io.Serializable;

public class AlgoRanking implements Serializable{
	private String memberID;
	private String memberName;
	private int algo_ranking;
	private int algo_point;
	
	public AlgoRanking(){}

	public AlgoRanking(String memberID, String memberName, int algo_ranking,
			int algo_point) {
		super();
		this.memberID = memberID;
		this.memberName = memberName;
		this.algo_ranking = algo_ranking;
		this.algo_point = algo_point;
	}


	public int getAlgo_ranking() {
		return algo_ranking;
	}

	public void setAlgo_ranking(int algo_ranking) {
		this.algo_ranking = algo_ranking;
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

	public int getAlgo_point() {
		return algo_point;
	}

	public void setAlgo_point(int algo_point) {
		this.algo_point = algo_point;
	}
	
	
}
