package cosmos.multiple.model;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cosmos.multiple.mapper.MultipleMapper;

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
	
	
	public Multiple selectMultiple(Multiple multiple){
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
	
	
}
