package kr.co.goodstore.dao.account;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class FindInfoDAO {
	
	/**
	 * �̸��� ã��
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public MemberDomain selectEmail(MemberVO mVO)throws PersistenceException{
		MemberDomain md = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		md=ss.selectOne("findemail", mVO);
		
		if(ss != null){ss.close();}
		
		return md;
	}//selectEmail
	
	/**
	 * ��й�ȣ ã��
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public MemberDomain selectPassword(MemberVO mVO)throws PersistenceException{
		MemberDomain md = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		md=ss.selectOne("findpw", mVO);
		
		if(ss != null){ss.close();}
		
		return md;
	}//selectPassword
	
	/** ��й�ȣ ����
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
