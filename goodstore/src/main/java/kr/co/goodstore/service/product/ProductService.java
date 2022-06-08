package kr.co.goodstore.service.product;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.product.ProductDAO;
import kr.co.goodstore.domain.product.ProductDomain;
import kr.co.goodstore.domain.product.ProductListDomain;
import kr.co.goodstore.vo.product.ProductListVO;

@Component
public class ProductService {
	@Autowired(required = false)
	private ProductDAO pDAO;

	public List<ProductListDomain> productList(ProductListVO plVO){
			List<ProductListDomain> list=null;

		try {
			list=pDAO.productList(plVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}
		
		return list;
	}//productList
	
	public ProductDomain productDetail(int item_id){
		ProductDomain result=null;
		
		try {
			result=pDAO.productDetail(item_id);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return result;
	}//productDetail
}
