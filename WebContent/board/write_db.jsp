<%@page import="comment.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%! NewsDAOMybatis newsDAO = new NewsDAOMybatis(); %>

<jsp:useBean id="dto" class="comment.model.News"/> <!-- 클래스를 올리는 태그다.자바의 new와 같다.-->
<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty property="*" name="dto"/>

<%
	//javaEE에서는 서버측에서 실행될 수 있는 태그가 지원된다.

	out.print(dto.getWriter()+"<br>");
	out.print(dto.getTitle()+"<br>");
	out.print(dto.getContent()+"<br>");
	
	int result = newsDAO.insert(dto);
	if(result!=0){
		out.print(showMsgURL("등록성공", "list.jsp"));
	}else{
		out.print(showMsgBack("등록실패"));
	}
	
	
%>
