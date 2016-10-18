package cosmos.login.model;

import java.util.List;

public class MemberService {
	private static MemberDao dao;
	private static MemberService service = new MemberService();

	public static MemberService getInstance() { // 서비스를 생성하면
		dao = MemberDao.getInstance(); // dao 객체도 같이 생성됨
		return service;
	}

	public int insertMemberService(Member member) {
		return dao.insertMember(member);
	}

	public Member selectMemberService(String memberID) {
		return dao.selectMember(memberID);
	}
	
	/*public Member selectMemberService(String id,String password) {
		return dao.selectMember(id, password);
	}*/


	public List<Member> listMemberService() {
		return dao.listMember();
	}
	
	public int updateInfoService(Member member){
		return dao.updateInfo(member);
	}
}
