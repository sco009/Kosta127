package cosmos.login.model;

import java.util.List;

public class LoginService {
	private static LoginDao lodao;
	private static LoginService loservice = new LoginService();

	public static LoginService getInstance() { // 서비스를 생성하면
		lodao = LoginDao.getInstance(); // dao 객체도 같이 생성됨
		return loservice;
	}

	public int currentLoginMemberService(Login login) {
		return lodao.currentLoginMember(login);
	}
	
	public int currentLogoutMemberService(Login login) {
		return lodao.currentLogoutMember(login);
	}
	public List<Login> currentLoginMemberPrintService(){
		return lodao.currentLoginMemberPrint();
	}
}
