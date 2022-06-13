package kr.co.goodstore.service.admin.company;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.admin.company.AdminCompanyDAO;
import kr.co.goodstore.domain.admin.company.AdminCompaniesDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.company.AdminCompanyVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminCompanyService {
	
	private final AdminCompanyDAO acDAO;
	
	public int findCntCompany(String keyword) {
		int cnt = 0;
		try {
			cnt = acDAO.selectCntCompany(keyword);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public List<AdminCompaniesDomain> findCompanies(PagingVO pVO) {
		List<AdminCompaniesDomain> list = null;
		
		try {
			list = acDAO.selectCompanies(pVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public AdminCompaniesDomain findOneCompany(Integer id) {
		AdminCompaniesDomain domain = null;
		
		try {
			domain = acDAO.selectOneCompany(id);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		
		return domain;
	}
	
	public void modifyCompany(AdminCompanyVO aVO) {
		try {
			acDAO.updateAdminCompany(aVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCompany(int id) {
		try {
			acDAO.deleteAdminCompany(id);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	
	public void addCompany(AdminCompanyVO aVO) {
		try {
			acDAO.insertAdminCompany(aVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	
}
