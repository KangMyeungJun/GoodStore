package kr.co.goodstore.purchase;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.purchase.domain.PurchaseSuccessDomain;
import kr.co.goodstore.purchase.vo.CartListVO;
import kr.co.goodstore.purchase.vo.CartVO;
import kr.co.goodstore.purchase.vo.PurchaseVO;
import kr.co.goodstore.service.purchase.CartService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

	
	private final CartService cs;
	
	
	
	/**
	 * cart ������ 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("cart")
	public String shoppingCart(HttpSession session,Model model ) {
		
		//���� ���� �־������
		model.addAttribute("cartItemList",cs.searchCartItems(1));
		//System.out.println(cs.searchCartItems(1));
		
		return "goodstore/purchase/cart";
	}
	
	
	
	/**
	 * �� ���� ���� 
	 * @param quantity
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="cart/quantity",method=RequestMethod.POST, 
	produces="application/json;charset=UTF-8")
	public String quantityBtn(HttpSession session, CartVO cVO) {
		
		//cVO.setMember_id(session.getAttribute("member_id"));
		cVO.setMember_id(1); //���Ƿ� �������� ���� ���̵�
		return cs.quantityChangeJSON(cVO);
	}
	
	
	
	
	/**
	 * �⺻ ����� ��������
	 * @param quantity
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="cart/address",produces="application/json;charset=UTF-8")
	public String Btn(HttpSession session) {
		
		//���Ƿ� �������� ���� ���̵�
		
		return cs.addressJSON(1); //���߿� ���� ��ȣ �־������.
	}
	
	

	
	
	@PostMapping("cart/remove")
	@ResponseBody
	public String removeCart(@RequestParam(value = "valueArr[]")List<Integer> valueArr) {
		
		return cs.removeCartList(valueArr);
	} 
	
	
	
	
	/**
	 * ���� ���
	 * @param coupon_code
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="cart/coupon",produces="application/json;charset=UTF-8")
	public String useCoupon(@RequestParam(value="coupon_code") String coupon_code) {
		
		return cs.searchCoupon(coupon_code);
	} 
	
	
	
	
	@PostMapping("purchase/success")
	public String purchaseSuccess(PurchaseVO pVO,Model model) {
		
		pVO.setMember_id(1); //���ǿ� �ִ� ��� ���̵� VO�� �־��ֱ�
		
		System.out.println(pVO.getTotal_price());
		
		
		//�ֹ� insert
		cs.addOrder(pVO);
		
		//�ֹ� �� insert
		cs.addOrderDetails(pVO);
		
		//�⺻�������
		if(pVO.getAddress_flag().equals("Y")) {
			cs.addNewAddress(pVO);
		}
		
		//address_flag=N, coupon_id=,
		if(pVO.getCoupon_id()!=null) {
			cs.addUsedCoupon(pVO);
			cs.modifyCouponUseFlag(pVO);
		}
		
		//���޻�ǰ ��ٱ��Ͽ��� ����
		cs.removeCartAfterOrder(pVO.getProduct());
		
		
		List<PurchaseSuccessDomain> list=new ArrayList<PurchaseSuccessDomain>();
		list=cs.searchOrderInfo(cs.searchOrderSeq());
		
		String address=pVO.getAddr()+" "+pVO.getAddr2();
		
		model.addAttribute("orderedProduct",list);
		model.addAttribute("totalPrice",pVO.getTotal_price());
		model.addAttribute("address",address);
		
		
		return "goodstore/purchase/purchase_success";
	} //purchaseSuccess
}
