package cosmos.login.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cosmos.login.mapper.MemberMapper;

public class LoginDao {
private static LoginDao lodao = new LoginDao();
	
	public static LoginDao getInstance() {
		return lodao;
	}
	
	public SqlSessionFactory getSqlSessionFactory()	{
		// sql 세션 객체를 만들어주어야한다
		String resource = "mybatis-config.xml"; // 경로인식함
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource); 
			// mybatis-config.xml에 있는 내용을 가지고 input스트림 가져옴
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new SqlSessionFactoryBuilder().build(input);
	}
	
	public int currentLoginMember(Login login){
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			re = sqlSession.getMapper(MemberMapper.class).currentLoginMember(login);
			
			//트랜젝션 처리 - myBatis에서는 꼭 해주어야 한다.
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return re;
	}
	
	public int currentLogoutMember(Login login){
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			re = sqlSession.getMapper(MemberMapper.class).currentLogoutMember(login);
			
			//트랜젝션 처리 - myBatis에서는 꼭 해주어야 한다.
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return re;
	}

	public List<Login> currentLoginMemberPrint(){
		List<Login> list = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			list = sqlSession.getMapper(MemberMapper.class).currentLoginMemberPrint();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
}
