package cosmos.multiple.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cosmos.multiple.mapper.MultipleMapper;
import cosmos.ranking.model.AlgoRanking;

public class MultipleDao {
	private static MultipleDao dao = new MultipleDao();
	
	public static MultipleDao getInstance(){
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory(){
	      String resource = "mybatis-config.xml";
	      InputStream input = null;
	      try {
	         input = Resources.getResourceAsStream(resource);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return new SqlSessionFactoryBuilder().build(input);
	   }
	
	
	public List<Multiple> selectMultiple(Multiple multiple){
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.getMapper(MultipleMapper.class).selectMultiple(multiple);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	public MultipleChoice selectMultipleChoice(String multipleChoiceId){
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.getMapper(MultipleMapper.class).selectMultipleChoice(multipleChoiceId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	public int selectMultipleCount(Multiple multiple){
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.getMapper(MultipleMapper.class).selectMultipleCount(multiple);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
			session.close();
		}
	}
	
	public Multiple reMultiple(String mulquestId){
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.getMapper(MultipleMapper.class).reMultiple(mulquestId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
	public int pointInsert(MultiplePoint multiplePoint) {
		int re = -1;		
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			re = session.getMapper(MultipleMapper.class).pointInsert(multiplePoint);
			if (re > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return re;
	}
	
}
