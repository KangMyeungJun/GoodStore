package kr.co.goodstore.controller.admin.product;

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
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodstore.domain.admin.product.AdminCategoryDomain;
import kr.co.goodstore.domain.admin.product.AdminCompanyDomain;
import kr.co.goodstore.domain.admin.product.AdminItemDomain;
import kr.co.goodstore.paging.Paging;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.service.admin.product.AdminProductService;
import kr.co.goodstore.service.admin.product.FileConvert;
import kr.co.goodstore.vo.admin.product.AdminItemForm;
import kr.co.goodstore.vo.admin.product.AdminItemVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RequestMapping("/admin/products")
@Slf4j
@Controller
public class AdminProductController {
	
	private final AdminProductService apService;
	private final FileConvert fc;
	
	@GetMapping("/")
	public String adminProducts(
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(required=false)Integer p, 
			Model model) {
		
		Paging paging = new Paging(p, 10, 10, apService.findItemCnt(keyword));
		PagingVO pVO = new PagingVO(keyword, paging.getFirstRecord(), paging.getLastRecord());
		List<AdminItemDomain> list =  apService.findItem(pVO);
		List<AdminCategoryDomain> categoryList = apService.findAllCategory();
		List<AdminCompanyDomain> companyList = apService.findAllCompany();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("list", list);
		model.addAttribute("firstPage", paging.getFirstPage());
		model.addAttribute("lastPage", paging.getLastPage());
		model.addAttribute("isNext", paging.isNextPage());
		model.addAttribute("isPrev", paging.isPrevPage());
		model.addAttribute("nextPage", paging.getNextPage());
		model.addAttribute("prevPage", paging.getPrevPage());
		
		return "admin/template/pages/products/products";
	}
	
	@ResponseBody
	@GetMapping(value="/{id}",produces = "application/json; charset=utf8")
	public AdminItemDomain adminProductsDetail(@PathVariable Integer id) {
		AdminItemDomain domain = apService.findOneItem(id);
		return domain;
	}
	
	@ResponseBody
	@PostMapping(value="/{id}",produces = "application/json; charset=utf8")
	public String adminProductsEdit(@RequestParam(required = false) List<MultipartFile> sub_image,
			AdminItemForm adminItemForm,
			@RequestParam(required = false) MultipartFile file1,
			@PathVariable Integer id) throws IOException {
		
		List<String> sub_images = null;
		
		String thumbFile = fc.storeFile(file1);
		if (!sub_image.isEmpty()) {
			 sub_images = fc.storeFiles(sub_image);
		}
		
		AdminItemVO aVO = new AdminItemVO();
		aVO.setAdditional_info(adminItemForm.getAdditional_info());
		aVO.setCategory_id(adminItemForm.getCategory());
		aVO.setDescription(adminItemForm.getDescription());
		aVO.setImage(thumbFile);
		aVO.setImage_list(adminItemForm.getSub_images());
		aVO.setItem_id(id);
		aVO.setItem_name(adminItemForm.getItem_name());
		aVO.setPrice(adminItemForm.getPrice());
		aVO.setStock(adminItemForm.getStock());
		aVO.setSummary(adminItemForm.getSummary());
		aVO.setUpdateImageList(sub_images);
		log.info("VO is {}",aVO);
		apService.modifyItemById(aVO);

		
		
		
		return "ok";
	}
	
	@ResponseBody
	@PostMapping(value="/",produces = "application/json; charset=utf8")
	public String adminProductsAdd(@RequestParam(required = false) List<MultipartFile> sub_image,
			AdminItemForm adminItemForm,
			@RequestParam(required = false) MultipartFile file1) throws IOException {
		
		List<String> sub_images = null;
		
		String thumbFile = fc.storeFile(file1);
		if (!sub_image.isEmpty()) {
			sub_images = fc.storeFiles(sub_image);
		}
		
		AdminItemVO aVO = new AdminItemVO();
		aVO.setCompany_id(adminItemForm.getCompany_id());
		aVO.setAdditional_info(adminItemForm.getAdditional_info());
		aVO.setCategory_id(adminItemForm.getCategory());
		aVO.setDescription(adminItemForm.getDescription());
		aVO.setImage(thumbFile);
		aVO.setImage_list(adminItemForm.getSub_images());
		aVO.setItem_name(adminItemForm.getItem_name());
		aVO.setPrice(adminItemForm.getPrice());
		aVO.setStock(adminItemForm.getStock());
		aVO.setSummary(adminItemForm.getSummary());
		aVO.setUpdateImageList(sub_images);
		log.info("VO is {}",aVO);
		apService.addItem(aVO);
		apService.addSubImage(aVO);
		

	
		return "ok";
	}
	
	@ResponseBody
	@PostMapping("/delete/{id}")
	public String adminProductsRemove(@PathVariable Integer id) {
		apService.modifyItemFlag(id);
		
		return "ok";
	}
	


}
