<%@page import="comment.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%! NewsDAOMybatis newsDAO = new NewsDAOMybatis(); %>
<% 
	int result = newsDAO.delete(Integer.parseInt(request.getParameter("news_id")));
	if(result!=0){
		out.print(showMsgURL("삭제되었습니다.", "/board/list.jsp"));
	}else{
		out.print(showMsgBack("삭제실패"));
	}
%>
