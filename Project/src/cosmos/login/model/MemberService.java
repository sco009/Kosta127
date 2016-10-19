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
	
	public List<AccessRecord> printAccessRecordService(String memberid){
		return dao.printAccessRecord(memberid);
	}


	public List<Member> listMemberService() {
		return dao.listMember();
	}
	
	public int updateInfoService(Member member){
		return dao.updateInfo(member);
	}
}
