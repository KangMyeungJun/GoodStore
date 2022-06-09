package kr.co.goodstore.dao.login;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.member.MemberDomain;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class LoginDAO {

	public MemberDomain selectLoginInfo(MemberVO mVO)throws PersistenceException{
		MemberDomain md = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		
		md=ss.selectOne("loginchk", mVO);
		
		if(ss != null) {ss.close();}
		
		return md;
	}
}
