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
	 @RequestMapping(value="/selectCategory",method=GET)
		public String searchCategory(Model model) {
			
			
				List<CategoryDomain> list= cs.searchCategory();
				model.addAttribute("categoryList",list);
		
			
			return "admin/template/pages/categories/categories";    // views �״��� �������� �޿�
		}//searchCategory
	 
	//category_detail(����) ��ȸ
		 @RequestMapping(value="/categories_edit",method=GET)
			 public String adminCategoryDetail(Model model, int category_id) {
			 
			 
			 model.addAttribute("categoryDetail",cs.categoryDetail(category_id));
			 
			 
			 return "admin/template/pages/categories/categories-edit";    // views �״��� �������� �޿�
		 }//adminUsers
	 
	 
	 //Users ��ȸ
	 @RequestMapping(value="/users",method=GET)
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
	 @RequestMapping(value="/user_delete",method=GET)
	 //public String adminUsers(Model model,@RequestParam("member_id") Integer member_id) {
	// public String adminUsers(Model model,HttpServletRequest hq, int member_id) {
		 public String adminUsersDetail(Model model, int member_id) {
		 
	//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
		 
		 model.addAttribute("userDetail",cs.userDetail(member_id));
		 
		 
		 return "admin/template/pages/users/users-edit";    // views �״��� �������� �޿�
	 }//adminUsers
	 
	 
		
		 //����Ż���Ű��
		  
		  @RequestMapping(value="/user_remove",method=POST) 
		 // public String adminUserRemove(int member_id,Model model) {
			  public String adminUserRemove(int member_id) {
		//  model.addAttribute("msg", "�����Ͻðڽ��ϱ�?");
		  cs.removeUser(member_id);
		  
		  return "redirect:/users";
		  //redirect:http://localhost/goodstore/
		  }//adminUserRemove
		 	 
	 
	//�ֹ� ��ȸ
		 @RequestMapping(value="/orders",method=GET)
		 public String adminOrders(Model model,BoardVO bVO) {
			 
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
		 @RequestMapping(value="/order_detail",method=GET)
			 public String adminOrderDetail(Model model, int order_id) {
			 
		//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
			 
			 model.addAttribute("orderDetail",cs.findOrderDetail(order_id));
			 
			 
			 return "admin/template/pages/orders/orders-detail";    // views �״��� �������� �޿�
		 }//adminUsers
		 
		  
		 
		 //�ֹ�ȯ�ҽ�Ű��
		 @RequestMapping(value="/order_remove",method=POST) 
			  public String adminOrderRemove(int order_id) {
		
		  cs.removeOrder(order_id);
		  
		  return "redirect:/orders";
		  //redirect:http://localhost/goodstore/
		  }//adminUserRemove
		 
		 
	
	

}//class
