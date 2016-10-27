package cosmos.multiple.mapper;

import java.util.List;

import cosmos.multiple.model.Multiple;
import cosmos.multiple.model.MultipleChoice;
import cosmos.multiple.model.MultiplePoint;
import cosmos.ranking.model.AlgoRanking;

public interface MultipleMapper {
	public List<Multiple> selectMultiple(Multiple multiple);
	public MultipleChoice selectMultipleChoice(String multipleChoiceId);
	public int selectMultipleCount(Multiple multiple);
	public Multiple reMultiple(String mulquestId);
	public int pointInsert(MultiplePoint multiplePoint);
}
