package kr.co.goodstore.domain.admin.blog;

import lombok.Data;

@Data
public class AdminBlogCommentDomain {
	
	private int blog_comment_id;
	private String name;
	private String review;

}
