package kr.co.goodstore.service.account;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.account.FindInfoDAO;
import kr.co.goodstore.domain.member.FindMemberDomain;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class FindInfoService {
	
	@Autowired(required = false)
	private FindInfoDAO fiDAO;
	
	
	public FindMemberDomain searchEmail(MemberVO mVO) {
		FindMemberDomain fmd = null;
		
		try {
			fmd = fiDAO.selectEmail(mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return fmd;
	}//searchEmail
	
	
	
	public int searchPassword(MemberVO mVO) {
		int cnt=0;
		try {
			cnt = fiDAO.selectPassword(mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
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
