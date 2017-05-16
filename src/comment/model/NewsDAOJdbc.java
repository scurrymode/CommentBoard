package comment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pool.PoolManager;

public class NewsDAOJdbc {
	PoolManager pool = PoolManager.getInstance();
	
	//create ==insert
	public int insert(News dto){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		
		try {
			con=pool.getConnection();
			String sql="insert into news(news_id, writer, title, content)";
			sql+=" values(seq_news.nextval, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}	
		return result;
	}
	
	//모든 레코드 가져오기 select
	public List select(){
		List list = null;
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		con=pool.getConnection();
		String sql = "select * from news order by news_id desc";
		try {
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<News>();
			
			while(rs.next()){
				News dto = new News();
				dto.setNews_id(rs.getInt("news_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setHit(rs.getInt("hit"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}		
		return list;
	}
	
	public News select(int news_id){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		News dto = null;
		
		con=pool.getConnection();
		String sql = "select * from news where news_id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new News();
				dto.setNews_id(rs.getInt("news_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setHit(rs.getInt("hit"));
				dto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}		
		return dto;
	}
}
