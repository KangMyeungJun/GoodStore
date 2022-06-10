package kr.co.goodstore.vo.admin.product;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminItemVO {
	private Integer item_id;
	private Integer category_id;
	private String item_name;
	private String description;
	private int price;
	private int stock;
	private String image;
	private List<String> image_list;
	private List<String> updateImageList;
	private String summary;
	private String additional_info;
	private int company_id;
	

}
