package kr.co.goodstore.service.admin;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.admin.AdminDAO;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;

@Component
public class AdminService {
	
	@Autowired(required = false)
	private AdminDAO cDAO;
	
	//카테고리 조회
	 public List<CategoryDomain> searchCategory(){
			List<CategoryDomain> list=null;
			try {
			list=cDAO.searchCategory();
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			
			return list;
		}//category
	 
	 //Users 조회
	 public List<MemberDomain> findAllMember(){
		 List<MemberDomain> list=null;
		 try {
			 list=cDAO.searchUsers();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return list;
	 }//findAllMember
	 
	 //user_detail 조회
	 public MemberDomain userDetail(int member_id){
		 MemberDomain list=null;
		 try {
			 list=cDAO.userDetail(member_id);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return list;
	 }//findAllMember

}//class
