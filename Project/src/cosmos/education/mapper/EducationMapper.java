package cosmos.education.mapper;

import java.util.ArrayList;
import java.util.Map;

import cosmos.education.model.EducationContents;
import cosmos.education.model.EducationManager;


public interface EducationMapper {
	public int inserteducation(EducationContents Econtents);
	public Integer selectEc_edu_c_ID();
	public int inserteductionManager(EducationManager Emanager);
	public Integer selectEc_managerid();
	public ArrayList<EducationContents>selectmemberID(String memberID);                  
	public int deleteEdumanager(Map<String, String> map);
	
}
