package kr.co.goodstore.dao.register;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class RegisterDAO {
	

	/**
	 * 회원가입
	 * @param mVO
	 * @return
	 * @throws PersistenceException
	 */
	public int insertMember(MemberVO mVO)throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();

		cnt = ss.insert("makeAccount", mVO);
		//System.out.println(cnt);
		//System.out.println("-----------회원가입----------------");
		if(cnt !=0) {
			ss.commit();
		}
		
		if(ss != null){ss.close();}
		
		return cnt;
	}//insertMember
	
	
	/**
	 * 이메일 중복 체크
	 * @param email
	 * @return
	 * @throws PersistenceException
	 */
	public int selectEmail(String email)throws PersistenceException {
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();

		int result = ss.selectOne("emailChk", email);
		
		return result;
	}//selectEmail
	
	
	/**
	 * 휴대폰 중복 체크
	 * @param email
	 * @return
	 * @throws PersistenceException
	 */
	public int selectTel(String tel)throws PersistenceException {
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		int result = ss.selectOne("telChk", tel);
		
		return result;
	}//selectEmail

}
