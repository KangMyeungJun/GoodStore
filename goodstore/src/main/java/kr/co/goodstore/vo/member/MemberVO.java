package kr.co.goodstore.vo.member;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	private String email, password, name, tel, address, address2, ip, withdrawal_flag; 
	private int member_id, zipcode;
	private Date join_date;

}
