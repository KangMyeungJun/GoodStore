package kr.co.goodstore.vo.admin.product;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminItemForm {
	private String item_name;
	private int stock;
	private int category;
	private int price;
	private List<String> sub_images;
	private String description;
	private String summary;
	private String additional_info;
	private int company_id;

}
