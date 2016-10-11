package cosmos.multiple.model;

public class MultipleService {
	public static MultipleDao dao;
	private static MultipleService service = new MultipleService();
	
	public static MultipleService getInstance(){
		dao.getInstance();
		return service;
	}
}
