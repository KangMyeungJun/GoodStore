package kr.co.goodstore.service.main;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.main.MainPageDAO;
import kr.co.goodstore.domain.main.BlogDomain;
import kr.co.goodstore.domain.main.CategoryDomain;
import kr.co.goodstore.domain.main.ItemDomain;

@Component
public class MainPageService {
	
	@Autowired(required = false)
	private MainPageDAO mpDAO;
	
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
