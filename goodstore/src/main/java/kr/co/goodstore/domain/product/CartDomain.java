package kr.co.goodstore.domain.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CartDomain {
	private int item_id, cart_id, member_id, quantity;
}
