package kr.co.goodstore.controller.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.goodstore.service.register.RegisterService;
import kr.co.goodstore.vo.member.MemberVO;
import kr.co.goodstore.vo.purchase.CartVO;

@Controller
public class RegisterContoller {
	
	@Autowired(required = false)
	private RegisterService rs;

	
	@GetMapping("signup")
	public String loginPage() {
		
		return "goodstore/account/signup";
	}
	
	//회원가입
	@GetMapping("signup_result")
	public String signUp(MemberVO mVO, HttpServletRequest request,RedirectAttributes redirectAttr) {
		mVO.setIp(request.getRemoteAddr());
		
		System.out.println(mVO);
		int cnt = rs.addMember(mVO);
		
			if(cnt != 0) {
				//redirectAttr.addFlashAttribute("regisDone", "회원가입이 완료되었습니다.");
				return "goodstore/account/signup_result";
			}else{
				redirectAttr.addFlashAttribute("regisDone", "회원가입에 실패하였습니다.");
				return "redirect:signup";
			}
		
	}//signUp
	
	
	//이메일 중복체크
	@ResponseBody
	@RequestMapping(value="emailchk",method=RequestMethod.GET, 
	produces="application/json;charset=UTF-8")
	public String emailDupChkAjax(@RequestParam("email") String email ) {
		System.out.println(email);
		
		return rs.searchEmail(email);
	}
	
	//휴대폰 중복체크
	@ResponseBody
	@RequestMapping(value="telChk",method=RequestMethod.GET, 
	produces="application/json;charset=UTF-8")
	public String telDupChkAjax(@RequestParam("tel") String tel ) {
		System.out.println(tel);
		
		return rs.searchTel(tel);
	}
	
	
	
//	//회원가입 결과
//	@PostMapping("/signup_result")
//	public String signUpResult(@ModelAttribute MemberVO mVO) {
//	
//		return "goodstore/account/signup_result";
//	}
	
}
