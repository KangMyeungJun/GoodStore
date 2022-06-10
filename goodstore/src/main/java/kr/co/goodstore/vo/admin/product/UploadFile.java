package kr.co.goodstore.vo.admin.product;

import lombok.Data;

@Data
public class UploadFile {
	
	 private String uploadFileName;
	 private String storeFileName;
	 
	 public UploadFile(String uploadFileName, String storeFileName) {
		 this.uploadFileName = uploadFileName;
		 this.storeFileName = storeFileName;
	 }

}
