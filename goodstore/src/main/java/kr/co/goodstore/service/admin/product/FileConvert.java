package kr.co.goodstore.service.admin.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodstore.config.Common;

@Component

public class FileConvert {
	String fileDir = Common.FILE_DIR;
	
	public String getFullPath(String fileName) {
		return fileDir + fileName;
	}
	
	public List<String> storeFiles(List<MultipartFile> multipartFiles) throws IOException {
		List<String> storeFileResult = new ArrayList<String>();
		for (MultipartFile multipartFile : multipartFiles) {
			if(!multipartFile.isEmpty()) {
				storeFileResult.add(storeFile(multipartFile));
			}
		}
		return storeFileResult;
	}

	public String storeFile(MultipartFile multipartFile) throws IOException {
		if (multipartFile==null || multipartFile.isEmpty() ) {
			return null;
		}
		
		String originalFilename = multipartFile.getOriginalFilename();
		String storeFileName = createStoreFileName(originalFilename);
		multipartFile.transferTo(new File(getFullPath(storeFileName)));
		return storeFileName;
	}

	private String createStoreFileName(String originalFilename) {
		String ext = extractExt(originalFilename);
		String uuid = UUID.randomUUID().toString();
		return uuid+"."+ext;
	}

	private String extractExt(String originalFilename) {
		int pos = originalFilename.lastIndexOf(".");
		return originalFilename.substring(pos+1);
	}
	
}
