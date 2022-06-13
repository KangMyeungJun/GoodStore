package kr.co.goodstore.domain.admin;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


public class CategoryForm {
	private int category_id;
	private String category_name;
	private String upload_date;
	private String delete_flag;
	private MultipartFile image;
	
	
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "CategoryForm [category_id=" + category_id + ", category_name=" + category_name + ", upload_date="
				+ upload_date + ", delete_flag=" + delete_flag + ", image=" + image + "]";
	}
	
	
	
	
	

	
	
	
	
	

}
