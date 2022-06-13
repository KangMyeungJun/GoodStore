package kr.co.goodstore.dao.admin;

import java.util.List; 

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.AdminVO;
import kr.co.goodstore.domain.admin.BoardVO;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;
import kr.co.goodstore.domain.admin.OrdersDomain;




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
	 
	//category_detail조회
		 public CategoryDomain categoryDetail(int category_id)throws PersistenceException{  // 컬럼 여러개 한행
			 CategoryDomain list=null;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 list=ss.selectOne("categoryDetail",category_id);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 System.out.println("====================="+list);
			 if(ss != null) {ss.close();}//end if
			 
			 return list;
		 }//categoryDetail
		 
		 //카테고리 수정
		 public int updateCategory(CategoryDomain cDomain)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler 생성 
			 SqlSession ss= null;  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.update("modifyCategory",cDomain); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler 닫기 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  return cnt;
			 }//updateCategory
		 
		 //카테고리 상태변경
		 public int updateCategoryStatus(int category_id)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler 생성 
			 SqlSession ss= null;  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.update("updateCategoryStatus",category_id); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler 닫기 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  return cnt;
			 }//updateCategory
		 
		 
		 
		 //카테고리 추가
		 public int insertCategory(CategoryDomain cDomain)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler 생성 
			 SqlSession ss= null;
			  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.insert("addCategory",cDomain); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler 닫기 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  
			  return cnt;
			 }//insertCategory
		 
		 
	 
		//전체 사용자 구하기(검색)
		 public int selectUserCount(BoardVO bVO) {
			 int totalCnt=0;
			 
			//MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("userCount",bVO);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //전체 사용자 구하기(이용자 수)
		 public int selectUserCount1() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("userCount1");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 
	 //Users조회
	 public List<MemberDomain> searchUsers(BoardVO bVO)throws PersistenceException{
		 List<MemberDomain> list=null;
		 
		 //MyBatis Handler 얻기
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //쿼리문 실행
		 list=ss.selectList("searchUsers",bVO);  //Mapper 의 select문 아이디
		 //MyBatis Handler 닫기
		 if(ss != null) {ss.close();}//end if
		 
		 System.out.println("========================="+list);
		 
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
	 
		
		 //유저탈퇴 시키기 
	 public int updateUserStatus(int member_id)throws PersistenceException{ 
		 int cnt=0;
		  
		  //MyBatis Handler 생성 
		 SqlSession ss= null;
		  
		  try { 
			ss=MyBatisFramework.getInstance().getMyBatisHandler();
		  cnt=ss.update("updateMemberStatus",member_id); 
		   if(cnt == 1) { ss.commit(); }
		 
		  }finally {
			  //MyBatis Handler 닫기 
			  if(ss != null) {ss.close();}
			  }//finally
		  
		  
		  return cnt;
		 }//updateUserStatus
	 
	 
	//전체 주문 수 구하기(검색)
	 public int selectOrderCount(BoardVO bVO) {
		 int totalCnt=0;
		 
		//MyBatis Handler 얻기
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //쿼리문 실행
		 totalCnt=ss.selectOne("ordersCount",bVO);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
		 //MyBatis Handler 닫기
		 if(ss != null) {ss.close();}//end if
		 return totalCnt;
	 }	 	 
	 
	//전체 주문 구하기(상태)
	 public int selectOrdersCount1(String status) {
		 int totalCnt=0;
		 
		 //MyBatis Handler 얻기
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //쿼리문 실행
		 totalCnt=ss.selectOne("orderCounts",status);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
		 //MyBatis Handler 닫기
		 if(ss != null) {ss.close();}//end if
		 return totalCnt;
	 }
	 
	//전체 주문 구하기()
		 public int selectOrdersCount2() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("orderCount2");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //오늘 주문 구하기()
		 public int selectTodayOrdersCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("todayOrdersCount1");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //오늘 주문 구하기(상태)
		 public int selectTodayOrdersCount2(String status) {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("todayOrdersCount2",status);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
	 
	 
	 
	 
	 //Orders 조회
	 public List<OrdersDomain> searchOrders(BoardVO bVO)throws PersistenceException{
		 List<OrdersDomain> list=null;
		 
		 //MyBatis Handler 얻기
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //쿼리문 실행
		 list=ss.selectList("orders",bVO);  //Mapper 의 select문 아이디
		 //MyBatis Handler 닫기
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//searchOrderss
	 
	//주문 상세 조회
	// public OrdersDomain orderDetail(int order_id)throws PersistenceException{  // 컬럼 여러개 한행
	 public OrdersDomain orderDetail(OrdersDomain oDomain)throws PersistenceException{  // 컬럼 여러개 한행
			// public List<OrdersDomain> orderDetail(int order_id)throws PersistenceException{  // 컬럼 여러개 한행
			 OrdersDomain list=null;
				// List<OrdersDomain> list=null;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 list=ss.selectOne("orderDetail",oDomain);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 System.out.println("====================="+list);
			 if(ss != null) {ss.close();}//end if
			 
			 return list;
		 }//orderDetail
		 
		 
		 //유저탈퇴 시키기 
		 public int updateOrderStatus(int order_id)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler 생성 
			 SqlSession ss= null;
			  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.update("updateOrderStatus",order_id); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler 닫기 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  
			  return cnt;
			 }//updateOrderStatus
		 
		 
		 
		 //오늘 가입한 사용자 구하기
		 public int selectTodayCount() {
			 int totalCnt=0;
			 
			//MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("todayCount");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //전체 블로그 수 구하기
		 public int selectBlogCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("blogCount");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 //당일 쓴 블로그 수 구하기
		 public int selectTodayBlogCnt() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("todayBlogCount");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //전체 아이템 수 구하기
		 public int selectItemCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("itemCount");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //완료된 주문 수 구하기
		 public int selectOrdersCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("orderCount");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //당일 완료된 주문 수 구하기
		 public int selectTodayOrderCnt() {
			 int totalCnt=0;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 totalCnt=ss.selectOne("todayOrdersCount");  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //로그인
		 public AdminVO selectAdminLogin(AdminVO aVO)throws PersistenceException{
			 AdminVO AdVO=null;
			 
			 //MyBatis Handler 얻기
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //쿼리문 실행
			 AdVO=ss.selectOne("login",aVO);  //Mapper 의 select문 아이디( 컬럼 여러개 한행=selectOne)
			 //MyBatis Handler 닫기
			 if(ss != null) {ss.close();}//end if
			 
			 return AdVO;
		 }
		 
		 //비밀번호변경
		 public int updatePassword(String password)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler 생성 
			 SqlSession ss= null;
			  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.update("updatePassword",password); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler 닫기 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  
			  return cnt;
			 }//updatePassword
	 

}//class
