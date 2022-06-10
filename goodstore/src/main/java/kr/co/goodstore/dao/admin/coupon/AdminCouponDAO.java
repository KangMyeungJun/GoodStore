package kr.co.goodstore.dao.admin.coupon;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.coupon.AdminCouponDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.coupon.AdminCouponVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminCouponDAO {
	
	public List<AdminCouponDomain> selectAllCoupons(PagingVO pVO) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		List<AdminCouponDomain> list = ss.selectList("selectAllCoupons", pVO);
		if (ss != null) {ss.close();}
		return list;
	}
	
	public int selectCouponsCnt(String keyword) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		int cnt = ss.selectOne("selectCouponsCnt", keyword);
		if (ss != null) {ss.close();}
		return cnt;
	}
	
	public void insertCoupons(AdminCouponVO vo) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		int cnt = ss.update("insertCoupons", vo);
		ss.commit();
		log.info("coupon insert {}",cnt);
		if (ss != null) {ss.close();}
	}
	
	public AdminCouponDomain selectOneCoupon(Integer id) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		AdminCouponDomain domain = ss.selectOne("selectOneCoupon", id);
		if (ss != null) {ss.close();}
		return domain;
	}
	
	public void insertOneCoupon(AdminCouponVO vo) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertCoupon", vo);
		ss.commit();
		if(ss!=null) {ss.close();}
	}
	
	public void updateCouponFlag(int id) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("updateCouponsFlag", id);
		ss.commit();
		if(ss!=null) {ss.close();}
	}

}
