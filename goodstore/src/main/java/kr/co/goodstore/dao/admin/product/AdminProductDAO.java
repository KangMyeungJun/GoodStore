package kr.co.goodstore.dao.admin.product;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.product.AdminCategoryDomain;
import kr.co.goodstore.domain.admin.product.AdminCompanyDomain;
import kr.co.goodstore.domain.admin.product.AdminItemDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.product.AdminItemVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminProductDAO {
	public int selectCntProducts(String keyword) throws PersistenceException {
		int cnt = 0;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		cnt = ss.selectOne("selectCntProducts", keyword);
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	public List<AdminItemDomain> selectItem(PagingVO pVO) throws PersistenceException{
		List<AdminItemDomain> list = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectAdminProducts", pVO);
		
		if (ss != null) {ss.close();}
		
		return list;
	}
	
	public AdminItemDomain selectOneItem(Integer itemId) throws PersistenceException{
		AdminItemDomain domain = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		domain = ss.selectOne("selectOneItem", itemId);
		if(ss!=null) {ss.close();}
		
		return domain;
	}
	
	public List<String> selectItemImages(Integer itemId) throws PersistenceException {
		List<String> list = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectItemImages", itemId);
		if(ss!=null) {ss.close();}
		return list;
	}
	
	public List<AdminCategoryDomain> selectAllCategory() throws PersistenceException {
		List<AdminCategoryDomain> list = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectCategories");
		if(ss!=null) {ss.close();}
		return list;
	}
	public List<AdminCompanyDomain> selectAllCompany() throws PersistenceException {
		List<AdminCompanyDomain> list = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectCompany");
		if(ss!=null) {ss.close();}
		return list;
	}
	
	public void updateAdminItem(AdminItemVO aVO) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		log.info("update cnt = {}",ss.update("updateItem", aVO));
		ss.commit();
		if(ss!=null) {ss.close();}
		
	}
	
	public void deleteAdminSubImage(String subImage) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.delete("deleteSubImage", subImage);
		ss.commit();
		if(ss!=null) {ss.close();}
	}
	
	public void insertAdminSubImage(AdminItemVO aVO) throws PersistenceException {
		log.info("imageInsertStrart");
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertSubImage", aVO);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	
	public void insertNewAdminSubImage(AdminItemVO aVO) throws PersistenceException {
		log.info("imageInsertStrart");
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertNewSubImage", aVO);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	
	public void insertAdminItem(AdminItemVO aVO) throws PersistenceException {
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertItem", aVO);
		ss.commit();
		log.info("insert commit");
		if(ss!=null) {ss.close();}
		
	}
	
	public void updateAdminItemFlag(Integer ItemId) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.update("updateItemFlag", ItemId);
		ss.commit();
		if(ss!=null) {ss.close();}
	}
	
/*	+ selectAllItem(String) : List<AdminItemVO>
	+ selectOneItem(int) : AdminItemVO
	+ updateAdminItem(AdminItemVO) : int
	+ updateAdminItemStatus(int) : int
	+ insertItem(AdminItemVO) : int*/


}
