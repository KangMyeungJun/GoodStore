package kr.co.goodstore.vo.admin.coupon;



import java.util.List;

import lombok.Data;

@Data
public class AdminCouponVO {
	
	private String code;
	private List<String> codeList;
	private String name;
	private int discount_rate;
	private int discount_price;
	private String start_date;
	private String end_date;
	private String admin_id;
	private int coupon_id;
}
