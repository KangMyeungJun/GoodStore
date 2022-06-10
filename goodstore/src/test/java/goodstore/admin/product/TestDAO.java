package goodstore.admin.product;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import kr.co.goodstore.dao.admin.product.AdminProductDAO;
import kr.co.goodstore.vo.admin.product.AdminItemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestDAO {
	

	
	@Test
	public void testSelectCntProduct() throws Exception{
		AdminProductDAO dao = new AdminProductDAO();
		log.info("result = {}",dao.selectCntProducts(""));
	}
	
	@Test
	public void testInsertSubImage() throws Exception {
		AdminProductDAO dao = new AdminProductDAO();
		
		List<String> list = new ArrayList<String>();
		list.add("test.png");
		list.add("test1.png");
		list.add("test2.png");
		list.add("test3.png");
		list.add("test4.png");
		AdminItemVO aVO = new AdminItemVO();
		aVO.setItem_id(1);
		aVO.setUpdateImageList(list);
		dao.insertAdminSubImage(aVO);
	}

}
