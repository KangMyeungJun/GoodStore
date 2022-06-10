package kr.co.goodstore.vo.admin.coupon;



import lombok.Data;

@Data
public class AdminCouponForm {
	
	private String code;
	private int coupon_id;
	private String name;
	private int discount_rate;
	private int discount_price;
	private String start_date;
	private String end_date;
}
