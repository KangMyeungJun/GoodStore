package kr.co.goodstore.service.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.purchase.CartDAO;
import kr.co.goodstore.domain.purchase.CouponDomain;
import kr.co.goodstore.domain.purchase.ItemDomain;
import kr.co.goodstore.domain.purchase.MemberDomain;
import kr.co.goodstore.domain.purchase.PurchaseSuccessDomain;
import kr.co.goodstore.vo.purchase.CartVO;
import kr.co.goodstore.vo.purchase.OrderDetailVO;
import kr.co.goodstore.vo.purchase.PurchaseVO;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class CartService {

	private final CartDAO cDAO;
	

	public List<ItemDomain> searchCartItems(int member_id){
		List<ItemDomain> list=null;
		
		try {
			list=cDAO.selectCartItem(member_id);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//union
	
	
	
	
	
	public String quantityChangeJSON(CartVO cVO) {
		String json;
		
		int cnt=0;
		try {
			cnt=cDAO.updateCartQuantity(cVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		
		JSONObject jsonData=new JSONObject();
		
		if(cnt==1) {
			jsonData.put("quantity",1);
		}else {
			jsonData.put("quantity",0);
			
		}
		
		json=jsonData.toJSONString();
		
		return json;
	}//quantityChangeJSON
	
	
	
	
	public String addressJSON(int member_id) {
		String json;
		
		MemberDomain md=null;
		try {
			md=new MemberDomain();
			md=cDAO.selectAddress(member_id);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		String tel=md.getTel();
		String tel1=tel.substring(0,3);
		String tel2=tel.substring(4,8);
		String tel3=tel.substring(9);
		//System.out.println(md.getAddress());
		//System.out.println(md.getAddress2());
		
		JSONObject jsonData=new JSONObject();
		
		jsonData.put("name",md.getName());
		jsonData.put("tel1",tel1);
		jsonData.put("tel2",tel2);
		jsonData.put("tel3",tel3);
		jsonData.put("zipcode",md.getZipcode());
		jsonData.put("address",md.getAddress());
		jsonData.put("address2",md.getAddress2());
		
		json=jsonData.toJSONString();
		
		return json;
	}//addressJSON
	
	
	
	public String removeCartList(List<Integer> valueArr){
		
		String json;
		
		int cnt=0;
		
		//MyBatis에서 사용하기 위해 Map에 입력값을 넣는다.
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(valueArr!=null) {
			map.put("listProduct",valueArr);
		}
		//System.out.println(map);
		
		try {
			cnt=cDAO.deleteCartId(map);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		JSONObject jsonData=new JSONObject();
		if(cnt!=0) {
			jsonData.put("success",1);
		}
		json=jsonData.toJSONString();
		
		
		return json;
	}//searchDynamicForeach
	
	
	
	
	
	public String searchCoupon(String coupon_code){
		String json;
		
		CouponDomain cd =new CouponDomain();
		
		try {
			cd=cDAO.selectCoupon(coupon_code);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		JSONObject jsonData=new JSONObject();
		
		if(cd!=null) {
			jsonData.put("flag",1);
			jsonData.put("discount_rate",cd.getDiscount_rate());
			jsonData.put("discount_price",cd.getDiscount_price());
			jsonData.put("start_date",cd.getStart_date());
			jsonData.put("end_date",cd.getEnd_date());
			jsonData.put("name",cd.getName());
			jsonData.put("coupon_id",cd.getCoupon_id());
		}else{
			jsonData.put("flag",0);
		}
		json=jsonData.toJSONString();
		
		return json;
	}//searchDynamicForeach
	
	

	
	public int addOrder(PurchaseVO pVO){ //주문 테이블에 추가
		
		int cnt=0;
		
		try {
			cnt=cDAO.insertOrder(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	
	
	
	public int addOrderDetails(PurchaseVO pVO){ //주문 테이블에 추가
		
		int cnt=0;
		
		OrderDetailVO odVO=null;
		
		try {
			odVO=new OrderDetailVO();
			int itemId=0;
			int quantity=0;
			
			for(int i=0;i<pVO.getItem_id().length;i++) {
				itemId=Integer.parseInt(pVO.getItem_id()[i]);
				odVO.setItem_id(itemId);
				
				quantity=Integer.parseInt(pVO.getQuantity()[i]);
				odVO.setAmount(quantity);
				
				//dao호출
				cnt+=cDAO.insertOrderDetails(odVO); //insert 여러번
			}//end for
		}catch(PersistenceException pe) {
			
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	
	

	
	/**
	 * 배송지플래그가 'Y'인 주문건의 배송지 추가
	 * @param pVO
	 * @return
	 */
	public int addNewAddress(PurchaseVO pVO){ //주문 테이블에 추가
		
		int cnt=0;
		
		try {
			cnt=cDAO.insertAddress(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	
	
	/**
	 * 배송지플래그가 'Y'인 주문건의 배송지 추가
	 * @param pVO
	 * @return
	 */
	public int addUsedCoupon(PurchaseVO pVO){ //주문 테이블에 추가
		
		int cnt=0;
		
		try {
			cnt=cDAO.insertUsedCoupon(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	
	
	public int modifyCouponUseFlag(PurchaseVO pVO){ //주문 테이블에 추가
		
		int cnt=0;
		
		try {
			cnt=cDAO.updateUseFlagCoupon(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	
	

	
	public int removeCartAfterOrder(String[] product){
		
		int cnt=0;
		
		//MyBatis에서 사용하기 위해 Map에 입력값을 넣는다.
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(product!=null) {
			map.put("listProduct",product);
		}
		//System.out.println(map);
		
		try {
			cnt=cDAO.deleteCartId2(map);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		
		return cnt;
	}//searchDynamicForeach
	

	public int searchOrderSeq(){
		int cnt=0;
		
		try {
			cnt=cDAO.selectOrderSeq();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	
	
	
	
	public List<PurchaseSuccessDomain> searchOrderInfo(int order_id){
		 List<PurchaseSuccessDomain> list=null;
		
		try {
			list=cDAO.selectOrdered(order_id);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//union
	
	
}//class
