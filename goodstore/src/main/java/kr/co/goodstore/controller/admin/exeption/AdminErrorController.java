package kr.co.goodstore.controller.admin.exeption;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminErrorController {
	
	@GetMapping("/404")
	public String error404() {
		return "admin/template/pages/account/error-404";
	}
	@GetMapping("/500")
	public String error500() {
		return "admin/template/pages/account/error-500";
	}

}
