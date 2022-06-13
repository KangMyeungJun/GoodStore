package kr.co.goodstore.dao.admin.blog;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.blog.AdminBlogCommentDomain;
import kr.co.goodstore.domain.admin.blog.AdminBlogDomain;
import kr.co.goodstore.domain.admin.blog.AdminTagDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.blog.AdminPostVO;
import kr.co.goodstore.vo.admin.blog.AdminTagVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminBlogDAO {
	public int selectCntBlog(String keyword) throws PersistenceException {
		int cnt = 0;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		cnt = ss.selectOne("selectCntPosts", keyword);
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	public List<AdminBlogDomain> selectItem(PagingVO pVO) throws PersistenceException{
		List<AdminBlogDomain> list = null;
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectAdminPosts", pVO);
		
		if (ss != null) {ss.close();}
		
		return list;
	}
	
	public AdminBlogDomain selectOneItem(Integer blogId) throws PersistenceException{
		AdminBlogDomain domain = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		domain = ss.selectOne("selectOnePost", blogId);
		if(ss!=null) {ss.close();}
		
		return domain;
	}
	
	public List<AdminTagDomain> selectTagById(Integer blogId) throws PersistenceException {
		List<AdminTagDomain> list = null;
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		list = ss.selectList("selectTags", blogId);
		if(ss!=null) {ss.close();}
		return list;
	}
	


	
	public void updateAdminPost(AdminPostVO aVO) throws PersistenceException{
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		log.info("update cnt = {}",ss.update("updatePost", aVO));
		ss.commit();
		if(ss!=null) {ss.close();}
		
	}
	
	public void deleteAdminTag(AdminTagVO vo) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		log.info("delete cnt = {}",ss.delete("deleteTag", vo));
		ss.commit();
		if(ss!=null) {ss.close();}
	}
	
	public void insertAdminTag(AdminPostVO aVO) throws PersistenceException {
		log.info("tagInsertStrart");
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertTags", aVO);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	
	public void insertAdminNewTag(AdminPostVO aVO) throws PersistenceException {
		log.info("tagInsertStrart");
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertNewTags", aVO);
		ss.commit();
		if(ss!=null) {ss.close();}		
	}
	

	
	
	public void insertAdminPost(AdminPostVO aVO) throws PersistenceException {
		
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("insertPost", aVO);
		ss.commit();
		log.info("insert post commit");
		if(ss!=null) {ss.close();}
		
	}
	
	public void updateAdminBlogStatus(Integer id) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.update("delPost", id);
		ss.commit();
		if(ss!=null) {ss.close();}
	}
	
	public List<AdminBlogCommentDomain> selectComments(PagingVO pVO) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		List<AdminBlogCommentDomain> list = null;
		list = ss.selectList("selectComments", pVO);
		if(ss!=null) {ss.close();}
		return list;
	}
	
	public int selectCommentsCnt(Integer id) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		int cnt = ss.selectOne("selectCommentsCnt", id);
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	public void deleteComment(Integer id) throws PersistenceException {
		SqlSession ss = MyBatisFramework.getInstance().getMyBatisHandler();
		ss.delete("deleteComment", id);
		ss.commit();
		if(ss!=null) {ss.close();}
	}



}
