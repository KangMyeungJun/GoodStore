package kr.co.goodstore.controller.admin.coupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.goodstore.domain.admin.coupon.AdminCouponDomain;
import kr.co.goodstore.paging.Paging;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.service.admin.coupon.AdminCouponCreate;
import kr.co.goodstore.service.admin.coupon.AdminCouponService;
import kr.co.goodstore.vo.admin.coupon.AdminCouponForm;
import kr.co.goodstore.vo.admin.coupon.AdminCouponVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin/coupon")
@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminCouponController {
	
	private final AdminCouponService acService;
	private final AdminCouponCreate create;
	
	@GetMapping("/")
	public String adminCoupon(
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(required=false)Integer p, 
			Model model) {
		
		Paging paging = new Paging(p, 10, 10, acService.findCouponsCnt(keyword));
		PagingVO pVO = new PagingVO(keyword, paging.getFirstRecord(), paging.getLastRecord());
		List<AdminCouponDomain> list =  acService.findAllCoupons(pVO);


		model.addAttribute("list", list);
		model.addAttribute("firstPage", paging.getFirstPage());
		model.addAttribute("lastPage", paging.getLastPage());
		model.addAttribute("isNext", paging.isNextPage());
		model.addAttribute("isPrev", paging.isPrevPage());
		model.addAttribute("nextPage", paging.getNextPage());
		model.addAttribute("prevPage", paging.getPrevPage());
		
		
		return "admin/template/pages/coupon/coupons";
	}
	
	@GetMapping("/{id}")
	public String adminCouponDetail (@PathVariable Integer id,Model model) {
		model.addAttribute("coupon", acService.findCouponById(id));
		return "admin/template/pages/coupon/coupon-edit";
	}
	@PostMapping("/{id}")
	public String adminAddCoupon (@PathVariable Integer id,@ModelAttribute AdminCouponForm form) {
		AdminCouponVO vo =  new AdminCouponVO();
		
		vo.setCode(form.getCode());
		vo.setName(form.getName());
		vo.setDiscount_price(form.getDiscount_price());
		vo.setDiscount_rate(form.getDiscount_rate());
		vo.setStart_date(form.getStart_date());
		vo.setEnd_date(form.getEnd_date());
		vo.setCoupon_id(id);
		log.info("vo is {}",vo);
		acService.addOneCoupon(vo);
		
		return "redirect:/admin/coupon/"+id;
	}
	
	@PostMapping("/delete/{id}")
	public String adminDeleteCoupon (@PathVariable Integer id) {
		acService.modifyCouponFlag(id);
		return "redirect:/admin/coupon/"+id;
	}
	
	@GetMapping("/add")
	public String adminAddCoupon () {
		
		
		
		return "admin/template/pages/coupon/coupon-add";
	}
	
	@PostMapping("/add")
	public String adminAddCouponPost (
			@ModelAttribute AdminCouponForm form,
			@RequestParam(defaultValue = "1") Integer number,
			@SessionAttribute String id) {
		
		AdminCouponVO vo = new AdminCouponVO();
		List<String> codeList = create.createdCouponList(number);
		
			vo.setCodeList(codeList);
			vo.setDiscount_price(form.getDiscount_price());
			vo.setDiscount_rate(form.getDiscount_rate());
			vo.setEnd_date(form.getEnd_date());
			vo.setName(form.getName());
			vo.setStart_date(form.getStart_date());
			vo.setAdmin_id(id);
			
			acService.addCoupons(vo);
			
		return "redirect:/admin/coupon/";
	}

}
