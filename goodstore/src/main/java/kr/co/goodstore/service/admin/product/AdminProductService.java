package kr.co.goodstore.service.admin.product;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.admin.product.AdminProductDAO;
import kr.co.goodstore.domain.admin.product.AdminCategoryDomain;
import kr.co.goodstore.domain.admin.product.AdminCompanyDomain;
import kr.co.goodstore.domain.admin.product.AdminItemDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.product.AdminItemVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminProductService {
	
	private final AdminProductDAO apDAO;
	
	public int findItemCnt(String keyword) {
		int cnt = 0;
		try {
			cnt = apDAO.selectCntProducts(keyword);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return cnt;
	}
	
	public List<AdminItemDomain> findItem(PagingVO pVO) {
		
		List<AdminItemDomain> list = null;
		try {
		list = apDAO.selectItem(pVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public AdminItemDomain findOneItem(Integer itemId){
		AdminItemDomain domain = null;
		try {
			domain = apDAO.selectOneItem(itemId);
			List<String> list = apDAO.selectItemImages(itemId);
			
			if (list != null) {
				domain.setSub_image(list);
			}
		}	catch (PersistenceException e) {
			e.printStackTrace();
		}	
		
		return domain;
	}
	
	public List<AdminCategoryDomain> findAllCategory()  {
		List<AdminCategoryDomain> list = null;
		try {
			list = apDAO.selectAllCategory();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AdminCompanyDomain> findAllCompany()  {
		List<AdminCompanyDomain> list = null;
		try {
			list = apDAO.selectAllCompany();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void modifyItemById(AdminItemVO aVO) {
		try {
			apDAO.updateAdminItem(aVO);
			List<String> beforeList = apDAO.selectItemImages(aVO.getItem_id());
			List<String> afterList = aVO.getImage_list();
			for (String subImage : beforeList) {
				if(!afterList.contains(subImage)) {
					apDAO.deleteAdminSubImage(subImage);
				}
			}
			if (aVO.getUpdateImageList()!=null) {
				apDAO.insertAdminSubImage(aVO);
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	public void addItem(AdminItemVO aVO) {
		try {
			apDAO.insertAdminItem(aVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} 
	}
	
	public void addSubImage(AdminItemVO aVO) {
		try {
			
			if (aVO.getUpdateImageList()!=null) {
				
				
				apDAO.insertNewAdminSubImage(aVO);
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} 
	}
	
	public void modifyItemFlag(Integer ItemId) {
		try {
			apDAO.updateAdminItemFlag(ItemId);
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}


}
