package kr.co.goodstore.dao.admin;

import java.util.List; 

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.BoardVO;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;
import kr.co.goodstore.domain.admin.OrdersDomain;




@Component
public class AdminDAO {
	
	//ī�װ���ȸ
	 public List<CategoryDomain> searchCategory()throws PersistenceException{
			List<CategoryDomain> list=null;
			
			//MyBatis Handler ���
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			//������ ����
			list=ss.selectList("searchCategory");  //Mapper �� select�� ���̵�
			//MyBatis Handler �ݱ�
			if(ss != null) {ss.close();}//end if
			
			return list;
		}//category
	 
	//category_detail��ȸ
		 public CategoryDomain categoryDetail(int category_id)throws PersistenceException{  // �÷� ������ ����
			 CategoryDomain list=null;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 list=ss.selectOne("categoryDetail",category_id);  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 System.out.println("====================="+list);
			 if(ss != null) {ss.close();}//end if
			 
			 return list;
		 }//categoryDetail
		 
		 //ī�װ� ����
		 public int updateCategory(CategoryDomain cDomain)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler ���� 
			 SqlSession ss= null;
			  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.update("modifyCategory",cDomain); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler �ݱ� 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  
			  return cnt;
			 }//updateCategory
		 
		 
	 
		//��ü ����� ���ϱ�(�˻�)
		 public int selectUserCount(BoardVO bVO) {
			 int totalCnt=0;
			 
			//MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("userCount",bVO);  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //��ü ����� ���ϱ�(�̿��� ��)
		 public int selectUserCount1() {
			 int totalCnt=0;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("userCount1");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 
	 //Users��ȸ
	 public List<MemberDomain> searchUsers(BoardVO bVO)throws PersistenceException{
		 List<MemberDomain> list=null;
		 
		 //MyBatis Handler ���
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //������ ����
		 list=ss.selectList("searchUsers",bVO);  //Mapper �� select�� ���̵�
		 //MyBatis Handler �ݱ�
		 if(ss != null) {ss.close();}//end if
		 
		 System.out.println("========================="+list);
		 
		 return list;
	 }//searchUsers
	 
	 //user_detail��ȸ
	 public MemberDomain userDetail(int member_id)throws PersistenceException{  // �÷� ������ ����
		 MemberDomain list=null;
		 
		 //MyBatis Handler ���
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //������ ����
		 list=ss.selectOne("detailUser",member_id);  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
		 //MyBatis Handler �ݱ�
		 System.out.println("====================="+list);
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//userDetail
	 
		
		 //����Ż�� ��Ű�� 
	 public int updateUserStatus(int member_id)throws PersistenceException{ 
		 int cnt=0;
		  
		  //MyBatis Handler ���� 
		 SqlSession ss= null;
		  
		  try { 
			ss=MyBatisFramework.getInstance().getMyBatisHandler();
		  cnt=ss.update("updateMemberStatus",member_id); 
		   if(cnt == 1) { ss.commit(); }
		 
		  }finally {
			  //MyBatis Handler �ݱ� 
			  if(ss != null) {ss.close();}
			  }//finally
		  
		  
		  return cnt;
		 }//updateUserStatus
	 
	 
	//��ü �ֹ� �� ���ϱ�(�˻�)
	 public int selectOrderCount(BoardVO bVO) {
		 int totalCnt=0;
		 
		//MyBatis Handler ���
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //������ ����
		 totalCnt=ss.selectOne("ordersCount",bVO);  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
		 //MyBatis Handler �ݱ�
		 if(ss != null) {ss.close();}//end if
		 return totalCnt;
	 }	 	 
	 
	 
	 
	 
	 
	 //Orders ��ȸ
	 public List<OrdersDomain> searchOrders(BoardVO bVO)throws PersistenceException{
		 List<OrdersDomain> list=null;
		 
		 //MyBatis Handler ���
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //������ ����
		 list=ss.selectList("orders",bVO);  //Mapper �� select�� ���̵�
		 //MyBatis Handler �ݱ�
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//searchOrderss
	 
	//�ֹ� �� ��ȸ
		 public OrdersDomain orderDetail(int order_id)throws PersistenceException{  // �÷� ������ ����
			 OrdersDomain list=null;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 list=ss.selectOne("orderDetail",order_id);  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 System.out.println("====================="+list);
			 if(ss != null) {ss.close();}//end if
			 
			 return list;
		 }//orderDetail
		 
		 
		 //����Ż�� ��Ű�� 
		 public int updateOrderStatus(int order_id)throws PersistenceException{ 
			 int cnt=0;
			  
			  //MyBatis Handler ���� 
			 SqlSession ss= null;
			  
			  try { 
				ss=MyBatisFramework.getInstance().getMyBatisHandler();
			  cnt=ss.update("updateOrderStatus",order_id); 
			   if(cnt == 1) { ss.commit(); }
			 
			  }finally {
				  //MyBatis Handler �ݱ� 
				  if(ss != null) {ss.close();}
				  }//finally
			  
			  
			  return cnt;
			 }//updateOrderStatus
		 
		 
		 
		 //���� ������ ����� ���ϱ�
		 public int selectTodayCount() {
			 int totalCnt=0;
			 
			//MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("todayCount");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //��ü ��α� �� ���ϱ�
		 public int selectBlogCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("blogCount");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 //���� �� ��α� �� ���ϱ�
		 public int selectTodayBlogCnt() {
			 int totalCnt=0;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("todayBlogCount");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //��ü ������ �� ���ϱ�
		 public int selectItemCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("itemCount");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //�Ϸ�� �ֹ� �� ���ϱ�
		 public int selectOrdersCount() {
			 int totalCnt=0;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("orderCount");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
		 
		 //���� �Ϸ�� �ֹ� �� ���ϱ�
		 public int selectTodayOrderCnt() {
			 int totalCnt=0;
			 
			 //MyBatis Handler ���
			 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			 //������ ����
			 totalCnt=ss.selectOne("todayOrdersCount");  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
			 //MyBatis Handler �ݱ�
			 if(ss != null) {ss.close();}//end if
			 return totalCnt;
		 }
	 

}//class
