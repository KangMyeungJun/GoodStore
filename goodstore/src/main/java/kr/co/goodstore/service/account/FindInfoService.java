package kr.co.goodstore.service.account;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.account.FindInfoDAO;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class FindInfoService {
	
	@Autowired(required = false)
	private FindInfoDAO fiDAO;
	
	public MemberDomain searchEmail(MemberVO mVO) {
		MemberDomain md = null;
		
		try {
			md = fiDAO.selectEmail(mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return md;
	}//searchEmail
	
	public MemberDomain searchPassword(MemberVO mVO) {
		MemberDomain md = null;
		
		try {
			md = fiDAO.selectPassword(mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return md;
	}//searchPassword

	public int changePassword(MemberVO mVO) {
		int cnt = 0;
		
		try {
			cnt = fiDAO.updatePassword(mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//changePassword
}
