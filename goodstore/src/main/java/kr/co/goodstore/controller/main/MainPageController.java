package kr.co.goodstore.controller.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodstore.service.main.MainPageService;

@Controller
public class MainPageController {

	@Autowired(required = false)
	private MainPageService mps;
	
	//@GetMapping("/index")
	public String mainPage(Model model, HttpSession session) {
		
		
		return "index";
	}
}
