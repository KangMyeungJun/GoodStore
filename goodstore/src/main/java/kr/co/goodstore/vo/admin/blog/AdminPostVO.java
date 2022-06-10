package kr.co.goodstore.vo.admin.blog;

import java.util.List;

import lombok.Data;

@Data
public class AdminPostVO {
	
	private int blog_id;
	private String title;
	private String summary;
	private List<String> tagList;
	private String image;

}
