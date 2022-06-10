package kr.co.goodstore.domain.main;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemDomain {

	private String item_name, image;
	private int price, star;
	
}
