package com.project.gymcarry.carry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.gymcarry.carry.CarryJoinDto;
import com.project.gymcarry.member.service.JoinService;

@Controller
@RequestMapping("carry/join")
public class CarryJoinController {
	
	@Autowired
	JoinService joinservice;
	
	@GetMapping
	public String carryJoinForm() {
		return "carry/carryJoinForm";
	}
	
	@PostMapping
	public String carryJoin(CarryJoinDto carryDto) {
		int result = joinservice.carryJoin(carryDto);
		if(result == 1) {
			System.out.println("캐리회원가입성공");
		}
		return "redirect:/carry/login";
	}
}
