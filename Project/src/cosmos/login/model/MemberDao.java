package cosmos.login.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cosmos.login.mapper.MemberMapper;
import cosmos.login.model.Member;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	
	public static MemberDao getInstance() {
		return dao;
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
	
	public int insertMember(Member member){
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			re = sqlSession.getMapper(MemberMapper.class).insertMember(member);
			
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

	public Member selectMember(String memberID ){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			return sqlSession.getMapper(MemberMapper.class).selectMember(memberID );
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Member> listMember(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Member> list = null;
		
		try {
			list = sqlSession.getMapper(MemberMapper.class).listMember();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
		
		return list;
	}
	
	public int updateInfo(Member member){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
	
		try {
			re = sqlSession.getMapper(MemberMapper.class).updateInfo(member);
			
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

	public Member selectMember(String memberID , String memberPw ) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			return sqlSession.getMapper(MemberMapper.class).selectMember(memberID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
	}

	
	public List<Member> loglistMember() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Member> loglist = null;
		
		try {
			loglist = sqlSession.getMapper(MemberMapper.class).listMember();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
		
		return loglist;
	}

	public List<AccessRecord> printAccessRecord(String memberid) {
		List<AccessRecord> list = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			list = sqlSession.getMapper(MemberMapper.class).printAccessRecord(memberid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;

	}
}
