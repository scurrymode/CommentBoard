package comment.model;

public class Comments {
	private int comments_id;
	private String writer;
	private String msg;
	private String regdate;
	private int news_id;
	
	public int getComments_id() {
		return comments_id;
	}
	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	
	
	
}
