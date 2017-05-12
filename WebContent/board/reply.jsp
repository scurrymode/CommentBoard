<%@page import="comment.model.Comments"%>
<%@page import="comment.model.CommentsDAO"%>
<%@include file="/inc/message.jsp" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%! CommentsDAO commentsDAO = new CommentsDAO(); %>
<%
	request.setCharacterEncoding("utf-8");
	//넘겨받은 파라미터 값을 이용하여 댓글 등록
	String writer=request.getParameter("nickname");
	String msg = request.getParameter("msg");
	String news_id = request.getParameter("news_id");
	
	Comments comments =new Comments();
	comments.setMsg(msg);
	comments.setNews_id(Integer.parseInt(news_id));
	comments.setWriter(writer);
	
	int result = commentsDAO.insert(comments);
	if(result!=0){
		out.print(showMsgURL("댓글달기성공", "/board/detail.jsp?news_id="+news_id));
	}else{
		out.print(showMsgBack("댓글달기실패"));
	}
	
%>