package cosmos.multiple.model;

public class MultipleDao {
	private static MultipleDao dao = new MultipleDao();
	
	public static MultipleDao getInstance(){
		return dao;
	}
}
