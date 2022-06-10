package kr.co.goodstore.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.service.login.LoginService;
import kr.co.goodstore.vo.member.MemberVO;

@Controller
public class LoginController {

	@Autowired(required = false)
	private LoginService ls;
	
	@GetMapping("/signin")
	public String loginResult(MemberVO mVO, HttpSession session, Model model) {
		MemberDomain md = ls.searchLoginInfo(mVO);
		
		if(md==null) {
			model.addAttribute("loginErrMsg","이메일이나 비밀번호가 틀립니다.");
			return "goodstore/account/signin";
		}else {
			session.setAttribute("loginEmail", md.getEmail());
			return "index";
		}
		
	}//loginResult
	
	@GetMapping("/logout")
	public String memberLogout(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		return "index";
	}
}
