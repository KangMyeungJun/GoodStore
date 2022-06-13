package kr.co.goodstore.dao.admin.company;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.company.AdminCompaniesDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.company.AdminCompanyVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminCompanyDAO {
	
	public int selectCntCompany(String keyword) throws PersistenceException {
		int cnt = 0;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		cnt = ss.selectOne("selectCompanyCnt", keyword);
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	public List<AdminCompaniesDomain> selectCompanies(PagingVO pVO) throws PersistenceException{
		List<AdminCompaniesDomain> list = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectCompanies", pVO);
		
		if (ss != null) {ss.close();}
		
		return list;
	}
	
	public AdminCompaniesDomain selectOneCompany(Integer id) throws PersistenceException{
		AdminCompaniesDomain domain = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		domain = ss.selectOne("selectOneCompany", id);
		if(ss!=null) {ss.close();}
		
		return domain;
	}
	

	public void updateAdminCompany(AdminCompanyVO aVO) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		log.info("update cnt = {}",ss.update("updateCompany", aVO));
		ss.commit();
		if(ss!=null) {ss.close();}
		
	}

	
	public void deleteAdminCompany(int id) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		log.info("delete = {}",ss.update("deleteCompany", id));
		ss.commit();
		if(ss!=null) {ss.close();}
		
	}	
	
	public void insertAdminCompany(AdminCompanyVO aVO) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		log.info("insert = {}",ss.update("insertCompnay", aVO));
		ss.commit();
		if(ss!=null) {ss.close();}
		
	}

	



}
