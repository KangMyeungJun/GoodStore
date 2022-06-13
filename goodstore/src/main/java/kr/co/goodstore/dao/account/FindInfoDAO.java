package kr.co.goodstore.dao.account;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.member.FindMemberDomain;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class FindInfoDAO {
	
	/**
	 * 이메일 찾기
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public FindMemberDomain selectEmail(MemberVO mVO)throws PersistenceException{
		FindMemberDomain fmd = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		fmd=ss.selectOne("findemail", mVO);
		
		if(ss != null){ss.close();}
		
		return fmd;
	}//selectEmail
	
	/**
	 * 비밀번호 찾기
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public FindMemberDomain selectPassword(MemberVO mVO)throws PersistenceException{
		FindMemberDomain md = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		md=ss.selectOne("findpw", mVO);
		
		if(ss != null){ss.close();}
		
		return md;
	}//selectPassword
	
	/** 비밀번호 변경
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public int updatePassword(MemberVO mVO)throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		cnt=ss.update("updatepw", mVO);
		
		if(ss != null){ss.close();}
		
		return cnt;
	}//updatePassword
	

}
