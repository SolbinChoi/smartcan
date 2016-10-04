package kr.ac.sungkyul.smartcan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String main(){
		return "/main/index";
	}
	// 회사 소개 폼 이동
	@RequestMapping("/companyintro")
	public String companyIntro(){
		return "/main/companyintro";
	}
}
