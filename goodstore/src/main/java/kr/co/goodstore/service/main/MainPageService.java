package kr.co.goodstore.service.main;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.main.MainPageDAO;
import kr.co.goodstore.domain.main.BlogDomain;
import kr.co.goodstore.domain.main.CategoryDomain;
import kr.co.goodstore.domain.main.ItemDomain;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainPageService {
	
	private final MainPageDAO mpDAO;
	
	public List<CategoryDomain> searchMainCatogory(){
		List<CategoryDomain> list = null;

		try {
			list = mpDAO.selectMainCatogory();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//searchMainCatogory
	
	public List<ItemDomain> searchBestItem(){
		List<ItemDomain> list = null;
		
		try {
			list = mpDAO.selectBestItem();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//searchBestItem
	
	public List<ItemDomain> searchItemStar(){
		List<ItemDomain> list = null;
		
		try {
			list = mpDAO.selectItemStar();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//searchItemStar
	
	public List<ItemDomain> searchRecentlyItem(){
		List<ItemDomain> list = null;
		
		try {
			list = mpDAO.selectRecentlyItem();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//findRecentlyItem
	
	public List<ItemDomain> searchPriceOrderItem(){
		List<ItemDomain> list = null;
		
		try {
			list = mpDAO.selectPriceOrderItem();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//findRecentlyItem
	
	public List<BlogDomain> searchMainCBlog(){
		List<BlogDomain> list = null;
		
		try {
			list = mpDAO.selectMainCBlog();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}//searchMainCBlog
	
}
