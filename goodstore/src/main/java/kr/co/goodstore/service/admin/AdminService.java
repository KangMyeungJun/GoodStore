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
	
	//ī�װ� ��ȸ
	 public List<CategoryDomain> searchCategory(){
			List<CategoryDomain> list=null;
			try {
			list=cDAO.searchCategory();
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			
			return list;
		}//category
	 
	 //category_detail ��ȸ
	 public CategoryDomain categoryDetail(int category_id){
		 CategoryDomain list=null;
		 try {
			 list=cDAO.categoryDetail(category_id);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end categoryDetail
		 
		 return list;
	 }//userDetail
	 
	 
	//ī�װ�����
	 	public int modifyCategory(CategoryDomain cDomain) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateCategory(cDomain);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//modifyCategory
	 	
	 	//ī�װ� ���º���
	 	public int modifyCategoryStatus(int category_id) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateCategoryStatus(category_id);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//modifyCategory
	 	
	 	
	 	
	 	
	 	//ī�װ��߰�
	 	public int addCategory(CategoryDomain cDomain) {
	 		int cnt=0;
	 		
	 		try { 
	 			cnt=cDAO.insertCategory(cDomain);
	 		}catch(PersistenceException pe) {
	 			pe.printStackTrace(); }//end catch
	 		
	 		return cnt;
	 		
	 	}//addCategory
	 
	 
	 
	 //��ü����� �� ���ϱ�(�Ǽ�)
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
	 
	 //��ü����� �� ���ϱ�(�� �̿��� ��)
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
		 * �� ȭ�鿡 ������ �������� ��
		 * @return
		 */
		public int pageScale() { // �ڱⰡ ���Ƿ� ���ϱ�
			int pageScale=10;
			
			return pageScale;
		}//pageScale
		
		/**
		 * ��� �Խù��� �����ֱ� ���� ������ ��.
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
		 * ���۹�ȣ ���ϱ�
		 * @param currentPage - ���������� ��ȣ
		 * @param pageScale - �� ȭ�鿡 ������ ������ �� 
		 * @return
		 */
		public int startNum(int currentPage, int pageScale) { 
			int startNum=1;
			
			startNum=currentPage*pageScale-pageScale+1;
			
			return startNum;
		}//startNum
		
		/**
		 * �� ��ȣ ���ϱ�
		 * @param startNum
		 * @param pageScale
		 * @return
		 */
		public int endNum(int startNum, int pageScale) {
			int endNum=0;
			
			endNum=startNum+pageScale-1;
			
			return endNum;
			
		}
	 
		public void setKeyword(BoardVO bVO) { //����� �˻� Ű���� ó��
			//�˻� keyword�� field�� ���� ����
			if( !"".equals(bVO.getKeyword()) ) {
				String field="email";
			
				bVO.setField(field);
				
			}//end if
			
		}//setKeyword
		
		public void setKeyword1(BoardVO bVO) { //�ֹ� �˻� Ű���� ó��
			//�˻� keyword�� field�� ���� ����
			if( !"".equals(bVO.getKeyword()) ) {
				String field="name";
				
				bVO.setField(field);
				
			}//end if
			
		}//setKeyword
	 
	 
	 
	 
	 
	 
	 
	 //Users ��ȸ
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
	 
	 //user_detail ��ȸ
	 public MemberDomain userDetail(int member_id){
		 MemberDomain list=null;
		 try {
			 list=cDAO.userDetail(member_id);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return list;
	 }//userDetail
	 
		
		 //���� Ż���Ű��
	 	public int removeUser(int member_id) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateUserStatus(member_id);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//removeUser
	 	
	 	
	 	 //��ü�ֹ� �� ���ϱ�(�Ǽ�)
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
		 
		 //��ü�ֹ� �� ���ϱ�(����)
		 public int searchordersCount1(String status) {
			 int cnt=0;
			 
			 try {
				
				 cnt=cDAO.selectOrdersCount1(status);
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //��ü�ֹ� �� ���ϱ�()
		 public int searchOrdersCount2() {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectOrdersCount2();
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //�����ֹ� �� ���ϱ�()
		 public int searchTodayOrdersCount() {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectTodayOrdersCount();
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 
		 //�����ֹ� �� ���ϱ�(����)
		 public int searchTodayOrdersCount2(String status) {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectTodayOrdersCount2(status);
			 }catch(PersistenceException pe) {
				 pe.printStackTrace();
			 }//end catch
			 
			 return cnt;
		 }
		 	 
	 
	 
	 //Orders ��ȸ
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
	 
	 //order_detail ��ȸ
	 public OrdersDomain findOrderDetail(int order_id){
		 OrdersDomain list=null;
		 try {
			 list=cDAO.orderDetail(order_id);
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return list;
	 }//findOrderDetail
	 
	 
	//���� Ż���Ű��
	 	public int removeOrder(int order_id) {
	 		int cnt=0;
		  
		  try { 
			  cnt=cDAO.updateOrderStatus(order_id);
		  }catch(PersistenceException pe) {
		  pe.printStackTrace(); }//end catch
		  
		  return cnt;
		  
	 	}//removeUser
	 
	 

	 
	 
	 //���� ������ ����� ���ϱ�
	 public int searchTodayCount() {
		 int cnt=0;
		 
		 try {
			 cnt=cDAO.selectTodayCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //��ü ��α� �� ���ϱ�()
	 public int searchBlogCount() {
		 int cnt=0;
		 
		 try {
			
			 cnt=cDAO.selectBlogCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 
	 //���� ��α� �� ���ϱ�()
	 public int searchTodayBlogCnt() {
		 int cnt=0;
		 
		 try {
			 
			 cnt=cDAO.selectTodayBlogCnt();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //��ü ������ �� ���ϱ�()
	 public int searchItemCount() {
		 int cnt=0;
		 
		 try {
			
			 cnt=cDAO.selectItemCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	 //�Ϸ�� �ֹ� �� ���ϱ�()
	 public int searchOrdersCount() {
		 int cnt=0;
		 
		 try {
			 
			 cnt=cDAO.selectOrdersCount();
		 }catch(PersistenceException pe) {
			 pe.printStackTrace();
		 }//end catch
		 
		 return cnt;
	 }
	 
	//���� �Ϸ�� �ֹ� �� ���ϱ�()
		 public int searchTodayOrdersCnt() {
			 int cnt=0;
			 
			 try {
				 
				 cnt=cDAO.selectTodayOrderCnt();
			 }catch(PersistenceException pe) {
				 pe.printStackTrace(); 
			 }//end catch
			 
			 return cnt;
		 }
		 
		//�α���
		 	public AdminVO isAdmin(AdminVO aVO) {
		 		AdminVO AdVO=null;
			  
			  try { 
				  AdVO=cDAO.selectAdminLogin(aVO);
			  }catch(PersistenceException pe) {
			  pe.printStackTrace(); }//end catch
			  
			  return AdVO;
			  
		 	}//modifyCategory
		 	
		 	//��й�ȣ ����
		 	public int modifyPassword(String password) {
		 		int cnt=0;
			  
			  try { 
				  cnt=cDAO.updatePassword(password);
			  }catch(PersistenceException pe) {
			  pe.printStackTrace(); }//end catch
			  
			  return cnt;
			  
		 	}//modifyPassword
		 

}//class
