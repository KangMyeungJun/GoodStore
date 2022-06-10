package kr.co.goodstore.domain.admin.blog;

import lombok.Data;

@Data
public class AdminTagDomain {
	
	private int blog_tag_id;
	private String name;
	private int blog_id;
}
