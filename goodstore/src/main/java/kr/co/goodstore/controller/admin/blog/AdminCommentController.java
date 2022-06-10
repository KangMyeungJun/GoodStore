package kr.co.goodstore.controller.admin.blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.domain.admin.blog.AdminBlogCommentDomain;
import kr.co.goodstore.domain.admin.blog.AdminBlogDomain;
import kr.co.goodstore.paging.Paging;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.service.admin.blog.AdminBlogService;
import kr.co.goodstore.vo.admin.blog.AdminPagingVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/comment")
@RequiredArgsConstructor
public class AdminCommentController {
	
	private final AdminBlogService abService;
	
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
		
		return "admin/template/pages/comments/comments";
	}
	
	@ResponseBody
	@GetMapping(value="/{id}",produces = "application/json; charset=utf8")
	public Map<String,Object> adminCommentDetail(@PathVariable Integer id,
			@RequestParam(required = false) Integer cp,
			Model model) {
		
		Paging paging = new Paging(cp, 4, 5, abService.findCommentsCnt(id));
		PagingVO pVO = new PagingVO("", paging.getFirstRecord(), paging.getLastRecord(),id);
		List<AdminBlogCommentDomain> list = abService.findCommentsById(pVO);
		
		AdminPagingVO apVO = new AdminPagingVO(paging.getFirstPage(),paging.getLastPage(),
				paging.isNextPage(),paging.isPrevPage(),paging.getNextPage(), paging.getPrevPage());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", apVO);
		
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("/delete/{id}")
	public void adminCommentRemove(@PathVariable Integer id) {
		abService.removeComment(id);
	}
	
	

}
