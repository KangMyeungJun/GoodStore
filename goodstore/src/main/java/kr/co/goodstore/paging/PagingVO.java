package kr.co.goodstore.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PagingVO {
	private String keyword;
	private int first;
	private int last;
	private int id;
	
	public PagingVO(String keyword, int first, int last) {
		this.keyword = keyword;
		this.first = first;
		this.last = last;
	}
	
	

}
