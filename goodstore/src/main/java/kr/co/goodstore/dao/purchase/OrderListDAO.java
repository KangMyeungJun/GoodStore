package kr.co.goodstore.dao.purchase;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.purchase.domain.ItemDomain;
import kr.co.goodstore.purchase.domain.OrderListDomain;
import kr.co.goodstore.purchase.vo.RefundVO;


@Repository
public class OrderListDAO {
	
	
	public List<Integer> selectOrderID(int member_id) throws PersistenceException{
		
		List<Integer> list=null;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		//������ ����
		list=ss.selectList("kr.co.goodstore.purchase.orderList.selectOrders",member_id);
		//Handler �ݱ�
		System.out.println(list);
		if(ss!=null) {ss.close();}
		
		return list;
	}
	
	
	public List<OrderListDomain> selectOrderDetails(int order_id) throws PersistenceException{
		
		List<OrderListDomain> list=null;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		//������ ����
		list=ss.selectList("kr.co.goodstore.purchase.orderList.selectOrderDetails",order_id);
		//Handler �ݱ�
		if(ss!=null) {ss.close();}
		
		return list;
	}
	
	public List<OrderListDomain> selectOrderDetails2(int order_id) throws PersistenceException{
		
		List<OrderListDomain> list=null;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		//������ ����
		list=ss.selectList("kr.co.goodstore.purchase.orderList.selectOrderDetails2",order_id);
		//Handler �ݱ�
		if(ss!=null) {ss.close();}
		
		return list;
	}
	
	
	public int updateOrderDetailstatus2(int detail_id) throws PersistenceException{
		
		int cnt=0;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		//������ ����
		cnt=ss.update("kr.co.goodstore.purchase.orderList.updateOrderDetailStatus",detail_id);
		//Handler �ݱ�
		if(ss!=null) {ss.close();}
		
		return cnt;
	}
	

	public int updateOrderDetailstatus(Map<String, Object> map) throws PersistenceException{
		int cnt=0;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		
		//������ ����
		cnt=ss.update("kr.co.goodstore.purchase.orderList.updateOrderDetailStatus",map);
		if(cnt!=0) {
			ss.commit();
		}
		//Handler �ݱ�
		if(ss!=null) {ss.close();}
		
		return cnt;
	}
	
	
	

	public List<OrderListDomain> selectOrderDetailsForRefund(Map<String, Object> map) throws PersistenceException{
		
		List<OrderListDomain> list=null;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		//������ ����
		list=ss.selectList("kr.co.goodstore.purchase.orderList.selectOrderDetailForRefund",map);
		//Handler �ݱ�
		if(ss!=null) {ss.close();}
		
		return list;
	}
	
	

	public int updateRefundStatus(RefundVO rVO) throws PersistenceException{
		int cnt=0;
		
		//Handler ���
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		
		//������ ����
		cnt=ss.update("kr.co.goodstore.purchase.orderList.updateRefundStatus",rVO);
		if(cnt!=0) {
			ss.commit();
		}
		System.out.println("*********************************************");
		System.out.println("*********************************************");
		System.out.println(cnt);
		//Handler �ݱ�
		if(ss!=null) {ss.close();}
		
		return cnt;
	}
	
	
	
	
	
}//class
