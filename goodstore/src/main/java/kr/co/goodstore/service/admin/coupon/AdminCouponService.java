package kr.co.goodstore.service.admin.coupon;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.admin.coupon.AdminCouponDAO;
import kr.co.goodstore.domain.admin.coupon.AdminCouponDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.coupon.AdminCouponVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminCouponService {
	private final AdminCouponDAO acDAO;
	
	public List<AdminCouponDomain> findAllCoupons(PagingVO pVO) {
		List<AdminCouponDomain> list = new ArrayList<AdminCouponDomain>();
		try {
			list = acDAO.selectAllCoupons(pVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int findCouponsCnt(String keyword) {
		int cnt = 0;
		try {
			cnt = acDAO.selectCouponsCnt(keyword);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public void addCoupons(AdminCouponVO vo) {
		try {
			acDAO.insertCoupons(vo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	
	public AdminCouponDomain findCouponById(Integer id) throws PersistenceException {
		AdminCouponDomain domain = null;
		try {
			domain = acDAO.selectOneCoupon(id);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return domain;
	} 
	
	public void addOneCoupon(AdminCouponVO vo) throws PersistenceException {
		try {
			acDAO.insertOneCoupon(vo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	
	public void modifyCouponFlag(int id) throws PersistenceException {
		try {
			acDAO.updateCouponFlag(id);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}

}
