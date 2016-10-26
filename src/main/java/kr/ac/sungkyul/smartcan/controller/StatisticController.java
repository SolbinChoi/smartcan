package kr.ac.sungkyul.smartcan.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.smartcan.service.StatisticService;

/*
2016-09-20 
 작업자 : 최솔빈
 개발 상황 : 완료
*/

@Controller
@RequestMapping("/statistic")
public class StatisticController {
	
	@Autowired
	private StatisticService statisticService;
	
	// 통계량 
	@RequestMapping("/statistic")
	public String statistic(Model model){
		
		Map<String, Object> map = statisticService.getList();
		model.addAttribute("map",map);
		return "/statistic/statistic";
	}
}
