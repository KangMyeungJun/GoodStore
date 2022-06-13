package kr.co.goodstore.domain.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class WishListDomain {
	private int item_id, member_id, wishlist_id, category_id, price;
	private String item_name, image, delete_flag, com_name, com_type, category_name;
}
