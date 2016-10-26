package kr.ac.sungkyul.smartcan.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.smartcan.service.MainService;
import kr.ac.sungkyul.smartcan.vo.UserVo;
/*
2016-10-01 
 작업자 : 최솔빈
 개발 상황 : 완료
*/

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	// 메인
	@RequestMapping("/main")
	public String main(){
		return "/main/index";
	}
	// 회사 소개 폼 이동
	@RequestMapping("/companyintro")
	public String companyIntro(){
		return "/main/companyintro";
	}

	@RequestMapping("/userManage")
	public String userManage(Model model, 
			@RequestParam(value = "p", required = true, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword){
		// 회원 목록 가져오기
		Map<String, Object> map = mainService.userManage(page, keyword);
		model.addAttribute("map", map);
		return "/main/userManage";
	}
	// 오시는 길 (지도)
	@RequestMapping("/location")
	public String location(){
		return "/main/location";
	}
}
