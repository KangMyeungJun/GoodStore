package kr.co.goodstore.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

	@GetMapping("product")
	public String product() {
		return "goodstore/purchase/product";
	}
}
