package kr.co.goodstore.controller.product;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodstore.domain.product.CartDomain;
import kr.co.goodstore.domain.product.WishListDomain;
import kr.co.goodstore.purchase.CartController;
import kr.co.goodstore.purchase.domain.ItemDomain;
import kr.co.goodstore.purchase.vo.CartListVO;
import kr.co.goodstore.service.product.ProductService;
import kr.co.goodstore.service.purchase.CartService;
import kr.co.goodstore.vo.member.MemberVO;
import kr.co.goodstore.vo.product.AddCartVO;
import kr.co.goodstore.vo.product.AddWishVO;
import kr.co.goodstore.vo.product.ProductCommentVO;
import kr.co.goodstore.vo.product.ProductListVO;

@Controller
public class ProductController {
	@Autowired(required = false)
	private ProductService ps;
	
	@GetMapping("product")
	public String product(Model model, ProductListVO plVO) {
		model.addAttribute("productList", ps.productList(plVO));
		model.addAttribute("categoryList", ps.productCategory());
		return "goodstore/purchase/product";
	}

	@GetMapping("product_detail/{category_id}/{item_id}")
	public String productDetail(Model model, @PathVariable("category_id") int category_id, @PathVariable("item_id") int item_id) {
		model.addAttribute("productDetail", ps.productDetail(item_id));
		model.addAttribute("subImageList", ps.subImageList(item_id));
		model.addAttribute("productComment", ps.productComment(item_id));
		model.addAttribute("relatedProducts", ps.relatedProducts(category_id));

		return "goodstore/purchase/product_detail";
	}

	
	@GetMapping("quick_view.action")
	public String quickView(Model model, @RequestParam("item_id") int item_id) {
		model.addAttribute("productDetail", ps.productDetail(item_id));
		model.addAttribute("subImageList", ps.subImageList(item_id));

		return "goodstore/common/quick_view";
	}


	@PostMapping("load_more.action")
	public String loadMore(Model model, ProductListVO plVO){
		model.addAttribute("productList", ps.productList(plVO));
		return "goodstore/purchase/product_content";
	}
	
	@PostMapping("add_comment.action")
	public String addComment(ProductCommentVO comment, Model model, HttpSession session) throws Exception{

		Integer member = (Integer)session.getAttribute("loginSession");
		if (member != null) {
			comment.setMember_id(member);
			ps.addProductComment(comment);
		}
		
		model.addAttribute("productComment", ps.productComment(comment.getItem_id()));
		return "goodstore/purchase/comment_content";
	}
	
	
	@PostMapping("add_cart.action")
	@ResponseBody
	public int addCart(AddCartVO cartVO, HttpSession session) throws Exception {
		int result = 0;
		Integer member_id = (Integer)session.getAttribute("loginSession");

		if(member_id != null) {
			cartVO.setMember_id(member_id);
			List<CartDomain> list = ps.searchOneCart(cartVO);
			
			if(!list.isEmpty()) {
				ps.modifyCart(cartVO);
			}else{
				ps.addCart(cartVO);
			}
			result = 1;
		}		
		return result;
	}
	
	@PostMapping("add_wish.action")
	@ResponseBody
	public int addWish(AddWishVO wishVO, HttpSession session) throws Exception {
		int result = 0;
		Integer member_id = (Integer)session.getAttribute("loginSession");

		if(member_id != null) {
			wishVO.setMember_id(member_id);
			List<WishListDomain> list = ps.searcWish(wishVO);
			if(list.isEmpty()) {
				ps.addWish(wishVO);
				result = 1;
			}else {
				ps.removeWish(wishVO);
				result = 2;
			}
		}
		return result;
	}
	
	@GetMapping("wishlist")
	public String wishlist(Model model, @RequestParam("member_id")int member_id) {
		
		model.addAttribute("categoryList", ps.productCategory());
		model.addAttribute("wishlist", ps.searcWishList(member_id));
		
		return "goodstore/purchase/wishlist";
	}
	
}
