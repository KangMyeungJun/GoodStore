package kr.co.goodstore.domain.admin.blog;

import java.util.List;

import lombok.Data;

@Data
public class AdminBlogDomain {
	
	private int blog_id;
	private String title;
	private String summary;
	private String image;
	private String upload_date;
	private List<AdminTagDomain> tags;
	

}
