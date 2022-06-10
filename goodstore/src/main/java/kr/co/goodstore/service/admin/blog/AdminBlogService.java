package kr.co.goodstore.service.admin.blog;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.admin.blog.AdminBlogDAO;
import kr.co.goodstore.domain.admin.blog.AdminBlogCommentDomain;
import kr.co.goodstore.domain.admin.blog.AdminBlogDomain;
import kr.co.goodstore.domain.admin.blog.AdminTagDomain;
import kr.co.goodstore.paging.PagingVO;
import kr.co.goodstore.vo.admin.blog.AdminPostVO;
import kr.co.goodstore.vo.admin.blog.AdminTagVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminBlogService {
	
	private final AdminBlogDAO abDAO;
	
	public int findPostsCnt(String keyword) {
		int cnt = 0;
		try {
			cnt = abDAO.selectCntBlog(keyword);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return cnt;
	}
	
	public List<AdminBlogDomain> findPosts(PagingVO pVO) {
		
		List<AdminBlogDomain> list = null;
		try {
		list = abDAO.selectItem(pVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public AdminBlogDomain findOnePost(Integer blogId){
		AdminBlogDomain domain = null;
		try {
			domain = abDAO.selectOneItem(blogId);
			List<AdminTagDomain> list = abDAO.selectTagById(blogId);
			
			if (list != null) {
				domain.setTags(list);
			}
		}	catch (PersistenceException e) {
			e.printStackTrace();
		}	
		
		return domain;
	}
	

	

	
	public void modifyPost(AdminPostVO aVO) {
		try {
			abDAO.updateAdminPost(aVO);
			List<AdminTagDomain> beforeList = abDAO.selectTagById(aVO.getBlog_id());

			AdminTagVO tVO = null;
			for (AdminTagDomain tag : beforeList) {
					tVO = new AdminTagVO();
					tVO.setBlog_id(tag.getBlog_id());
					tVO.setName(tag.getName());

					abDAO.deleteAdminTag(tVO);
				
			}
			if (!aVO.getTagList().isEmpty()) {
				abDAO.insertAdminTag(aVO);
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}
	
	public void modifyPostStatus(Integer id) {
		try {
			abDAO.updateAdminBlogStatus(id);
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void addPost(AdminPostVO aVO) {
		try {
			abDAO.insertAdminPost(aVO);
			if (!aVO.getTagList().isEmpty()) {
				abDAO.insertAdminNewTag(aVO);
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} 
	}
	
	public List<AdminBlogCommentDomain> findCommentsById(PagingVO pVO) {
		List<AdminBlogCommentDomain> list = null;
		try {
			list = abDAO.selectComments(pVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public int findCommentsCnt(Integer Id) {
		int cnt = 0;
		try {
			cnt = abDAO.selectCommentsCnt(Id);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public void removeComment(Integer id) throws PersistenceException {
		try {
			abDAO.deleteComment(id);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}

}
