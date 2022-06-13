package kr.co.goodstore.vo.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductCommentVO {

	private String review;
	private int item_id, member_id, star;
}
