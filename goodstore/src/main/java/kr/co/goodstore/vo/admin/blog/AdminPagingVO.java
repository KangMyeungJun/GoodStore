package kr.co.goodstore.vo.admin.blog;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AdminPagingVO {
	private int firstPage;
	private int lastPage;
	private boolean nextPages;
	private boolean prevPages;
	private int nextPage;
	private int prevPage;
}
