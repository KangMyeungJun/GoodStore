package kr.co.goodstore.service.login;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.login.LoginDAO;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class LoginService {
	
	@Autowired(required = false)
	private LoginDAO lDAO;
	
	public MemberDomain searchLoginInfo(MemberVO mVO) {
		MemberDomain md = null;
		
		try {
			md = lDAO.selectLoginInfo(mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return md;
	}//searchLoginInfo

}
