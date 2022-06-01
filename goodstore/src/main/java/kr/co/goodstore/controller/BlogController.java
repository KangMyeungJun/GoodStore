package kr.co.goodstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {
	
	@GetMapping("blog")
	public String blog() {
		
		return "goodstore/blog/blog";
	}
	
	@GetMapping("blog_detail")
	public String blogDetail() {
		
		return "goodstore/blog/blog_detail";
	}
	
	
}
