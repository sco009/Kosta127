package cosmos.ranking.mapper;

import java.util.List;

import cosmos.ranking.model.AlgoRanking;
import cosmos.ranking.model.CodeRanking;

public interface RankingMapper {
	public List<AlgoRanking> algoPointSelect();
	public List<CodeRanking> codePointSelect();
	public int updateAlgoRanking(AlgoRanking Algoranking);
	public int updateCodeRanking(CodeRanking CodeRanking);
}
