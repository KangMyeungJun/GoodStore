package kr.co.goodstore.domain.product;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductCommentDomain {
	private int item_id, star;
	private String review, upload_date, email;
}
