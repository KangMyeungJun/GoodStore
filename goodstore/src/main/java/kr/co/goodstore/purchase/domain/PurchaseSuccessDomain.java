package kr.co.goodstore.purchase.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PurchaseSuccessDomain {
	private int item_id;
	private String image,item_name,amount;
	
}