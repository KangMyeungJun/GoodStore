package kr.co.goodstore.controller.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.service.purchase.OrderListService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderListController {

	private final OrderListService os;
	
	@GetMapping("orderList")
	public String orderList(HttpSession session,Model model) {
		int id=(Integer) session.getAttribute("loginSession");
		//model.addAttribute("orderMap",os.searchOrderID(1)); //세션 값 넣어줘야 함
		model.addAttribute("listCnt",os.searchAllOrderIDs(id)); //세션 값 넣어줘야 함
		return "goodstore/purchase/order_list";
	}
	
	
	@ResponseBody
	@PostMapping(value="orderList/moreList",produces="application/json;charset=UTF-8")
	//public String moreOrders(@RequestParam Map<String, Integer> param,HttpSession session) {
	public String moreOrders(@RequestParam(value="startIndex") String start,
				@RequestParam(value="endIndex") String end,HttpSession session) {
		//model.addAttribute("orderMap",os.searchOrderID(1)); //세션 값 넣어줘야 함
		
		int startIndex=Integer.parseInt(start);
		int endIndex=Integer.parseInt(end);
		
		Map<String, Integer> searchParam = new HashMap<String, Integer>();// search 파라미터 생성
		searchParam.put("startIndex",startIndex );	
		searchParam.put("endIndex",endIndex);
		
		//System.out.println(searchParam);
		//System.out.println("**************************************");
		//searchParam.put("m_id", "1");
		
		int id=(Integer) session.getAttribute("loginSession");
		return os.searchOrderID(id, searchParam);
	}
	
	
	
	/**
	 * 버튼 클릭시 해당 오더 id의 주문상세 가져오기
	 * @param order_id
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="orderList/check",produces="application/json;charset=UTF-8")
	public String orderDetails(@RequestParam(value="order_id") int order_id) {
		System.out.println(order_id);
		
		return os.searchOrderDetailsById2(order_id);
	} 
	
	
	
	/**
	 * 모달창 체크된 상품들 상태 바꾸기
	 * @param valueArr
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="orderList/status",produces="application/json;charset=UTF-8")
	public String checkedItemStatus(@RequestParam(value = "valueArr[]")List<Integer> valueArr) {
		System.out.println("============================");
		System.out.println("============================");
		System.out.println(valueArr);
		return os.modifyOrderDetailStatus(valueArr);
	} 
	
	
	
	/**
	 * 모달창 체크된 상품들 반품창으로 가져오기
	 * @param valueArr
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="orderList/refund",produces="application/json;charset=UTF-8")
	public String refundItems(@RequestParam(value = "valueArr[]")List<Integer> valueArr) {

		return os.searchForRefund(valueArr);
	} 
	
	
	/**
	 * 모달창 체크된 상품들 반품상태 변화, 반품이유 삽입
	 * @param valueArr
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="orderList/refund/status",produces="application/json;charset=UTF-8")
	public String refundStatus(@RequestParam(value = "valueArr[]")List<Integer> valueArr,
							@RequestParam(value = "selectIndex") int selectIndex) {
		System.out.println(valueArr);
		System.out.println(selectIndex);
		
		return os.modifyRefundStatus(valueArr,selectIndex);
	} 
	
	
	
}//class
