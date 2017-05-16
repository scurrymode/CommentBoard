package comment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pool.PoolManager;

public class CommentsDAOJdbc {
	PoolManager pool = PoolManager.getInstance();
	
	//´ñ±Û µî·Ï
	public int insert(Comments comments){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result =0;
		
		String sql = "insert into comments(comments_id, writer, msg, news_id)";
		sql+= " values(seq_comments.nextval, ?, ?, ?)";
		
		con = pool.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, comments.getWriter());
			pstmt.setString(2, comments.getMsg());
			pstmt.setInt(3, comments.getNews_id());
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}		
		return result;
	}
	
	public List select(int news_id){
		List list = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		list = new ArrayList<Comments>();
		
		String sql = "select * from comments where news_id=? order by comments_id desc";
		con = pool.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Comments comments = new Comments();
				comments.setComments_id(rs.getInt("comments_id"));
				comments.setMsg(rs.getString("msg"));
				comments.setNews_id(rs.getInt("news_id"));
				comments.setRegdate(rs.getString("regdate"));
				comments.setWriter(rs.getString("writer"));
				list.add(comments);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}		
		return list;
	}
}


