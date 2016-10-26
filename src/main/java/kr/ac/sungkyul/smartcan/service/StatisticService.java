package kr.ac.sungkyul.smartcan.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.smartcan.dao.StatisticDao;

/*
2016-09-20
 작업자 : 최솔빈
 개발 상황 : 완료
*/

@Service
public class StatisticService {
	@Autowired
	private StatisticDao statisticDao;
	
	public Map<String, Object> getList(){
		
		// 지역별 총 쓰레기양
		Long anyang = statisticDao.getAnyang();
		Long incheon = statisticDao.getIncheon();
		Long seoul = statisticDao.getSeoul();
		
		// 지역별 쓰레기통 수
		Long anyangCount = statisticDao.getAnyangCount();
		Long incheonCount = statisticDao.getIncheonCount();
		Long seoulCount = statisticDao.getSeoulCount();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("anyang", anyang);
		map.put("incheon", incheon);
		map.put("seoul", seoul);
		map.put("anyangCount", anyangCount);
		map.put("incheonCount", incheonCount);
		map.put("seoulCount", seoulCount);
		
		return map;
	}
	
}
