package kr.co.goodstore.domain.admin.coupon;

import lombok.Data;

@Data
public class AdminCouponDomain { 
	private String code;
	private int coupon_id;
	private String name;
	private int discount_rate;
	private int discount_price;
	private String upload_date;
	private String start_date;
	private String end_date;
	private String use_flag;

}
