package kr.co.goodstore.domain.admin;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDomain {
	private int category_id;
	private String name, img, upload_date, delete_flag;
	
	@Override
	public String toString() {
		return "CategoryVO [category_id=" + category_id + ", name=" + name + ", img=" + img + ", upload_date="
				+ upload_date + ", delete_flag=" + delete_flag + "]";
	}
	
	
	

}
