package cosmos.ranking.model;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cosmos.ranking.mapper.RankingMapper;

public class RankingDao {
	private static RankingDao dao = new RankingDao();
	
	public static RankingDao getInstance(){
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
	
	public List<AlgoRanking> selectAlgoRanking(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<AlgoRanking> list = null;
		
		try {
			list = sqlSession.getMapper(RankingMapper.class).algoPointSelect();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return list;
	}
	
	public List<CodeRanking> codePointSelect(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<CodeRanking> list = null;
		
		try {
			list = sqlSession.getMapper(RankingMapper.class).codePointSelect();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return list;
	}
	
	public void updateAlgoRanking(AlgoRanking algoRanking){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;

		try {
			re = sqlSession.getMapper(RankingMapper.class).updateAlgoRanking(algoRanking);
			
			if(re > 0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}
	
	public void updateCodeRanking(CodeRanking codeRanking){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;

		try {
			re = sqlSession.getMapper(RankingMapper.class).updateCodeRanking(codeRanking);
			
			if(re > 0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}

}
