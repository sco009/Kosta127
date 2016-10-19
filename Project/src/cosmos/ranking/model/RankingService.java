package cosmos.ranking.model;

import java.util.List;

public class RankingService {
	private static RankingDao dao = null;
	private static RankingService service = new RankingService();
	
	public static RankingService getInstance(){
		dao = RankingDao.getInstance();
		return service;
	}
	
	public List<AlgoRanking> selectAlgoRanking(){
		return dao.selectAlgoRanking();
	}
	
	public List<CodeRanking> selectCodeRanking(){
		return dao.codePointSelect();
	}

}
