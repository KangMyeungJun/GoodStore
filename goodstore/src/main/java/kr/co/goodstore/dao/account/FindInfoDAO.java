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
	public int selectPassword(MemberVO mVO)throws PersistenceException{
		int cnt=0;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		if(ss.selectOne("findpw", mVO)!=null) {
			cnt=ss.selectOne("findpw", mVO);
		}else {
			cnt=0;
		}
		System.out.println(cnt);
		if(ss != null){ss.close();}
		
		return cnt;
	}//selectPassword
	
	
	
	/** 비밀번호 변경
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public int updatePassword(MemberVO mVO)throws PersistenceException{
		int cnt = 0;
		System.out.println(cnt);
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		cnt=ss.update("updatepw", mVO);
		
		if(cnt!=0) {
			ss.commit();
		}
		if(ss != null){ss.close();}
		
		return cnt;
	}//updatePassword
	

}
