package kr.co.goodstore.dao.admin;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;



@Component
public class AdminDAO {
	
	//카테고리조회
	 public List<CategoryDomain> searchCategory()throws PersistenceException{
			List<CategoryDomain> list=null;
			
			//MyBatis Handler 얻기
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			//쿼리문 실행
			list=ss.selectList("searchCategory");  //Mapper 의 select문 아이디
			//MyBatis Handler 닫기
			if(ss != null) {ss.close();}//end if
			
			return list;
		}//category
	 
	 //Users조회
	 public List<MemberDomain> searchUsers()throws PersistenceException{
		 List<MemberDomain> list=null;
		 
		 //MyBatis Handler 얻기
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //쿼리문 실행
		 list=ss.selectList("searchUsers");  //Mapper 의 select문 아이디
		 //MyBatis Handler 닫기
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//searchUsers
	 
	 //user_detail조회
	 public MemberDomain userDetail(int member_id)throws PersistenceException{  // 컬럼 여러개 한행
		 MemberDomain list=null;
		 
		 //MyBatis Handler 얻기
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //쿼리문 실행
		 list=ss.selectOne("detailUser",member_id);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
		 //MyBatis Handler 닫기
		 System.out.println("====================="+list);
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//userDetail

}//class
