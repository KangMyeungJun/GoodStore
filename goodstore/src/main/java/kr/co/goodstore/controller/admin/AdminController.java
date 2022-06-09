package kr.co.goodstore.controller.admin;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.goodstore.domain.admin.BoardVO;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;
import kr.co.goodstore.domain.admin.OrdersDomain;
import kr.co.goodstore.service.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired(required = false)
	private AdminService cs;
	
	  @GetMapping("/index2")
	  public String welcome1(Model model) {
		//  전체사용자 수
		  int userCount1=cs.searchUserCount1();
		//오늘가입한 사용자 뿌리기
			int todayCount=cs.searchTodayCount();
			//블로그 수 뿌리기
			int blogCount=cs.searchBlogCount();
			//당일 작성한 블로그 수 뿌리기
			int todayBlogCount=cs.searchTodayBlogCnt();
			//전체 아이템 수 뿌리기
			int itemCount=cs.searchItemCount();
			//완료된 주문 수 뿌리기
			int ordersCount=cs.searchOrdersCount();
			//완료된 주문 수 뿌리기
			int todayordersCount=cs.searchTodayOrdersCnt();
			List<CategoryDomain> list= cs.searchCategory();
			
			
			
			model.addAttribute("categoryList",list);
			model.addAttribute("userCount",userCount1);  
			model.addAttribute("todayCnt",todayCount);  
			model.addAttribute("blogCount",blogCount);  
			model.addAttribute("todayBlogCount",todayBlogCount);  
			model.addAttribute("itemCount",itemCount);  
			model.addAttribute("ordersCount",ordersCount);  
			model.addAttribute("todayordersCount",todayordersCount);  
		  
	  return "admin/template/admin_index";
	  }
	
	
	
	
	
	//카테고리 조회
	 @RequestMapping(value="/selectCategory",method=GET)
		public String searchCategory(Model model) {
			
			
				List<CategoryDomain> list= cs.searchCategory();
				model.addAttribute("categoryList",list);
		
			
			return "admin/template/pages/categories/categories";    // views 그다음 폴더부터 쭈욱
		}//searchCategory
	 
	//category_detail(수정) 조회
		 @RequestMapping(value="/categories_edit",method=GET)
			 public String adminCategoryDetail(Model model, int category_id) {
			 
			 
			 model.addAttribute("categoryDetail",cs.categoryDetail(category_id));
			 
			 
			 return "admin/template/pages/categories/categories-edit";    // views 그다음 폴더부터 쭈욱
		 }//adminUsers
	 
	 
	 //Users 조회
	 @RequestMapping(value="/users",method=GET)
	 public String adminUsers(Model model,BoardVO bVO) {
		 //전체 사용자수 뿌리기
		 int userCount1=cs.searchUserCount1();
		 //사용자 수(전체레코드수) 뿌리기
		int userCount= cs.searchUserCount(bVO);
	//	model.addAttribute("userCnt",userCount);  
		//2. 한 화면에 보여줄 게시물의 수
		int pageScale = cs.pageScale();
		//3. 총 페이지 수(몇장?)
		int pageCnt= cs.pageCnt(userCount, pageScale);
		//4. 시작번호
		int startNum= cs.startNum(bVO.getCurrentPage(), pageScale);
		//5. 끝번호
		int endNum = cs.endNum(startNum, pageScale);
		
		bVO.setStartNum(startNum);
		bVO.setEndNum(endNum);
		
		model.addAttribute("userCount",userCount1);  // 위에 선언해줬으니까 변수명
		model.addAttribute("totalCnt",userCount);  // 위에 선언해줬으니까 변수명
		model.addAttribute("pageScale",pageScale);  // 위에 선언해줬으니까 변수명
		model.addAttribute("pageCnt",pageCnt);  // 위에 선언해줬으니까 변수명
		model.addAttribute("startNum",startNum);  // 위에 선언해줬으니까 변수명
		model.addAttribute("endNum",endNum);  // 위에 선언해줬으니까 변수명
		model.addAttribute("currentPage",bVO.getCurrentPage());  //  얘가 있으면 최근사진으로, 없으면 나중 사진
		
		//오늘가입한 사용자 뿌리기
		int todayCount=cs.searchTodayCount();
		model.addAttribute("todayCnt",todayCount);  
		
		
		 //user 뿌리기
		 List<MemberDomain> list= cs.findAllMember(bVO);
		 model.addAttribute("usersList",list);
		 
		 
		 return "admin/template/pages/users/users";    // views 그다음 폴더부터 쭈욱
	 }//adminUsers
	 
	 
	 //user_detail(삭제) 조회
	 @RequestMapping(value="/user_delete",method=GET)
	 //public String adminUsers(Model model,@RequestParam("member_id") Integer member_id) {
	// public String adminUsers(Model model,HttpServletRequest hq, int member_id) {
		 public String adminUsersDetail(Model model, int member_id) {
		 
	//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
		 
		 model.addAttribute("userDetail",cs.userDetail(member_id));
		 
		 
		 return "admin/template/pages/users/users-edit";    // views 그다음 폴더부터 쭈욱
	 }//adminUsers
	 
	 
		
		 //유저탈퇴시키기
		  
		  @RequestMapping(value="/user_remove",method=POST) 
		 // public String adminUserRemove(int member_id,Model model) {
			  public String adminUserRemove(int member_id) {
		//  model.addAttribute("msg", "삭제하시겠습니까?");
		  cs.removeUser(member_id);
		  
		  return "redirect:/users";
		  //redirect:http://localhost/goodstore/
		  }//adminUserRemove
		 	 
	 
	//주문 조회
		 @RequestMapping(value="/orders",method=GET)
		 public String adminOrders(Model model,BoardVO bVO) {
			 
			 //1.주문수(전체 레코드 수 ) 뿌리기
			 int totalCnt=cs.searchOrdersCount(bVO);
			//2. 한 화면에 보여줄 게시물의 수
				int pageScale = cs.pageScale();
				//3. 총 페이지 수(몇장?)
				int pageCnt= cs.pageCnt(totalCnt, pageScale);
				//4. 시작번호
				int startNum= cs.startNum(bVO.getCurrentPage(), pageScale);
				//5. 끝번호
				int endNum = cs.endNum(startNum, pageScale);
				
				bVO.setStartNum(startNum);
				bVO.setEndNum(endNum);
				
				model.addAttribute("totalCnt",totalCnt);  // 위에 선언해줬으니까 변수명
				model.addAttribute("pageScale",pageScale);  // 위에 선언해줬으니까 변수명
				model.addAttribute("pageCnt",pageCnt);  // 위에 선언해줬으니까 변수명
				model.addAttribute("startNum",startNum);  // 위에 선언해줬으니까 변수명
				model.addAttribute("endNum",endNum);  // 위에 선언해줬으니까 변수명
				model.addAttribute("currentPage",bVO.getCurrentPage());  //  얘가 있으면 최근사진으로, 없으면 나중 사진
			 
			 
			 List<OrdersDomain> list= cs.findOrders(bVO);
			 model.addAttribute("ordersList",list);
			 
			 
			 return "admin/template/pages/orders/orders";    // views 그다음 폴더부터 쭈욱
		 }//adminOrders
		 
		 
		 //order_detail 조회
		 @RequestMapping(value="/order_detail",method=GET)
			 public String adminOrderDetail(Model model, int order_id) {
			 
		//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
			 
			 model.addAttribute("orderDetail",cs.findOrderDetail(order_id));
			 
			 
			 return "admin/template/pages/orders/orders-detail";    // views 그다음 폴더부터 쭈욱
		 }//adminUsers
		 
		  
		 
		 //주문환불시키기
		 @RequestMapping(value="/order_remove",method=POST) 
			  public String adminOrderRemove(int order_id) {
		
		  cs.removeOrder(order_id);
		  
		  return "redirect:/orders";
		  //redirect:http://localhost/goodstore/
		  }//adminUserRemove
		 
		 
	
	

}//class
