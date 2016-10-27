package cosmos.ranking.model;

import java.util.List;

public class RankingService {
	private static RankingDao dao = null;
	private static RankingService service = new RankingService();

	public static RankingService getInstance() {
		dao = RankingDao.getInstance();
		return service;
	}

	public List<AlgoRanking> selectAlgoRanking() {
		updateAlgoRanking();

		return dao.selectAlgoRanking();
	}

	public List<CodeRanking> selectCodeRanking() {
		updateCodeRanking();
		
		return dao.codePointSelect();
	}

	public static void updateAlgoRanking() {
		List<AlgoRanking> list = dao.selectAlgoRanking();
		int ranking = 1;

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setAlgo_ranking(ranking);

			dao.updateAlgoRanking(list.get(i));
		}

		for (int i = 1; i < list.size(); i++) {
			if (list.get(i).getAlgo_point() == list.get(i - 1).getAlgo_point()) {
				ranking = list.get(i - 1).getAlgo_ranking();
				list.get(i).setAlgo_ranking(ranking);
			} else {
				list.get(i).setAlgo_ranking(
						list.get(i - 1).getAlgo_ranking() + 1);
			}
			dao.updateAlgoRanking(list.get(i));
		}
	}
	
	//코드파이트 랭킹 업데이트 하는 부분
	public static void updateCodeRanking() {
		List<AlgoRanking> list = dao.selectAlgoRanking();
		int ranking = 1;

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setAlgo_ranking(ranking);

			dao.updateAlgoRanking(list.get(i));
		}

		for (int i = 1; i < list.size(); i++) {
			if (list.get(i).getAlgo_point() == list.get(i - 1).getAlgo_point()) {
				ranking = list.get(i - 1).getAlgo_ranking();
				list.get(i).setAlgo_ranking(ranking);
			} else {
				list.get(i).setAlgo_ranking(
						list.get(i - 1).getAlgo_ranking() + 1);
			}
			dao.updateAlgoRanking(list.get(i));
		}
	}

}
