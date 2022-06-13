package kr.co.goodstore.controller.account;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.goodstore.domain.member.FindMemberDomain;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.service.account.FindInfoService;
import kr.co.goodstore.vo.member.MemberVO;

@Controller
@RequestMapping("/find")
@SessionAttributes("user")
public class FindInfoController {

	private FindInfoService fis;
	
	//이메일 찾기 페이지
	@GetMapping("/email")
	public String fineEmail() {
		
		return "goodstore/account/email_search";
	}
	
	//이메일 찾기 결과
	@PostMapping("/email/result")
	public String findEmailResult(@ModelAttribute MemberVO mVO, Model model) {
		FindMemberDomain fmd = fis.searchEmail(mVO);
		
		if(fmd == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("email", fmd.getEmail());
		}
		
		return "goodstore/account/email_result";
	}
	
	//비밀번호 찾기 페이지
	@GetMapping("/password")
	public String findPassword() {
		
		return "goodstore/account/password_search";
	}	
	
	//비밀번호 찾기 결과
	@GetMapping("/password/result")
	public String findPasswordResult(@ModelAttribute MemberVO mVO, Model model) {
		FindMemberDomain fmd = fis.searchPassword(mVO);
		
		if(fmd == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("findpwemail", fmd.getEmail());
		}
		
		return "goodstore/account/password_result";
	}
	
	//새 비번 설정
	@GetMapping("/set/newpassword")
	public String setNewPassword(String email, MemberVO mVO) {
		mVO.setEmail(email);
		fis.changePassword(mVO);
		
		return "";
	}
	
	//새 비번 설정 결과
	@PostMapping("/set/newpassword/result")
	public String setNewPasswordResult(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO)session.getAttribute("user");
		
		if(mVO == null) {
			return "";
		}else {
			return "";
		}
	}
	
	
}
