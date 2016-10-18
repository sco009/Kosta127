package cosmos.education.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cosmos.education.model.EducationContents;
import cosmos.education.model.EducationManager;


public class EducationService {
	private static EducationDao dao;
	private static EducationService service = new EducationService();
	
	
	public static EducationService getInstance(){
		dao = EducationDao.getInstance();
		
		return service;
	}
	public int  inserteducation ( HttpServletRequest request){
		EducationContents Econtents = new EducationContents();
		Econtents.sethl_contents(request.getParameter("hl_contents"));
		Econtents.setdataClassify(request.getParameter("dataClassify"));
		Econtents.setedu_c_ID(dao.selectEc_edu_c_ID()+1);
		
		request.setAttribute("Econtents", Econtents);
		return dao.insertEducation_content(Econtents);
	}
	
	public int insertedumanager( HttpServletRequest request){
		EducationManager Emanager = new EducationManager();
		
		Emanager.setEduManagerId(dao.selectEc_managerid()+1);
		Emanager.setedu_c_ID(dao.selectEc_edu_c_ID());
		Emanager.setmemberID(request.getParameter("memberID"));
		
		
		return dao.inserteductionManager(Emanager);
	}
	
	public List<EducationContents> selectmemberID(String memberID){
		
		
		return dao.selectmemberID(memberID);
	}
	
	public void deletehl_contents (String hl_contents){
		dao.deleteedunamager(hl_contents);
		dao.deletehl_contents(hl_contents);
	}
	
	
	
	
	
	
	
	
	
	
}
