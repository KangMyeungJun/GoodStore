package kr.co.goodstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {
	
	@GetMapping("account_edit_chk")
	public String accountChk() {
		
		return "goodstore/account/account_edit_chk";
	}
	
	@GetMapping("account_edit")
	public String accountEdit() {
		
		return "goodstore/account/account_edit";
	}
	
	@GetMapping("email_result")
	public String emailResult() {
		
		return "goodstore/account/email_result";
	}
	
	@GetMapping("email_search")
	public String emailSearch() {
		
		return "goodstore/account/email_search";
	}
	
	@GetMapping("password_result")
	public String passwordResult() {
		
		return "goodstore/account/password_result";
	}
	
	@GetMapping("password_search")
	public String passwordSearch() {
		
		return "goodstore/account/password_search";
	}
	
	@GetMapping("signin")
	public String signIn() {
		
		return "goodstore/account/signin";
	}
	
	@GetMapping("signup_result")
	public String signUpResult() {
		
		return "goodstore/account/signup_result";
	}
	
	@GetMapping("signup")
	public String signUp() {
		
		return "goodstore/account/signup";
	}
	
}
