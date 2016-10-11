package cosmos.multiple.model;

public class MultipleService {
	public static MultipleDao dao;
	private static MultipleService service = new MultipleService();
	
	public static MultipleService getInstance(){
		dao = dao.getInstance();
		return service;
	}
	
	public String selectMultiple(Multiple multiple){
		return dao.selectMultiple(multiple);
	}
}
