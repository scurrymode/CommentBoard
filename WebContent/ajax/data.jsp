<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String phone=request.getParameter("phone");
	String addr=request.getParameter("addr");
	
	System.out.println("연락처는 "+phone);
	System.out.println("주소는 "+addr);

	StringBuffer sb = new StringBuffer();
	sb.append("{");
	sb.append("\"members\":[");
	sb.append("{");
	sb.append("\"name\":\"박상돈\",");
	sb.append("\"age\":27,");
	sb.append("\"gender\":\"남성\"");
	sb.append("},");
	sb.append("{");
	sb.append("\"name\":\"최지민\",");
	sb.append("\"age\":28,");
	sb.append("\"gender\":\"남성\"");
	sb.append("},");
	sb.append("{");
	sb.append("\"name\":\"오석규\",");
	sb.append("\"age\":29,");
	sb.append("\"gender\":\"남성\"");
	sb.append("}");
	sb.append("]");
	sb.append("}");
	
	out.print(sb.toString());

%>
