package kr.co.goodstore.vo.purchase;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemVO {
	
	private int item_id,price,stock,category_id,company_id;
	private String name,summary,description,upload_date, image,delete_flag,additional_info;
	

}
