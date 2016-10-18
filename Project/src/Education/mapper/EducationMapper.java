package Education.mapper;

import java.util.ArrayList;

import Education.model.EducationContents;
import Education.model.EducationManager;


public interface EducationMapper {
	public int inserteducation(EducationContents Econtents);
	public Integer selectEc_edu_c_ID();
	public int inserteductionManager(EducationManager Emanager);
	public Integer selectEc_managerid();
	public ArrayList<EducationContents>selectmemberID(String memberID);                  
	public int deletehl_contents(String hl_contents);
	public int deleteedunamager(String hl_contents);
	
}
