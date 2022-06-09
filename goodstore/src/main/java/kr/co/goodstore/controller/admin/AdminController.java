package kr.co.goodstore.controller.admin;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;
import kr.co.goodstore.service.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired(required = false)
	private AdminService cs;
	
	//카테고리 조회
	 @RequestMapping(value="/selectCategory",method=GET)
		public String searchCategory(Model model) {
			
			
				List<CategoryDomain> list= cs.searchCategory();
				model.addAttribute("categoryList",list);
		
			
			return "admin/template/pages/categories/categories";    // views 그다음 폴더부터 쭈욱
		}//searchCategory
	 
	 //Users 조회
	 @RequestMapping(value="/users",method=GET)
	 public String adminUsers(Model model) {
		 
		 
		 List<MemberDomain> list= cs.findAllMember();
		 model.addAttribute("usersList",list);
		 
		 
		 return "admin/template/pages/users/users";    // views 그다음 폴더부터 쭈욱
	 }//adminUsers
	 
	 
	 //user_detail 조회
	 @RequestMapping(value="/user_delete",method=GET)
	 //public String adminUsers(Model model,@RequestParam("member_id") Integer member_id) {
	// public String adminUsers(Model model,HttpServletRequest hq, int member_id) {
		 public String adminUsers(Model model, int member_id) {
		 
	//	 member_id=Integer.parseInt(hq.getParameter("member_id"));
		 
		 System.out.println("========="+member_id);
		 model.addAttribute("userDetail",cs.userDetail(member_id));
		 
		 
		 return "admin/template/pages/users/users-edit";    // views 그다음 폴더부터 쭈욱
	 }//adminUsers
	
	

}//class
