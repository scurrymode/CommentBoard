<%@page import="comment.model.News"%>
<%@page import="comment.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%! NewsDAOMybatis newsDAO = new NewsDAOMybatis(); %>
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

#comments_line{
width:100%;
background:yellow;
}
</style>
<script>
var xhttp; //ajax의 요청객체
var comments_line;

function init(){
	xhttp= new XMLHttpRequest();
	comments_line = document.getElementById("comments_line");
	//stateChange 상태값에 따라 우측의 콜백 함수가 호출됨
	//개발자는 이중 상태값이 4인것만 처리하면 됨
	getList();
}

function getList(){
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4&&xhttp.status==200){
			var obj=JSON.parse(xhttp.responseText);
			
			var tag="";
			comments_line.innerHTML=tag;
			for(var i=0; i<obj.list.length;i++){
				tag+="<span>"+obj.list[i].writer+" </span>";
				tag+="<span>"+obj.list[i].msg+" </span>";
				tag+="<span>"+obj.list[i].regdate+" </span>";
				tag+="<br>";
			}
			
			comments_line.innerHTML=tag;			
		}
	}
	xhttp.open("get", "/board/comments_list.jsp?news_id="+form1.news_id.value, true);
	xhttp.send();
}

//서버에 댓글 등록을 요청한다.
function reply(){
	var news_id = form1.news_id.value;
	var nickname = form1.nickname.value;
	var msg = form1.msg.value;
	
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4&&xhttp.status==200){
			if(xhttp.responseText!=0){
				getList();
			}
		}
	}
	
	xhttp.open("post", "/board/reply.jsp", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("nickname="+nickname+"&msg="+msg+"&news_id="+news_id);
}

function del(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="/board/delete.jsp?news_id=<%=news.getNews_id()%>";
	}	
}

function update(){
	if(confirm("정말 수정하시겠습니까?")){
		form1.method="post";
		form1.action="/board/edit.jsp";
		form1.submit();
	}
}

</script>
</head>
<body onload="init()">
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
	<img src="/board/images/write_btin.gif" width="61" height="20" onClick="update()">
	<img src="/board/images/delete_btn.gif" width="61" height="20" onClick="del()">
	<a href="list.jsp"><img src="/board/images/list_btn.gif" width="61" height="20" border="0"></a> </td>
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
  	<div id="comments_line">
  		<span>작성자</span>
  		<span>코멘트나올 곳...</span>
  		<span>2017-07-24 05:12</span>
  	</div>
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
