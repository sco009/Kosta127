package cosmos.multiple.model;

import java.util.List;

public class MultipleService {
	public static MultipleDao dao;
	private static MultipleService service = new MultipleService();
	
	public static MultipleService getInstance(){
		dao = dao.getInstance();
		return service;
	}
	
	public List<Multiple> selectMultiple(Multiple multiple){
		return dao.selectMultiple(multiple);
	}
	
	public MultipleChoice selectMultipleChoice(String multipleChoiceId){
		return dao.selectMultipleChoice(multipleChoiceId);
	}
	
	public int selectMultipleCount(Multiple multiple){
		return dao.selectMultipleCount(multiple);
	}
}
