package kr.co.goodstore.controller.admin;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.goodstore.domain.admin.AdminVO;
import kr.co.goodstore.domain.admin.BoardVO;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.CategoryForm;
import kr.co.goodstore.domain.admin.MemberDomain;
import kr.co.goodstore.domain.admin.OrdersDomain;
import kr.co.goodstore.service.admin.AdminService;
import kr.co.goodstore.service.admin.product.FileConvert;

//@RequestMapping("/admin") //이따가 다 추가해주기!!!
@SessionAttributes("id")
@Controller
public class AdminController {
	
	@Autowired(required = false)
	private AdminService cs;
	
	@Autowired(required = false)
	private final FileConvert fc = new FileConvert();
	
	@GetMapping("/admin")
	public String redirectAdmin() {
		return "redirect:/admin_index";
	}
	
	  @GetMapping("/admin_index")
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
	 @RequestMapping(value="/admin/categories",method=GET)
		public String searchCategory(Model model) {
			
			
				List<CategoryDomain> list= cs.searchCategory();
				model.addAttribute("categoryList",list);
		
			
			return "admin/template/pages/categories/categories";    // views 그다음 폴더부터 쭈욱
		}//searchCategory
	 
	//category_detail(수정) 조회
		 @RequestMapping(value="/admin/categories_edit",method=GET)
			 public String adminCategoryDetail(Model model, int category_id) {
			 
			 
			 model.addAttribute("categoryDetail",cs.categoryDetail(category_id));
			 
			 
			 return "admin/template/pages/categories/categories-edit";    // views 그다음 폴더부터 쭈욱
		 }//adminCategoryDetail
		 
		 
		 //category_detail(수정)
		 @RequestMapping(value="/admin/categories/detail/edit",method=POST)
		public String modifyCategoryl(CategoryForm cForm) throws IOException {
			// public String modifyCategoryl(CategoryForm cForm) throws IOException {
			 
					
					  String thumbFile = fc.storeFile(cForm.getImage());
					  
					  CategoryDomain cDomain= new CategoryDomain();
					  
					  cDomain.setImage(thumbFile);
					  cDomain.setCategory_name(cForm.getCategory_name());
					  cDomain.setCategory_id(cForm.getCategory_id());
					  
					  System.out.println(cDomain.getCategory_name());
					  System.out.println(cDomain.getImage());
					  System.out.println(cDomain.getCategory_id());
					 
			 
			 cs.modifyCategory(cDomain);
			 
			 
			 return "redirect:/admin/categories";    // views 그다음 폴더부터 쭈욱
		 }//modifyCategoryl
		 
		 
		 //category 삭제
		 @RequestMapping(value="/admin/categories_status_edit",method=POST)
		 public String adminCategoryStatus( int category_id) {
			 
			 
			cs.modifyCategoryStatus(category_id);
			 
			 
			 return "redirect:/admin/categories";   // views 그다음 폴더부터 쭈욱
		 }//adminCategoryStatus
		 
		 
			//카테고리 추가 폼
			 @RequestMapping(value="/admin/category_add",method=GET) 
			  public String adminCategoryAddForm()  {
				 
			
		 
		  
		  return "admin/template/pages/categories/categories-add";
		  
		  }//adminCategoryAddForm
			 
			 
			 
			//카테고리 추가
			 @PostMapping("/admin/category_addBtn")
			  public String adminCategoryAdd(@ModelAttribute CategoryForm cForm) throws IOException {
				 
		
				 
				 
				 String thumbFile = fc.storeFile(cForm.getImage());
				 
				 CategoryDomain cDomain= new CategoryDomain();
				 
				 cDomain.setImage(thumbFile);
				cDomain.setCategory_name(cForm.getCategory_name());
				
				System.out.println("-------------------"+cForm.getCategory_name());
				System.out.println("-------------------"+cForm.getImage());
				System.out.println("-------------------"+cDomain.getCategory_name());
				System.out.println("-------------------"+cDomain.getImage());
				
				 cs.addCategory(cDomain);
				
		 
		  
		  return "redirect:/categories";
			 }//adminCategoryAdd
			 
			 
	 
	 
	 //Users 조회
	 @RequestMapping(value="/admin/users",method=GET)
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
	 @RequestMapping(value="/admin/user_delete",method=GET)
	 //public String adminUsers(Model model,@RequestParam("member_id") Integer member_id) {
	// public String adminUsers(Model model,HttpServletRequest hq, int member_id) {
		 public String adminUsersDetail(Model model, int member_id) {
		 
	//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
		 
		 model.addAttribute("userDetail",cs.userDetail(member_id));
		 
		 
		 return "admin/template/pages/users/users-edit";    // views 그다음 폴더부터 쭈욱
	 }//adminUsersDetail
	 
	 
		
		 //유저탈퇴시키기
		  
		  @RequestMapping(value="/admin/user_remove",method=POST) 
		 // public String adminUserRemove(int member_id,Model model) {
			  public String adminUserRemove(int member_id) {
		//  model.addAttribute("msg", "삭제하시겠습니까?");
		  cs.removeUser(member_id);
		  
		  return "redirect:/admin/users";
		  //redirect:http://localhost/goodstore/
		  }//adminUserRemove
		 	 
	 
	//주문 조회
		 @RequestMapping(value="/admin/orders",method=GET)
		 public String adminOrders(Model model,BoardVO bVO,String status) {
			 
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
				
				
				
				//전체 주문수 
				model.addAttribute("totalOrderCount",cs.searchOrdersCount2());
				status="C";
				model.addAttribute("totalOrderCCount",cs.searchordersCount1(status));
				model.addAttribute("todayOrderCCount",cs.searchTodayOrdersCount2(status));
				status="R";
				model.addAttribute("totalOrderRCount",cs.searchordersCount1(status));
				model.addAttribute("todayOrderRCount",cs.searchTodayOrdersCount2(status));
				status="N";
				model.addAttribute("totalOrderNCount",cs.searchordersCount1(status));
				model.addAttribute("todayOrderNCount",cs.searchTodayOrdersCount2(status));
				//오늘 주문수
				model.addAttribute("todayOrderCoount",cs.searchTodayOrdersCount());
				
				
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
		 @RequestMapping(value="/admin/order_detail",method=GET)
			 public String adminOrderDetail(Model model, OrdersDomain oDomain) {
			 
		//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
			 
			 model.addAttribute("orderDetail",cs.findOrderDetail(oDomain));
			 
			 
			 return "admin/template/pages/orders/orders-detail";    // views 그다음 폴더부터 쭈욱
		 }//adminOrderDetail
		 
		  
		 
		 //주문환불시키기
		 @RequestMapping(value="/admin/order_remove",method=POST) 
			  public String adminOrderRemove(int order_id) {
		
		  cs.removeOrder(order_id);
		  
		  return "redirect:/admin/orders";
		  //redirect:http://localhost/goodstore/
		  }//adminOrderRemove
		 
		 //로그인 폼 
		 @RequestMapping(value="/admin/login_form",method=GET) 
		  public String adminLoginForm(SessionStatus session, @SessionAttribute(required = false)String id) {
			 System.out.println("=======before"+id+"============");
			 System.out.println("=="+session.isComplete());
			 session.setComplete();
			 System.out.println("=="+session.isComplete());
			 System.out.println("=======after"+id+"============");
			 
	 
	  
	  return "admin/template/pages/account/admin-login";
	  //redirect:http://localhost/goodstore/
	  }//adminLoginForm
		 
		 //로그인  프로세스
		 @RequestMapping(value="/admin/login_form",method=POST) 
		  public String adminLoginPorcess(AdminVO avo, Model model,RedirectAttributes rttr) {
			 
			System.out.println(avo);
		AdminVO adVO=	 cs.isAdmin(avo);
		
		
		if(adVO == null) {
			int result=0;
			rttr.addFlashAttribute("result",result);
			return "redirect:/admin/login_form";
		}else {
			model.addAttribute("id", avo.getId());
			return "admin/template/admin_index";
			
		}
			 
	
	 
	  
	  //redirect:http://localhost/goodstore/
	  }//adminLoginForm
		 
		 //비밀번호 변경 폼
		 @RequestMapping(value="/admin/admin-setting",method=GET) 
		  public String adminModifyPasswordForm() {
			 
	 
	  
	  return "admin/template/pages/account/admin-setting";
	  //redirect:http://localhost/goodstore/
	  }//adminLoginForm
		 
		 
		 
		//비밀번호 변경
		  
		  @RequestMapping(value="/admin/modifyPaswword",method=POST) 
			  public String adminModifyPassword(String password) {
		  cs.modifyPassword(password);
		  
		  return "redirect:/admin_index";
		  }//adminModifyPassword
		 
		 
	
		 
	
	

}//class
