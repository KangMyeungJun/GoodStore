package kr.co.goodstore.controller.admin.blog;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodstore.domain.admin.blog.AdminBlogDomain;
import kr.co.goodstore.paging.Paging;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.service.admin.blog.AdminBlogService;
import kr.co.goodstore.service.admin.product.FileConvert;
import kr.co.goodstore.vo.admin.blog.AdminPostForm;
import kr.co.goodstore.vo.admin.blog.AdminPostVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/posts")
@RequiredArgsConstructor
@Slf4j
public class AdminBlogController {
	
	private final AdminBlogService abService;
	private final FileConvert fc;
	
	@GetMapping("/")
	public String adminPosts(
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(required=false)Integer p, 
			Model model) {
		
		Paging paging = new Paging(p, 10, 10, abService.findPostsCnt(keyword));
		PagingVO pVO = new PagingVO(keyword, paging.getFirstRecord(), paging.getLastRecord());
		List<AdminBlogDomain> list =  abService.findPosts(pVO);


		model.addAttribute("list", list);
		model.addAttribute("firstPage", paging.getFirstPage());
		model.addAttribute("lastPage", paging.getLastPage());
		model.addAttribute("isNext", paging.isNextPage());
		model.addAttribute("isPrev", paging.isPrevPage());
		model.addAttribute("nextPage", paging.getNextPage());
		model.addAttribute("prevPage", paging.getPrevPage());
		
		return "admin/template/pages/posts/posts";
	}
	
	@ResponseBody
	@GetMapping(value="/{id}",produces = "application/json; charset=utf8")
	public AdminBlogDomain adminPostDetail(@PathVariable Integer id) {
		AdminBlogDomain domain = abService.findOnePost(id);
		return domain;
	}
	
	@ResponseBody
	@PostMapping(value="/{id}",produces = "application/json; charset=utf8")
	public String adminProductsEdit(
			AdminPostForm adminPostForm,
			@RequestParam(required = false) MultipartFile file1,
			@PathVariable Integer id) throws IOException {
		

		List<String> list = adminPostForm.getTagList();
		Set<String> set = new HashSet<String>(list);
		List<String> tagList = new ArrayList<String>(set);
		
		String thumbFile = fc.storeFile(file1);

		AdminPostVO aVO = new AdminPostVO();

		aVO.setBlog_id(id);
		aVO.setImage(thumbFile);

		aVO.setSummary(adminPostForm.getSummary());
		aVO.setTitle(adminPostForm.getTitle());
		aVO.setTagList(tagList);
		log.info("VO is {}",aVO);
		abService.modifyPost(aVO);

		
		
		
		return "ok";
	}
	@ResponseBody
	@PostMapping(value="/",produces = "application/json; charset=utf8")
	public String adminProductsAdd(
			AdminPostForm adminPostForm,
			@RequestParam(required = false) MultipartFile file1
			) throws IOException {
		
		
		List<String> list = adminPostForm.getTagList();
		Set<String> set = new HashSet<String>(list);
		List<String> tagList = new ArrayList<String>(set);
		
		String thumbFile = fc.storeFile(file1);
		
		AdminPostVO aVO = new AdminPostVO();
		
		aVO.setImage(thumbFile);
		
		aVO.setSummary(adminPostForm.getSummary());
		aVO.setTitle(adminPostForm.getTitle());
		aVO.setTagList(tagList);
		log.info("VO is {}",aVO);
		abService.addPost(aVO);
		
		return "ok";
	}
	
	@PostMapping("/delete/{id}")
	public String adminProductsRemove(@PathVariable Integer id) {
		abService.modifyPostStatus(id);
		
		return "redirect:/admin/posts/";
	}
	

}
