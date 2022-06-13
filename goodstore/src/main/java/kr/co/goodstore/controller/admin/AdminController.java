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

//@RequestMapping("/admin") //�̵��� �� �߰����ֱ�!!!
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
		//  ��ü����� ��
		  int userCount1=cs.searchUserCount1();
		//���ð����� ����� �Ѹ���
			int todayCount=cs.searchTodayCount();
			//��α� �� �Ѹ���
			int blogCount=cs.searchBlogCount();
			//���� �ۼ��� ��α� �� �Ѹ���
			int todayBlogCount=cs.searchTodayBlogCnt();
			//��ü ������ �� �Ѹ���
			int itemCount=cs.searchItemCount();
			//�Ϸ�� �ֹ� �� �Ѹ���
			int ordersCount=cs.searchOrdersCount();
			//�Ϸ�� �ֹ� �� �Ѹ���
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
	
	
	
	
	
	//ī�װ� ��ȸ
	 @RequestMapping(value="/admin/categories",method=GET)
		public String searchCategory(Model model) {
			
			
				List<CategoryDomain> list= cs.searchCategory();
				model.addAttribute("categoryList",list);
		
			
			return "admin/template/pages/categories/categories";    // views �״��� �������� �޿�
		}//searchCategory
	 
	//category_detail(����) ��ȸ
		 @RequestMapping(value="/admin/categories_edit",method=GET)
			 public String adminCategoryDetail(Model model, int category_id) {
			 
			 
			 model.addAttribute("categoryDetail",cs.categoryDetail(category_id));
			 
			 
			 return "admin/template/pages/categories/categories-edit";    // views �״��� �������� �޿�
		 }//adminCategoryDetail
		 
		 
		 //category_detail(����)
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
			 
			 
			 return "redirect:/admin/categories";    // views �״��� �������� �޿�
		 }//modifyCategoryl
		 
		 
		 //category ����
		 @RequestMapping(value="/admin/categories_status_edit",method=POST)
		 public String adminCategoryStatus( int category_id) {
			 
			 
			cs.modifyCategoryStatus(category_id);
			 
			 
			 return "redirect:/admin/categories";   // views �״��� �������� �޿�
		 }//adminCategoryStatus
		 
		 
			//ī�װ� �߰� ��
			 @RequestMapping(value="/admin/category_add",method=GET) 
			  public String adminCategoryAddForm()  {
				 
			
		 
		  
		  return "admin/template/pages/categories/categories-add";
		  
		  }//adminCategoryAddForm
			 
			 
			 
			//ī�װ� �߰�
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
			 
			 
	 
	 
	 //Users ��ȸ
	 @RequestMapping(value="/admin/users",method=GET)
	 public String adminUsers(Model model,BoardVO bVO) {
		 //��ü ����ڼ� �Ѹ���
		 int userCount1=cs.searchUserCount1();
		 //����� ��(��ü���ڵ��) �Ѹ���
		int userCount= cs.searchUserCount(bVO);
	//	model.addAttribute("userCnt",userCount);  
		//2. �� ȭ�鿡 ������ �Խù��� ��
		int pageScale = cs.pageScale();
		//3. �� ������ ��(����?)
		int pageCnt= cs.pageCnt(userCount, pageScale);
		//4. ���۹�ȣ
		int startNum= cs.startNum(bVO.getCurrentPage(), pageScale);
		//5. ����ȣ
		int endNum = cs.endNum(startNum, pageScale);
		
		bVO.setStartNum(startNum);
		bVO.setEndNum(endNum);
		
		model.addAttribute("userCount",userCount1);  // ���� �����������ϱ� ������
		model.addAttribute("totalCnt",userCount);  // ���� �����������ϱ� ������
		model.addAttribute("pageScale",pageScale);  // ���� �����������ϱ� ������
		model.addAttribute("pageCnt",pageCnt);  // ���� �����������ϱ� ������
		model.addAttribute("startNum",startNum);  // ���� �����������ϱ� ������
		model.addAttribute("endNum",endNum);  // ���� �����������ϱ� ������
		model.addAttribute("currentPage",bVO.getCurrentPage());  //  �갡 ������ �ֱٻ�������, ������ ���� ����
		
		//���ð����� ����� �Ѹ���
		int todayCount=cs.searchTodayCount();
		model.addAttribute("todayCnt",todayCount);  
		
		
		 //user �Ѹ���
		 List<MemberDomain> list= cs.findAllMember(bVO);
		 model.addAttribute("usersList",list);
		 
		 
		 return "admin/template/pages/users/users";    // views �״��� �������� �޿�
	 }//adminUsers
	 
	 
	 //user_detail(����) ��ȸ
	 @RequestMapping(value="/admin/user_delete",method=GET)
	 //public String adminUsers(Model model,@RequestParam("member_id") Integer member_id) {
	// public String adminUsers(Model model,HttpServletRequest hq, int member_id) {
		 public String adminUsersDetail(Model model, int member_id) {
		 
	//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
		 
		 model.addAttribute("userDetail",cs.userDetail(member_id));
		 
		 
		 return "admin/template/pages/users/users-edit";    // views �״��� �������� �޿�
	 }//adminUsersDetail
	 
	 
		
		 //����Ż���Ű��
		  
		  @RequestMapping(value="/admin/user_remove",method=POST) 
		 // public String adminUserRemove(int member_id,Model model) {
			  public String adminUserRemove(int member_id) {
		//  model.addAttribute("msg", "�����Ͻðڽ��ϱ�?");
		  cs.removeUser(member_id);
		  
		  return "redirect:/admin/users";
		  //redirect:http://localhost/goodstore/
		  }//adminUserRemove
		 	 
	 
	//�ֹ� ��ȸ
		 @RequestMapping(value="/admin/orders",method=GET)
		 public String adminOrders(Model model,BoardVO bVO,String status) {
			 
			 //1.�ֹ���(��ü ���ڵ� �� ) �Ѹ���
			 int totalCnt=cs.searchOrdersCount(bVO);
			//2. �� ȭ�鿡 ������ �Խù��� ��
				int pageScale = cs.pageScale();
				//3. �� ������ ��(����?)
				int pageCnt= cs.pageCnt(totalCnt, pageScale);
				//4. ���۹�ȣ
				int startNum= cs.startNum(bVO.getCurrentPage(), pageScale);
				//5. ����ȣ
				int endNum = cs.endNum(startNum, pageScale);
				
				
				
				//��ü �ֹ��� 
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
				//���� �ֹ���
				model.addAttribute("todayOrderCoount",cs.searchTodayOrdersCount());
				
				
				bVO.setStartNum(startNum);
				bVO.setEndNum(endNum);
				
				model.addAttribute("totalCnt",totalCnt);  // ���� �����������ϱ� ������
				model.addAttribute("pageScale",pageScale);  // ���� �����������ϱ� ������
				model.addAttribute("pageCnt",pageCnt);  // ���� �����������ϱ� ������
				model.addAttribute("startNum",startNum);  // ���� �����������ϱ� ������
				model.addAttribute("endNum",endNum);  // ���� �����������ϱ� ������
				model.addAttribute("currentPage",bVO.getCurrentPage());  //  �갡 ������ �ֱٻ�������, ������ ���� ����
			 
			 
			 List<OrdersDomain> list= cs.findOrders(bVO);
			 model.addAttribute("ordersList",list);
			 
			 
			 return "admin/template/pages/orders/orders";    // views �״��� �������� �޿�
		 }//adminOrders
		 
		 
		 //order_detail ��ȸ
		 @RequestMapping(value="/admin/order_detail",method=GET)
			 public String adminOrderDetail(Model model, OrdersDomain oDomain) {
			 
		//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
			 
			 model.addAttribute("orderDetail",cs.findOrderDetail(oDomain));
			 
			 
			 return "admin/template/pages/orders/orders-detail";    // views �״��� �������� �޿�
		 }//adminOrderDetail
		 
		  
		 
		 //�ֹ�ȯ�ҽ�Ű��
		 @RequestMapping(value="/admin/order_remove",method=POST) 
			  public String adminOrderRemove(int order_id) {
		
		  cs.removeOrder(order_id);
		  
		  return "redirect:/admin/orders";
		  //redirect:http://localhost/goodstore/
		  }//adminOrderRemove
		 
		 //�α��� �� 
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
		 
		 //�α���  ���μ���
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
		 
		 //��й�ȣ ���� ��
		 @RequestMapping(value="/admin/admin-setting",method=GET) 
		  public String adminModifyPasswordForm() {
			 
	 
	  
	  return "admin/template/pages/account/admin-setting";
	  //redirect:http://localhost/goodstore/
	  }//adminLoginForm
		 
		 
		 
		//��й�ȣ ����
		  
		  @RequestMapping(value="/admin/modifyPaswword",method=POST) 
			  public String adminModifyPassword(String password) {
		  cs.modifyPassword(password);
		  
		  return "redirect:/admin_index";
		  }//adminModifyPassword
		 
		 
	
		 
	
	

}//class
