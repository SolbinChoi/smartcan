package kr.ac.sungkyul.smartcan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.smartcan.service.MapService;
import kr.ac.sungkyul.smartcan.vo.MapVo;

@Controller
@RequestMapping("/android")
public class AndroidDispatch {
	@Autowired
	MapService mapservice;
	
	//안드로이드에 DB에 등록된 좌표값 전송
	@RequestMapping(value="/getJsonPoint", method=RequestMethod.GET)
	@ResponseBody
	public List<MapVo> AndroidGetPoint(HttpServletRequest request) {
		
		List<MapVo> list=mapservice.getPointList();
		
		return list;
	}
	
	@RequestMapping(value="/getJsonWiFi", method=RequestMethod.GET)
	@ResponseBody
	public String WiFi(HttpServletRequest request,
			@RequestParam("id") Long id,
			@RequestParam("amount") double amount){
		
		String result="12345";
	
		mapservice.update(id,amount);
		return result;
	
		
		
	}
}
