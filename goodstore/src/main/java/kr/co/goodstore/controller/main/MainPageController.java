package kr.co.goodstore.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodstore.service.main.MainPageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class MainPageController {

	private final MainPageService mps;
	
	@GetMapping("/index")
	public String mainPage(Model model) {
		log.info("hello index");
		
		model.addAttribute("bestList", mps.searchBestItem());
		model.addAttribute("recentlyList", mps.searchRecentlyItem());
		model.addAttribute("priceList", mps.searchPriceOrderItem());
		
		return "index";
	}
}
