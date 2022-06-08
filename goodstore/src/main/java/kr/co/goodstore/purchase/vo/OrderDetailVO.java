package kr.co.goodstore.purchase.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderDetailVO {
	
	private int order_id,amount,item_id;
	private String status,refund_reason;

}
