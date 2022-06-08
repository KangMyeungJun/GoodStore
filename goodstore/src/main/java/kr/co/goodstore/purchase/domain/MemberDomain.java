package kr.co.goodstore.purchase.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDomain {

	private int member_id,zipcode;
	private String name,tel,address,address2;
}
