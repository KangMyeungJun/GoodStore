package kr.co.goodstore.domain.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductDomain {
	private int item_id;
	private String item_name, summary, description, price, image, additional_info, 
	sub_image, com_name, com_type, category_name;
}
