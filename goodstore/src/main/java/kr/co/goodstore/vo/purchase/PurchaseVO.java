package kr.co.goodstore.vo.purchase;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseVO {
	
	public int member_id,total_price;
	private String addr,addr2,zipcode,address_flag,coupon_id;
	private String[] product,item_id,quantity;
	
}
