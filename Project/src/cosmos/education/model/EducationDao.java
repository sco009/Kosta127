package cosmos.education.model;

import java.io.InputStream;
import java.util.ArrayList;







import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cosmos.education.mapper.EducationMapper;
import cosmos.education.model.EducationContents;
import cosmos.education.model.EducationManager;

public class EducationDao {
	private static EducationDao dao = new EducationDao();

	public static EducationDao getInstance() {
		return dao;
	}

	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config-education.xml";

		InputStream input = null;

		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new SqlSessionFactoryBuilder().build(input);
	}

	public int insertEducation_content(EducationContents Econtents) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			re = sqlSession.getMapper(EducationMapper.class).inserteducation(
					Econtents);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return re;
	}

	public int inserteductionManager(EducationManager Emanager) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			re = sqlSession.getMapper(EducationMapper.class)
					.inserteductionManager(Emanager);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return re;
	}

	public int selectEc_managerid() {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {

			if (sqlSession.getMapper(EducationMapper.class)
					.selectEc_managerid() == null) {
				return 0;
			} else {
				return sqlSession.getMapper(EducationMapper.class)
						.selectEc_managerid();
			}

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			sqlSession.close();
		}
	}

	public int selectEc_edu_c_ID() {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {

			if (sqlSession.getMapper(EducationMapper.class).selectEc_edu_c_ID() == null) {
				return 0;
			} else {
				return sqlSession.getMapper(EducationMapper.class)
						.selectEc_edu_c_ID();
			}

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			sqlSession.close();
		}
	}

	public ArrayList<EducationContents> selectmemberID(String memberID) {
		ArrayList<EducationContents> selectmemberID = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		selectmemberID = sqlSession.getMapper(EducationMapper.class)
				.selectmemberID(memberID);
		sqlSession.close();

		return selectmemberID;
	}

	public void deleteedunamager(String hl_contents) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0 ;
		
		try {
			re=sqlSession.getMapper(EducationMapper.class).deleteedunamager(hl_contents);
			if(re > 0 ){
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
	public void deletehl_contents(String hl_contents) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0 ; 
		try {
			re = sqlSession.getMapper(EducationMapper.class).deletehl_contents(hl_contents);
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
