<%@page import="comment.model.News"%>
<%@page import="comment.model.NewsDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%! NewsDAO newsDAO = new NewsDAO(); %>
<% 
	String news_id=request.getParameter("news_id"); 
	News news = newsDAO.select(Integer.parseInt(news_id));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
#box{border:1px solid #CCCCCC}
#writer,#title,#content{font-size:9pt;font-weight:bold;color:#7F7F7F;돋움}
input{
	font-size:9pt;
	border-left:1px solid #C3C3C3;
	border-top:1px solid #C3C3C3;
	border-right:1px solid #C3C3C3;
	border-bottom:1px solid #C3C3C3;
	color:#7F7F7F;돋움
}
#title input{width:250px;}
#content textarea{
width:503px;
border:0;
height:153;
background:url("/board/images/write_bg.gif");
border:#C3C3C3 1px solid 
}
#copyright{font-size:9pt;}
a{text-decoration:none}
img{border:0px}
</style>
<script>

//서버에 댓글 등록을 요청한다.
	function reply(){
		form1.action="/board/reply.jsp";
		form1.submit();
	}
</script>
</head>
<body>
<form name="form1">
<input type="hidden" name="news_id" value="<%=news.getNews_id() %>">
<table id="box" align="center" width="603" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="/board/images/ceil.gif" width="603" height="25"></td>
  </tr>
  <tr>
    <td height="2" bgcolor="#6395FA"><img src="/board/images/line_01.gif"></td>
  </tr>
  <tr>
    <td height="1" bgcolor="#CCCCCC"></td>
  </tr>
	<tr>	
		<td id="list"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr id="writer">
            <td height="25" align="center">작성자</td>
            <td><input type="text" name="writer" value="<%=news.getWriter()%>"></td>
          </tr>
          <tr id="title">
            <td height="25" align="center">제목</td>
            <td><input type="text" name="title" value="<%=news.getTitle()%>"></td>
          </tr>
          <tr id="content">
            <td align="center">내용</td>
            <td><textarea name="content" style=""><%=news.getContent()%></textarea></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
	</tr>
  <tr>
    <td height="30" align="right" style="padding-right:2px;">
	<img src="/board/images/write_btin.gif" width="61" height="20">
	<img src="/board/images/delete_btn.gif" width="61" height="20"> <a href="list.html"><img src="/board/images/list_btn.gif" width="61" height="20" border="0"></a> </td>
  </tr>
  <tr>
     <td>
	     <input type="text" size="8" placeholder="작성자" name="nickname">
	     <input type="text" size="73" placeholder="댓글입력" name="msg">
	     <input type="button" value="등록" onClick="reply()">
     </td>
  </tr>
  <tr>
  
  	<td>
  		<span>작성자</span>
  		<span>코멘트나올 곳...</span>
  		<span>2017-07-24 05:12</span>
  	</td>
  
  </tr>
  <tr>
    <td height="1" bgcolor="#CCCCCC"></td>
  </tr>
  <tr>
    <td height="20" align="center" id="copyright">Copyright zino All Rights Reserved </td>
  </tr>
</table>
</form>
</body>
</html>
