package kr.co.goodstore.controller.account;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.goodstore.domain.member.FindMemberDomain;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.service.account.FindInfoService;
import kr.co.goodstore.vo.member.MemberVO;
import lombok.RequiredArgsConstructor;

@Controller
//@SessionAttributes("user")
@RequiredArgsConstructor
public class FindInfoController {

	private final FindInfoService fis;
	
	//이메일 찾기 페이지
	@GetMapping("find_email")
	public String fineEmail() {
		
		return "goodstore/account/email_search";
	}
	
	
	//이메일 찾기 결과
	@GetMapping("find_email_result")
	public String findEmailResult(@ModelAttribute MemberVO mVO, Model model) {
		System.out.println(mVO);
		FindMemberDomain fmd = fis.searchEmail(mVO);
		
		if(fmd == null) {
			model.addAttribute("check", 0);
		}else {
			model.addAttribute("check", 1);
			model.addAttribute("email", fmd.getEmail());
		}
		
		return "goodstore/account/email_result";
	}
	
	
	
	//비밀번호 찾기 페이지
	@GetMapping("password")
	public String findPassword() {
		
		return "goodstore/account/password_search";
	}	
	
	
	
	//비밀번호 찾기 결과
	@GetMapping("password_result")
	public String findPasswordResult(RedirectAttributes redirectAttr,@ModelAttribute MemberVO mVO, Model model) {
		System.out.println(mVO);
		int cnt=0;
		cnt= fis.searchPassword(mVO);
		System.out.println(cnt+"----------------------여기");
		if(cnt!=0) {
			model.addAttribute("id", cnt);
			return "goodstore/account/password_result";
		}else{
			redirectAttr.addFlashAttribute("passNew", "해당하는 회원 정보는 찾을 수 없습니다.");
			return "redirect:password";
		}
		
	}
	
	
	
	//새 비번 설정
	@PostMapping("set_newpassword")
	public String setNewPasswordProc(RedirectAttributes redirectAttr,MemberVO mVO) {
		int cnt=0;
		//mVO.setEmail(email);
		cnt=fis.changePassword(mVO);
		System.out.println(mVO);
		System.out.println("비번-------------------------------");
		System.out.println("비번-------------------------------");
		System.out.println("비번-------------------------------");
		if(cnt!=0) {
			redirectAttr.addFlashAttribute("newPass", "비밀번호가 새로 설정되었습니다.");
			return "redirect:signin_page";
		}else {
			return "index";
		}
			
		
	}
	
//	//새 비번 설정 결과
//	@PostMapping("set_newpassword_result")
//	public String setNewPasswordResult(HttpSession session, Model model) {
//		MemberVO mVO = (MemberVO)session.getAttribute("user");
//		
//		if(mVO == null) {
//			return "";
//		}else {
//			return "";
//		}
//	}
	
	
}
