package kr.co.goodstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@GetMapping("/index")
	public String hello(Model model) {
		
		return "index";
	}
	
	
}
