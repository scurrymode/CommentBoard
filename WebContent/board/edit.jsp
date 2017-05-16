<%@page import="comment.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/inc/message.jsp" %>
<%! NewsDAOMybatis newsDAO = new NewsDAOMybatis(); %>
<jsp:useBean id="dto" class="comment.model.News"></jsp:useBean>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty property="*" name="dto"/>
<%
	int result = newsDAO.update(dto);
	if(result!=0){
		out.print(showMsgURL("수정성공", "/board/detail.jsp?news_id="+dto.getNews_id()));		
	}else{
		out.print(showMsgBack("수정실패"));
	}
%>