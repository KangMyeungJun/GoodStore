package kr.co.goodstore.vo.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductListVO {
	String keyword, sort;
	int category_id, item_count;

	public ProductListVO() {
		this.item_count = 8;
	}
	
}
