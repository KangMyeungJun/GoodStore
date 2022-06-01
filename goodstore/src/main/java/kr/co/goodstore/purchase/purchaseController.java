package kr.co.goodstore.purchase;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class purchaseController {

	
	@GetMapping("/cart")
	public String shoppingCart() {
		
		
		return "goodstore/purchase/cart";
	}
	
}
