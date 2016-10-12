package cosmos.multiple.mapper;

import cosmos.multiple.model.Multiple;
import cosmos.multiple.model.MultipleChoice;

public interface MultipleMapper {
	public Multiple selectMultiple(Multiple multiple);
	public MultipleChoice selectMultipleChoice(String multipleChoiceId);
}
