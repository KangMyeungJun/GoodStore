package kr.co.goodstore.vo.admin.blog;

import java.util.List;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminPostForm {
	
	private String title;
	private String summary;
	private List<String> tagList;


}
