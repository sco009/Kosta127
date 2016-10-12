package cosmos.multiple.model;

<<<<<<< HEAD
public class MultipleChoice {
	private String MULTIPLECHOICEID;
	private String MULTIPLECHOICEONE;
	private String MULTIPLECHOICETWO;
	private String MULTIPLECHOICETHREE;
	private String MULTIPLECHOICEFOUR;
	
	
	public String getMULTIPLECHOICEID() {
		return MULTIPLECHOICEID;
	}
	public void setMULTIPLECHOICEID(String mULTIPLECHOICEID) {
		MULTIPLECHOICEID = mULTIPLECHOICEID;
	}
	public String getMULTIPLECHOICEONE() {
		return MULTIPLECHOICEONE;
	}
	public void setMULTIPLECHOICEONE(String mULTIPLECHOICEONE) {
		MULTIPLECHOICEONE = mULTIPLECHOICEONE;
	}
	public String getMULTIPLECHOICETWO() {
		return MULTIPLECHOICETWO;
	}
	public void setMULTIPLECHOICETWO(String mULTIPLECHOICETWO) {
		MULTIPLECHOICETWO = mULTIPLECHOICETWO;
	}
	public String getMULTIPLECHOICETHREE() {
		return MULTIPLECHOICETHREE;
	}
	public void setMULTIPLECHOICETHREE(String mULTIPLECHOICETHREE) {
		MULTIPLECHOICETHREE = mULTIPLECHOICETHREE;
	}
	public String getMULTIPLECHOICEFOUR() {
		return MULTIPLECHOICEFOUR;
	}
	public void setMULTIPLECHOICEFOUR(String mULTIPLECHOICEFOUR) {
		MULTIPLECHOICEFOUR = mULTIPLECHOICEFOUR;
	}
=======
import java.io.Serializable;

public class MultipleChoice implements Serializable {
	String multipleChoiceId;
	String multipleChoiceOne;
	String multipleChoiceTwo;
	String multipleChoiceThree;
	String multipleChoiceFour;
	public String getMultipleChoiceId() {
		return multipleChoiceId;
	}
	public void setMultipleChoiceId(String multipleChoiceId) {
		this.multipleChoiceId = multipleChoiceId;
	}
	public String getMultipleChoiceOne() {
		return multipleChoiceOne;
	}
	public void setMultipleChoiceOne(String multipleChoiceOne) {
		this.multipleChoiceOne = multipleChoiceOne;
	}
	public String getMultipleChoiceTwo() {
		return multipleChoiceTwo;
	}
	public void setMultipleChoiceTwo(String multipleChoiceTwo) {
		this.multipleChoiceTwo = multipleChoiceTwo;
	}
	public String getMultipleChoiceThree() {
		return multipleChoiceThree;
	}
	public void setMultipleChoiceThree(String multipleChoiceThree) {
		this.multipleChoiceThree = multipleChoiceThree;
	}
	public String getMultipleChoiceFour() {
		return multipleChoiceFour;
	}
	public void setMultipleChoiceFour(String multipleChoiceFour) {
		this.multipleChoiceFour = multipleChoiceFour;
	}
	
>>>>>>> branch 'master' of https://github.com/sco009/Kosta127.git
	
	
}
