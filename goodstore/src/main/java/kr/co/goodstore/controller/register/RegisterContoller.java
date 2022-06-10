package kr.co.goodstore.controller.register;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.service.register.RegisterService;
import kr.co.goodstore.vo.member.MemberVO;

@Controller
public class RegisterContoller {
	
	@Autowired(required = false)
	private RegisterService rs;

	//회원가입
	@GetMapping("/signup")
	public String signUp(String email, MemberVO mVO) {
		int cnt = rs.searchEmail(email);
		try {
			if(cnt == 1) {
				return "goodstore/account/signup";
			}else if(cnt == 0) {
				rs.addMember(mVO);
			}
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return "goodstore/account/singin";
		
	}//signUp
	
	//이메일 중복체크
	@ResponseBody
	@GetMapping("/emailchk") 
	public int emailDupChkAjax(@RequestParam("email")String email ) {
		int cnt = rs.searchEmail(email);
		
		return cnt;
	}
	
	//회원가입 결과
	@PostMapping("/signup_result")
	public String signUpResult(@ModelAttribute MemberVO mVO) {
	
		return "goodstore/account/signup_result";
	}
	
}
