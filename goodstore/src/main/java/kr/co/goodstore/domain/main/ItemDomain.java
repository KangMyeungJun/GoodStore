package kr.co.goodstore.domain.main;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemDomain {

	private String item_name; 
	private String image;
	private int item_id;
	private int price; 
	private int star;
	
}
