package kr.co.goodstore.purchase.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListDomain {

	private int item_id,order_id,price,amount, detail_id;
	private String image,item_name,status,order_date;
	
}
