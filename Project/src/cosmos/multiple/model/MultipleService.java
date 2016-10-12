package cosmos.multiple.model;

public class MultipleService {
	public static MultipleDao dao;
	private static MultipleService service = new MultipleService();
	
	public static MultipleService getInstance(){
		dao = dao.getInstance();
		return service;
	}
	
	public Multiple selectMultiple(Multiple multiple){
		return dao.selectMultiple(multiple);
	}
	
	public MultipleChoice selectMultipleChoice(String multipleChoiceId){
		return dao.selectMultipleChoice(multipleChoiceId);
	}
}
