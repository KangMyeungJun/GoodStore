package kr.co.goodstore.service.admin;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.admin.AdminDAO;
import kr.co.goodstore.domain.admin.AdminVO;
import kr.co.goodstore.domain.admin.BoardVO;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;
import kr.co.goodstore.domain.admin.OrdersDomain;

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
	 
	 //category_detail 조회
	 public CategoryDomain categoryDetail(int category_id){
		 CategoryDomain list=null;
		 try {
			 list=cDAO.categoryDetail(category_id);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end categoryDetail
		 
		 return list;
	 }//userDetail
	 
	 
	//카테고리수정
	 	public int modifyCategory(CategoryDomain cDomain) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateCategory(cDomain);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//modifyCategory
	 	
	 	//카테고리 상태변경
	 	public int modifyCategoryStatus(int category_id) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateCategoryStatus(category_id);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//modifyCategory
	 	
	 	
	 	
	 	
	 	//카테고리추가
	 	public int addCategory(CategoryDomain cDomain) {
	 		int cnt=0;
	 		
	 		try { 
	 			cnt=cDAO.insertCategory(cDomain);
	 		}catch(PersistenceException pe) {
	 			pe.printStackTrace(); }//end catch
	 		
	 		return cnt;
	 		
	 	}//addCategory
	 
	 
	 
	 //전체사용자 수 구하기(건수)
	 public int searchUserCount(BoardVO bVO) {
		 int cnt=0;
		 
		 try {
			 setKeyword(bVO);
			 cnt=cDAO.selectUserCount(bVO);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //전체사용자 수 구하기(총 이용자 수)
	 public int searchUserCount1() {
		 int cnt=0;
		 
		 try {
			
			 cnt=cDAO.selectUserCount1();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 /**
		 * 한 화면에 보여줄 페이지의 수
		 * @return
		 */
		public int pageScale() { // 자기가 임의로 정하기
			int pageScale=10;
			
			return pageScale;
		}//pageScale
		
		/**
		 * 모든 게시물을 보여주기 위한 페이지 수.
		 * @param totalCnt
		 * @param pageScale
		 * @return
		 */
		public int pageCnt(int totalCnt, int pageScale) {
			int pageCnt=0;
			
			pageCnt=(int)Math.ceil((double)totalCnt/pageScale);
		//	pageCnt=totalCnt/pageScale;
		//	if(totalCnt%pageScale != 0) {
		//		pageCnt++;
		//	}//end if
			
			return pageCnt;
		}//pageCnt
		
		/**
		 * 시작번호 구하기
		 * @param currentPage - 현재페이지 번호
		 * @param pageScale - 한 화면에 보여줄 페이지 수 
		 * @return
		 */
		public int startNum(int currentPage, int pageScale) { 
			int startNum=1;
			
			startNum=currentPage*pageScale-pageScale+1;
			
			return startNum;
		}//startNum
		
		/**
		 * 끝 번호 구하기
		 * @param startNum
		 * @param pageScale
		 * @return
		 */
		public int endNum(int startNum, int pageScale) {
			int endNum=0;
			
			endNum=startNum+pageScale-1;
			
			return endNum;
			
		}
	 
		public void setKeyword(BoardVO bVO) { //사용자 검색 키워드 처리
			//검색 keyword와 field에 대한 설정
			if( !"".equals(bVO.getKeyword()) ) {
				String field="email";
			
				bVO.setField(field);
				
			}//end if
			
		}//setKeyword
		
		public void setKeyword1(BoardVO bVO) { //주문 검색 키워드 처리
			//검색 keyword와 field에 대한 설정
			if( !"".equals(bVO.getKeyword()) ) {
				String field="name";
				
				bVO.setField(field);
				
			}//end if
			
		}//setKeyword
	 
	 
	 
	 
	 
	 
	 
	 //Users 조회
	 public List<MemberDomain> findAllMember(BoardVO bVO){
		 List<MemberDomain> list=null;
		 try {
			 setKeyword(bVO);
			 list=cDAO.searchUsers(bVO);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 System.out.println("========================="+list);
		 
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
	 }//userDetail
	 
		
		 //유저 탈퇴시키기
	 	public int removeUser(int member_id) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateUserStatus(member_id);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//removeUser
	 	
	 	
	 	 //전체주문 수 구하기(건수)
		 public int searchOrdersCount(BoardVO bVO) {
			 int cnt=0;
			 
			 try {
				 setKeyword1(bVO);
				 cnt=cDAO.selectOrderCount(bVO);
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //전체주문 수 구하기(상태)
		 public int searchordersCount1(String status) {
			 int cnt=0;
			 
			 try {
				
				 cnt=cDAO.selectOrdersCount1(status);
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //전체주문 수 구하기()
		 public int searchOrdersCount2() {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectOrdersCount2();
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //오늘주문 수 구하기()
		 public int searchTodayOrdersCount() {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectTodayOrdersCount();
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //오늘주문 수 구하기(상태)
		 public int searchTodayOrdersCount2(String status) {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectTodayOrdersCount2(status);
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 	 
	 
	 
	 //Orders 조회
	 public List<OrdersDomain> findOrders(BoardVO bVO){
		 List<OrdersDomain> list=null;
		 try {
			 setKeyword1(bVO);
			 list=cDAO.searchOrders(bVO);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
			 
		 }//end catch
		 return list;
	 }//findOrders
	 
	 //order_detail 조회
	 public OrdersDomain findOrderDetail(int order_id){
		 OrdersDomain list=null;
		 try {
			 list=cDAO.orderDetail(order_id);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return list;
	 }//findOrderDetail
	 
	 
	//유저 탈퇴시키기
	 	public int removeOrder(int order_id) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateOrderStatus(order_id);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//removeUser
	 
	 

	 
	 
	 //오늘 가입한 사용자 구하기
	 public int searchTodayCount() {
		 int cnt=0;
		 
		 try {
			 cnt=cDAO.selectTodayCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //전체 블로그 수 구하기()
	 public int searchBlogCount() {
		 int cnt=0;
		 
		 try {
			
			 cnt=cDAO.selectBlogCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 
	 //당일 블로그 수 구하기()
	 public int searchTodayBlogCnt() {
		 int cnt=0;
		 
		 try {
			 
			 cnt=cDAO.selectTodayBlogCnt();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //전체 아이템 수 구하기()
	 public int searchItemCount() {
		 int cnt=0;
		 
		 try {
			
			 cnt=cDAO.selectItemCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //완료된 주문 수 구하기()
	 public int searchOrdersCount() {
		 int cnt=0;
		 
		 try {
			 
			 cnt=cDAO.selectOrdersCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	//당일 완료된 주문 수 구하기()
		 public int searchTodayOrdersCnt() {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectTodayOrderCnt();
			 }catch(PersistenceException pe) {
				 pe.printStackTrace(); 
			 }//end catch
			 
			 return cnt;
		 }
		 
		//로그인
		 	public AdminVO isAdmin(AdminVO aVO) {
		 		AdminVO AdVO=null;
			  
			  try { 
				  AdVO=cDAO.selectAdminLogin(aVO);
			  }catch(PersistenceException pe) {
			  pe.printStackTrace(); }//end catch
			  
			  return AdVO;
			  
		 	}//modifyCategory
		 	
		 	//비밀번호 변경
		 	public int modifyPassword(String password) {
		 		int cnt=0;
			  
			  try { 
				  cnt=cDAO.updatePassword(password);
			  }catch(PersistenceException pe) {
			  pe.printStackTrace(); }//end catch
			  
			  return cnt;
			  
		 	}//modifyPassword
		 

}//class
