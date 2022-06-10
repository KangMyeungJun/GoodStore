package kr.co.goodstore.domain.admin.product;

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
public class AdminItemDomain {
	private String item_id;
	private String category_id;
	private String category_name;
	private String item_name;
	private int price;
	private int stock;
	private String image;
	private List<String> sub_image;
	private String summary;
	private String additional_info;
	private String description;


}
