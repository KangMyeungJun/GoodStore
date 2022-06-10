package kr.co.goodstore.controller.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.domain.product.ProductDomain;
import kr.co.goodstore.domain.product.ProductListDomain;
import kr.co.goodstore.service.admin.AdminService;
import kr.co.goodstore.service.product.ProductService;
import kr.co.goodstore.vo.product.ProductListVO;

@Controller
public class ProductController {
	@Autowired(required = false)
	private ProductService ps;
	@Autowired(required = false)
	private AdminService cs;

	@GetMapping("product")
	public String product(Model model, ProductListVO plVO) {
		
		model.addAttribute("productList", ps.productList(plVO));
		model.addAttribute("categoryList", cs.searchCategory());
		return "goodstore/purchase/product";
	}

	
	  @GetMapping("product_detail/{item_id}") 
	  public String productDetail(Model model, @PathVariable("item_id") int item_id) { 
		  model.addAttribute("productDetail", ps.productDetail(item_id)); 
		  model.addAttribute("subImageList", ps.subImageList(item_id)); 
		  model.addAttribute("productComment", ps.productComment(item_id));
		  
		  return "goodstore/purchase/product_detail"; 
	  }
	  
	  @GetMapping("quick_view.action")
	  @ResponseBody
	  public Map<String,Object> quickView(Model model, @RequestParam("item_id") int item_id) { 
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("productDetail", ps.productDetail(item_id));
		  map.put("subImageList", ps.subImageList(item_id));

		  return map;
	  }
	 

}
