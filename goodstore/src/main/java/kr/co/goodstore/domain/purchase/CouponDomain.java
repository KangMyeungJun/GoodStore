package kr.co.goodstore.domain.purchase;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponDomain {

	private int discount_rate, discount_price, coupon_id;
	private String name, start_date, end_date;

}
