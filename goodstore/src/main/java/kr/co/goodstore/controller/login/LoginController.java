package kr.co.goodstore.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.service.login.LoginService;
import kr.co.goodstore.vo.member.LoginVO;
import kr.co.goodstore.vo.member.MemberVO;

@SessionAttributes
@Controller
public class LoginController {

	@Autowired(required = false)
	private LoginService ls;
	
	@GetMapping("signin_page")
	public String loginPage() {
		
		return "goodstore/account/signin";
	}
		
	
	@GetMapping("signin_result")
	public String loginResult(RedirectAttributes redirectAttr,LoginVO lVO,Model model,HttpSession session) {
		System.out.println(lVO);
		MemberDomain md = ls.searchLoginInfo(lVO);
		
		if(md==null) {
			//model.addAttribute("loginErrMsg","이메일이나 비밀번호가 틀립니다.");
			System.out.println("ssssssssssssss");
			redirectAttr.addFlashAttribute("loginErrMsg", "이메일이나 비밀번호가 틀립니다.");
			return "redirect:signin_page";
		}else {
			System.out.println("로그인됨");
			System.out.println(md.getMember_id());
			//model.addAttribute("loginEmail", md.getEmail());
			session.setAttribute("loginSession", md.getMember_id());
			return "index";
		}
		
	}//loginResult
	
	@GetMapping("logout")
	public String memberLogout(SessionStatus ss, HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		session.invalidate();
		//ss.setComplete();
		//HttpSession session = req.getSession();
		//System.out.println(ss.isComplete());
		//session.invalidate();
		
		return "redirect:index";
	}
}
