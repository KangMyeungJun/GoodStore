package kr.co.goodstore.service.register;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.register.RegisterDAO;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class RegisterService {

	@Autowired(required = false)
	private RegisterDAO rDAO;
	
	//ȸ������
	public boolean addMember(MemberVO mVO) {
		boolean flag = false;
		
		try {
			if(rDAO.insertMember(mVO) == 1) {
			
				return true;
			}
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}
		
		return flag;
		
	}//addMember
	
	//�̸��� �ߺ� üũ
	public int searchEmail(String email){
		int result = 0;
		
		try {
			result = rDAO.selectEmail(email);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return result;
	}//searchEmail
	
}
