package kr.co.goodstore.domain.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductListDomain {
	private String item_name, image, upload_date, com_name, com_type, category_name;
	int rnum, item_id, price, wish_count;
	
	
}
