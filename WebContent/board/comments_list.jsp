<%@page import="comment.model.Comments"%>
<%@page import="java.util.List"%>
<%@page import="comment.model.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! CommentsDAO commentsDAO = new CommentsDAO(); %>
<%
	String news_id=request.getParameter("news_id");
	List<Comments> list = commentsDAO.select(Integer.parseInt(news_id));
	StringBuffer sb = new StringBuffer();
	
	sb.append("{");
	sb.append("\"list\": [");
	for(int i=0; i<list.size();i++){
		Comments dto = list.get(i);
		sb.append("{");
		sb.append("\"comments_id\": "+dto.getComments_id()+", ");
		sb.append("\"writer\": \""+dto.getWriter()+"\", ");
		sb.append("\"regdate\": \""+dto.getRegdate()+"\", ");
		sb.append("\"msg\": \""+dto.getMsg()+"\", ");
		sb.append("\"news_id\": "+dto.getNews_id()+"");
		if(i<list.size()-1){
			sb.append("},");
		}else{
			sb.append("}");
		}
	}
	sb.append("]");
	sb.append("}");

	
	out.print(sb.toString());
 %>


