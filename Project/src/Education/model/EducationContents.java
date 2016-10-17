package Education.model;

import java.io.Serializable;

public class EducationContents implements Serializable {
	private int edu_c_ID;
	private String hl_contents;
	private String dataClassify;
	@Override
	public String toString() {
		return "EducationContents [edu_c_ID=" + edu_c_ID + ", hl_contents=" + hl_contents
				+ ", dataClassify=" + dataClassify + "]";
	}
	public String gethl_contents() {
		return hl_contents;
	}
	public void sethl_contents(String hl_contents) {
		this.hl_contents = hl_contents;
	}
	public int getedu_c_ID() {
		return edu_c_ID;
	}
	public void setedu_c_ID(int edu_c_ID) {
		this.edu_c_ID = edu_c_ID;
	}

	
	public String getdataClassify() {
		return dataClassify;
	}
	public void setdataClassify(String dataClassify) {
		this.dataClassify = dataClassify;
	}



}