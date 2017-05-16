//Mybatis에서 쿼리문을 실행하기 위해서는 SqlSession이 필요하고, 이를 위해서는 먼저 SqlSessionFactory 객체가 필요하며, 또 이를 얻기 위해서는 환경설정 xml파일을 스트림을 이용하여 읽어야 한다. 이 복잡한 코드를 DAO에 일일이 작성하지 않기 위해 이 공통 클래스를 정의하도록 한다.!

package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryManager {
	private static FactoryManager instance;
	SqlSessionFactory factory;
	
	private FactoryManager(){
		String resource = "/mybatis/config.xml";
		InputStream inputStream=null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		factory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public static FactoryManager getInstance(){
		if(instance==null){
			instance = new FactoryManager();
		}
		return instance;
	}
	//세션 얻기
	public SqlSession getSession(){
		SqlSession session = factory.openSession(true);
		return session;	
	}
	//세션 닫기
	public void close(SqlSession session){
		session.close();
	}
	

}
