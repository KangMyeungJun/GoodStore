package kr.co.goodstore.service.admin.coupon;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class AdminCouponCreate {
	
	public List<String> createdCouponList(Integer number) {
		List<String> list = new ArrayList<String>();
		String couponName = "";
		for (int i = 0; i <number; i++) {
			couponName = UUID.randomUUID().toString();
			list.add(couponName);
		}
		return list;
	}
	
	

}
