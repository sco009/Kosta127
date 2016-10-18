package cosmos.login.mapper;

import java.util.List;

import cosmos.login.model.Login;
import cosmos.login.model.Member;

public interface MemberMapper {
	public List<Member> listMember();
	public int insertMember(Member member);
	public Member selectMember(String id);
	/*public Member selectMember(String id,String password);*/
	public int currentLoginMember(Login login);
	public int currentLogoutMember(Login login);
	public int updateInfo(Member member);
}