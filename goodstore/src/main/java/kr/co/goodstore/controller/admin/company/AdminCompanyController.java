package kr.co.goodstore.controller.admin.company;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.domain.admin.company.AdminCompaniesDomain;
import kr.co.goodstore.paging.Paging;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.service.admin.company.AdminCompanyService;
import kr.co.goodstore.vo.admin.company.AdminCompanyForm;
import kr.co.goodstore.vo.admin.company.AdminCompanyVO;
import lombok.RequiredArgsConstructor;

@RequestMapping("/admin/company")
@Controller
@RequiredArgsConstructor
public class AdminCompanyController {
	
	private final AdminCompanyService acService;
	
	@GetMapping("/")
	public String adminCompany(
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(required=false)Integer p, 
			Model model) {
		Paging paging = new Paging(p, 10, 10, acService.findCntCompany(keyword));
		PagingVO pVO = new PagingVO(keyword, paging.getFirstRecord(), paging.getLastRecord());
		List<AdminCompaniesDomain> list =  acService.findCompanies(pVO);


		model.addAttribute("list", list);
		model.addAttribute("firstPage", paging.getFirstPage());
		model.addAttribute("lastPage", paging.getLastPage());
		model.addAttribute("isNext", paging.isNextPage());
		model.addAttribute("isPrev", paging.isPrevPage());
		model.addAttribute("nextPage", paging.getNextPage());
		model.addAttribute("prevPage", paging.getPrevPage());
		
		return "admin/template/pages/company/company";
	}
	
	@ResponseBody
	@PostMapping(value="/",produces = "application/json; charset=utf8")
	public void adminProductsAdd(
			AdminCompanyForm form) throws IOException {

		AdminCompanyVO aVO = new AdminCompanyVO();
		
		
		aVO.setName(form.getName());
		aVO.setType(form.getType());
		acService.addCompany(aVO);

		
	}
	
	@ResponseBody
	@GetMapping(value="/{id}",produces = "application/json; charset=utf8")
	public AdminCompaniesDomain adminPostDetail(@PathVariable Integer id) {
		AdminCompaniesDomain domain = acService.findOneCompany(id);
		return domain;
	}
	
	@ResponseBody
	@PostMapping(value="/{id}",produces = "application/json; charset=utf8")
	public void adminProductsEdit(
			AdminCompanyForm form,
			@PathVariable Integer id) throws IOException {
		
		AdminCompanyVO aVO = new AdminCompanyVO();
		
		aVO.setCompany_id(id);
		aVO.setName(form.getName());
		aVO.setType(form.getType());
		acService.modifyCompany(aVO);

		
	}
	
	@PostMapping("/delete/{id}")
	public String adminProductsRemove(@PathVariable Integer id) {
		acService.deleteCompany(id);
		
		return "redirect:/admin/company/";
	}

}
