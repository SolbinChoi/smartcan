package kr.ac.sungkyul.smartcan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistic")
public class StatisticController {
	@RequestMapping("/statistic")
	public String statistic(){
		return "/statistic/statistic";
	}
}
