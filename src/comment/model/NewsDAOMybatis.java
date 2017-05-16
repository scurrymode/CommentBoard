package comment.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.FactoryManager;

public class NewsDAOMybatis {
	FactoryManager manager = FactoryManager.getInstance();
	
	//CRUD 메서드 정의
	public List selectAll(){
		SqlSession session = manager.getSession();
		List list = session.selectList("News.selectAll");
		manager.close(session);
		return list;
	}
	
	public List selectJoin(){
		SqlSession session = manager.getSession();
		List list = session.selectList("News.selectJoin");
		manager.close(session);
		return list;
	}
	
	public News select(int news_id){
		SqlSession session = manager.getSession();
		News news = session.selectOne("News.select", news_id);
		manager.close(session);
		return news;
	}
	
	public int delete(int news_id){
		int result = 0;
		SqlSession session = manager.getSession();
		result = session.delete("News.delete", news_id);
		session.commit(); //jdbc는 오토커밋이 true였지만 mybatis는 아니라서 우리가 해줘야해
		manager.close(session);
		return result;
	}
	
	public int update(News news){
		int result = 0;
		SqlSession session = manager.getSession();
		result = session.update("News.update", news);
		session.commit();
		manager.close(session);
		return result;
	}
	
	public int insert(News news){
		int result = 0;
		SqlSession session = manager.getSession();
		result = session.insert("News.insert", news);
//		session.commit();
		manager.close(session);
		return result;
	}

}
