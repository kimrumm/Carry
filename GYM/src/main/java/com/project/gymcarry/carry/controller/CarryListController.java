package com.project.gymcarry.carry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.carry.CarryDto;
import com.project.gymcarry.carry.service.CarryListService;

@Controller
@RequestMapping
public class CarryListController {

	@Autowired
	private CarryListService carryListService;


	@GetMapping("carry/carryLists")
	public String chatRoomList(
			@RequestParam("sv1") String sv1,
			@RequestParam("sv4") String sv4,
			Model model
			) {
		
		
		if (sv4.equals("여자")) {
			List<CarryDto> list = carryListService.getCarryListF();
			model.addAttribute("carryList", list);
			System.out.println("성별이 여자인 캐리 리스트를 출력합니다.");
		} else {
			List<CarryDto> list = carryListService.getCarryListM();
			model.addAttribute("carryList", list);
			System.out.println("성별이 남자인 캐리 리스트를 출력합니다.");
		}
	
		return "carry/carryList";
	}
	
}