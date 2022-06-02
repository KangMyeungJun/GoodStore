package kr.co.goodstore.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * MyBatis Framework을 생성하고 MyBatis Handler를 반환
 * @author user
 */
public class MyBatisFramework {
	private static MyBatisFramework mbf;
	private static SqlSessionFactory ssf;
	
	private MyBatisFramework() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}//MyBatisFramework

	public static MyBatisFramework getInstance() {
		if(mbf==null) {
			mbf=new MyBatisFramework();
		}//end if
		return mbf;
	}//getInstance

	private SqlSessionFactory getSqlSessionFactory() throws IOException{
		if(ssf==null) {
			Reader reader=null;
			try {
			//1.설정파일연결
			reader=Resources.getResourceAsReader("kr/co/goodstore/dao/SqlMapConfig.xml");
			//2.MyBatis Framework생성
			ssf=new SqlSessionFactoryBuilder().build(reader);
			}finally {
				if(reader != null) {reader.close();}
			}//end finally
		}//end if
		return ssf;
	}//getSqlSessionFactory
	
	public SqlSession getMyBatisHandler() {
		SqlSession ss=null;
		try {
		ss=getSqlSessionFactory().openSession();
		}catch(IOException ie) {
			ie.printStackTrace();
		}//end catch
		return ss;
	}//getMyBatisHandler
	
	public static void main(String[] args) {
	MyBatisFramework mbf=getInstance();
	SqlSession ss=mbf.getMyBatisHandler();
	System.out.println(ss);
	}
	
	
}//class
