package kr.co.goodstore.domain.purchase;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemDomain {

	private int item_id, price, quantity, cart_id;
	private String item_name, image;

}
