package kr.co.goodstore.dao.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.purchase.CouponDomain;
import kr.co.goodstore.domain.purchase.ItemDomain;
import kr.co.goodstore.domain.purchase.MemberDomain;
import kr.co.goodstore.domain.purchase.PurchaseSuccessDomain;
import kr.co.goodstore.vo.purchase.CartVO;
import kr.co.goodstore.vo.purchase.OrderDetailVO;
import kr.co.goodstore.vo.purchase.PurchaseVO;


@Repository
public class CartDAO {
	
	
	public List<ItemDomain> selectCartItem(int member_id) throws PersistenceException{
		
		List<ItemDomain> list=null;
		
		//Handler ¾ò±â
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		//Äõ¸®¹® ¼öÇà
		list=ss.selectList("kr.co.goodstore.purchase.cart.selectItems",member_id);
		//Handler ´Ý±â
		if(ss!=null) {ss.close();}
		
		return list;
	}
	
	
	
	  public int updateCartQuantity(CartVO cVO) throws PersistenceException{
	  
		  SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
	 
		  ss=MyBatisFramework.getInstance().getMyBatisHandler();
	  
		  int cnt=ss.update("kr.co.goodstore.purchase.cart.updateCartItem",cVO);
		  
		  if(cnt==1) {
			  ss.commit();
		  }
		  
		  if(ss!=null) {ss.close();}
		  
	  return cnt; 
	  }
	 
	
		
	  
		public MemberDomain selectAddress(int member_id) throws PersistenceException{
			
			MemberDomain md=new MemberDomain();
			//Handler ¾ò±â
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			//Äõ¸®¹® ¼öÇà
			md=ss.selectOne("kr.co.goodstore.purchase.cart.selectAddress",member_id);
			//Handler ´Ý±â
			if(ss!=null) {ss.close();}
			
			return md;
		}//selectAddress
	  
	
		
		
		public int deleteCartId(Map<String, Object> map) throws PersistenceException{
			int cnt=0;
			
			//Handler ¾ò±â
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			//Äõ¸®¹® ¼öÇà
			cnt=ss.delete("kr.co.goodstore.purchase.cart.deleteCart",map);
			if(cnt!=0) {
				ss.commit();
			}
			//Handler ´Ý±â
			if(ss!=null) {ss.close();}
			
			return cnt;
		}
		
		
		
		  
		public CouponDomain selectCoupon(String coupon_code) throws PersistenceException{
			
			CouponDomain cd=new CouponDomain();
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			cd=ss.selectOne("kr.co.goodstore.purchase.cart.selectCoupon",coupon_code);
			if(ss!=null) {ss.close();}
			
			return cd;
		}//selectAddress
		
		
		
		
		public int insertOrder(PurchaseVO pVO) throws PersistenceException{
			
			int cnt=0;
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			cnt=ss.insert("kr.co.goodstore.purchase.cart.insertOrder",pVO);
			if(cnt!=0) {
				ss.commit();
			}
			
			if(ss!=null) {ss.close();}
			
			return cnt;
		}//selectAddress
		
		
		
		public int insertOrderDetails(OrderDetailVO odVO) throws PersistenceException{
			
			int cnt=0;
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			cnt=ss.insert("kr.co.goodstore.purchase.cart.insertOrderDetail",odVO);
			if(cnt!=0) {
				ss.commit();
			}
			
			if(ss!=null) {ss.close();}
			
			return cnt;
		}//selectAddress
		
		
		public int insertAddress(PurchaseVO pVO) throws PersistenceException{
			
			int cnt=0;
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			cnt=ss.insert("kr.co.goodstore.purchase.cart.insertAddress",pVO);
			if(cnt!=0) {
				ss.commit();
			}
			
			if(ss!=null) {ss.close();}
			
			return cnt;
		}//selectAddress
		
		
		
		/**
		 * »ç¿ëÇÑ ÄíÆù insert
		 * @param pVO
		 * @return
		 * @throws PersistenceException
		 */
		public int insertUsedCoupon(PurchaseVO pVO) throws PersistenceException{
			
			int cnt=0;
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			cnt=ss.insert("kr.co.goodstore.purchase.cart.insertUsedCoupon",pVO);
			if(cnt!=0) {
				ss.commit();
			}
			
			if(ss!=null) {ss.close();}
			
			return cnt;
		}//selectAddress
		
		
		public int updateUseFlagCoupon(PurchaseVO pVO) throws PersistenceException{
			
			int cnt=0;
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			cnt=ss.update("kr.co.goodstore.purchase.cart.updateCouponFlag",pVO);
			if(cnt!=0) {
				ss.commit();
			}
			
			if(ss!=null) {ss.close();}
			
			return cnt;
		}//selectAddress
		


		public int deleteCartId2(Map<String, Object> map) throws PersistenceException{
			int cnt=0;
			
			//Handler ¾ò±â
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			
			//Äõ¸®¹® ¼öÇà
			cnt=ss.delete("kr.co.goodstore.purchase.cart.deleteCart2",map);
			if(cnt!=0) {
				ss.commit();
			}
			//Handler ´Ý±â
			if(ss!=null) {ss.close();}
			
			return cnt;
		}
		
		

		public int selectOrderSeq() throws PersistenceException{
			int seq=0;
			
			//Handler ¾ò±â
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			//Äõ¸®¹® ¼öÇà
			seq=ss.selectOne("kr.co.goodstore.purchase.cart.selectOrderSeq");
			//Handler ´Ý±â
			if(ss!=null) {ss.close();}
			
			return seq;
		}
		
		
		
		public List<PurchaseSuccessDomain> selectOrdered(int order_id) throws PersistenceException{
			 List<PurchaseSuccessDomain>  list=new ArrayList<PurchaseSuccessDomain>();
			
			//Handler ¾ò±â
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			//Äõ¸®¹® ¼öÇà
			list=ss.selectList("kr.co.goodstore.purchase.cart.selectOrderRightAfter",order_id);
			//Handler ´Ý±â
			if(ss!=null) {ss.close();}
			
			return list;
		}
		
		
		
		
	
}//class
