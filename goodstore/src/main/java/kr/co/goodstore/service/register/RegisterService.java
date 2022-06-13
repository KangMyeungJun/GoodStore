package kr.co.goodstore.service.register;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.register.RegisterDAO;
import kr.co.goodstore.vo.member.MemberVO;

@Component
public class RegisterService {

	@Autowired(required = false)
	private RegisterDAO rDAO;
	
	//회원가입
	public int addMember(MemberVO mVO) {
		int cnt=0;
		
		try {
			cnt=rDAO.insertMember(mVO);
			
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}
		
		return cnt;
		
	}//addMember
	
	
	//이메일 중복 체크
	public String searchEmail(String email){
		int result = 0;
		String json="";
		
		JSONObject jsonObj=new JSONObject();
		
		try {
			result = rDAO.selectEmail(email);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		jsonObj.put("flag", result);
		json=jsonObj.toJSONString();
		
		return json;
	}//searchEmail
	
	
	//전화번호 중복 체크
	public String searchTel(String tel){
		int result = 0;
		String json="";
		
		JSONObject jsonObj=new JSONObject();
		
		try {
			result = rDAO.selectTel(tel);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		jsonObj.put("flag", result);
		json=jsonObj.toJSONString();
		
		return json;
	}//searchEmail
	
	
}
