package kr.co.goodstore.service.product;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.product.ProductDAO;
import kr.co.goodstore.domain.product.ProductCategoryDomain;
import kr.co.goodstore.domain.product.ProductCommentDomain;
import kr.co.goodstore.domain.product.ProductDomain;
import kr.co.goodstore.domain.product.ProductListDomain;
import kr.co.goodstore.domain.product.SubImageDomain;
import kr.co.goodstore.domain.product.WishListDomain;
import kr.co.goodstore.vo.product.AddCartVO;
import kr.co.goodstore.vo.product.AddWishVO;
import kr.co.goodstore.vo.product.ProductCommentVO;
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

	public List<SubImageDomain> subImageList(int item_id){
		List<SubImageDomain> list=null;

		try {
			list=pDAO.subImageList(item_id);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}

		return list;
	}//subImageList
	
	public List<ProductCategoryDomain> productCategory(){
		List<ProductCategoryDomain> list=null;

		try {
			list=pDAO.productCategory();
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}

		return list;
	}//subImageList

	public List<ProductListDomain> relatedProducts(int category_id){
		List<ProductListDomain> list=null;

		try {
			list=pDAO.relatedProducts(category_id);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}

		return list;
	}//relatedProducts
	
	public List<ProductCommentDomain> productComment(int item_id){
		List<ProductCommentDomain> list=null;

		try {
			list=pDAO.productComment(item_id);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}

		return list;
	}//productComment
	
	public void addProductComment(ProductCommentVO comment) throws Exception{
		pDAO.addProductComment(comment);
	}
	
	public void addCart(AddCartVO cart) throws Exception{
		pDAO.addCart(cart);
	}
	
	public void addWish(AddWishVO wishVO) throws Exception{
		pDAO.addWish(wishVO);
	}	
	
	public void removeWish(AddWishVO wishVO) throws Exception{
		pDAO.deleteWish(wishVO);
	}
	
	public List<WishListDomain> searcWish(AddWishVO wishVO){
		List<WishListDomain> list=null;

		try {
			list=pDAO.selectWish(wishVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}
		return list;
	}
	
	public List<WishListDomain> searcWishList(int member_id){
		List<WishListDomain> list=null;
		
		try {
			list=pDAO.selectWishList(member_id);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}
		return list;
	}
	

	

}
