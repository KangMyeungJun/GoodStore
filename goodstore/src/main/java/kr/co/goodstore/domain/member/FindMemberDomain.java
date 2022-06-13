package kr.co.goodstore.domain.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FindMemberDomain {

	private String password,email;
}
