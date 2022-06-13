package kr.co.goodstore.dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
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
public class ProductDAO {
	private String namespace="kr.co.goodstore.mapper.product.ProductMapper.";
	public List<ProductListDomain> productList(ProductListVO plVO){
	
			List<ProductListDomain> list=null;
			
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			list=ss.selectList(namespace+"productList", plVO);
			
			if(ss!=null) {ss.close();}
			return list;
	}
	
	public ProductDomain productDetail(int item_id){
		
		ProductDomain result=null;
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		result=ss.selectOne(namespace+"productDetail", item_id);
		
		if(ss!=null) {ss.close();}
		return result;
	}
	
	public List<SubImageDomain> subImageList(int item_id){
		List<SubImageDomain> list = null;
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		list=ss.selectList(namespace+"subImage", item_id);
		
		if(ss!=null) {ss.close();}
		return list;
	}
	
	public List<ProductCategoryDomain> productCategory(){
		List<ProductCategoryDomain> list=null;
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		list=ss.selectList(namespace+"productCategory");
		
		if(ss!=null) {ss.close();}
		return list;		
	}
	
	public List<ProductListDomain> relatedProducts(int category_id){
		
		List<ProductListDomain> list=null;
		
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		list=ss.selectList(namespace+"relatedProducts", category_id);
		
		if(ss!=null) {ss.close();}
		return list;
	}
	
	public List<ProductCommentDomain> productComment(int item_id){
		List<ProductCommentDomain> list=null;
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		list=ss.selectList(namespace+"productComment", item_id);
		
		if(ss!=null) {ss.close();}
		return list;
	}
	
	public void addProductComment(ProductCommentVO comment) throws Exception{
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert(namespace+"productCommentAdd", comment);
		ss.commit();
		if(ss!=null) {ss.close();}
	}
	
	public void addCart(AddCartVO cart) throws Exception{
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert(namespace+"addCart", cart);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	
	public void addWish(AddWishVO wishVO) throws Exception{
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert(namespace+"addWish", wishVO);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	
	public void deleteWish(AddWishVO wishVO) throws Exception{
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert(namespace+"deleteWish", wishVO);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	
	public List<WishListDomain> selectWish(AddWishVO wishVO){
		List<WishListDomain> list=null;
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList(namespace+"selectWish", wishVO);
		if(ss!=null) {ss.close();}	
		return list;
	}
	
	public List<WishListDomain> selectWishList(int member_id){
		List<WishListDomain> list=null;
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList(namespace+"selectWishList", member_id);
		if(ss!=null) {ss.close();}	
		return list;
	}
	
	
}
