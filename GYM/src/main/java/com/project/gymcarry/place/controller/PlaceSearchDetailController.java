package com.project.gymcarry.place.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.place.PlaceDto;
import com.project.gymcarry.place.service.PlaceHealthService;

@Controller
@RequestMapping
public class PlaceSearchDetailController {
	
	@Autowired
	private PlaceHealthService placeHealthService;
	
	
	// 플레이스 검색 후 상세 페이지
	// @RequestMapping(value = "/searchDetail", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
//	@GetMapping("/place/detail")
//	public String placeSearchDetail(
//				@RequestParam("placename") String placename,
//				Model model
//			) {
//		PlaceDto placeSearchDetail = placeHealthService.getSearchPlaceInfo(placename);
//		System.out.println("placename : " + placename);
//		
//		model.addAttribute("placeSearchDetail", placeSearchDetail);
//		
//		return "place/placeDetail";
//	}
//	
	
}