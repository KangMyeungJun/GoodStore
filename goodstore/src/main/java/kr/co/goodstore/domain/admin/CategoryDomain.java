package kr.co.goodstore.domain.admin;

import lombok.Getter;
import lombok.Setter;


public class CategoryDomain {
	private int category_id;
	private String category_name, image, upload_date, delete_flag;
	
	
	
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



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
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



	@Override
	public String toString() {
		return "CategoryDomain [category_id=" + category_id + ", category_name=" + category_name + ", image=" + image
				+ ", upload_date=" + upload_date + ", delete_flag=" + delete_flag + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	

}
