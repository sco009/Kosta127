package cosmos.multiple.model;

import java.io.Serializable;

public class MultiplePoint implements Serializable {
	String memberId;
	int successPoint;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getSuccessPoint() {
		return successPoint;
	}
	public void setSuccessPoint(int successPoint) {
		this.successPoint = successPoint;
	}
	
	
}

