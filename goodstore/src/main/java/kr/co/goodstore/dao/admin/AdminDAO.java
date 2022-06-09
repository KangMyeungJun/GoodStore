package kr.co.goodstore.dao.admin;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.goodstore.dao.MyBatisFramework;
import kr.co.goodstore.domain.admin.CategoryDomain;
import kr.co.goodstore.domain.admin.MemberDomain;



@Component
public class AdminDAO {
	
	//ī�װ���ȸ
	 public List<CategoryDomain> searchCategory()throws PersistenceException{
			List<CategoryDomain> list=null;
			
			//MyBatis Handler ���
			SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
			//������ ����
			list=ss.selectList("searchCategory");  //Mapper �� select�� ���̵�
			//MyBatis Handler �ݱ�
			if(ss != null) {ss.close();}//end if
			
			return list;
		}//category
	 
	 //Users��ȸ
	 public List<MemberDomain> searchUsers()throws PersistenceException{
		 List<MemberDomain> list=null;
		 
		 //MyBatis Handler ���
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //������ ����
		 list=ss.selectList("searchUsers");  //Mapper �� select�� ���̵�
		 //MyBatis Handler �ݱ�
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//searchUsers
	 
	 //user_detail��ȸ
	 public MemberDomain userDetail(int member_id)throws PersistenceException{  // �÷� ������ ����
		 MemberDomain list=null;
		 
		 //MyBatis Handler ���
		 SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		 //������ ����
		 list=ss.selectOne("detailUser",member_id);  //Mapper �� select�� ���̵�( �÷� ������ ����=selectOne)
		 //MyBatis Handler �ݱ�
		 System.out.println("====================="+list);
		 if(ss != null) {ss.close();}//end if
		 
		 return list;
	 }//userDetail

}//class
