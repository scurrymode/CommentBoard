<%@ page contentType="text/html;charset=utf-8"%>
<%! 
	public String showMsgUrl(String msg, String url){
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
		return sb.toString();
	}

public String showMsgBack(String msg){
	StringBuffer sb = new StringBuffer();
	sb.append("<script>");
	sb.append("alert('"+msg+"');");
	sb.append("history.back();");
	sb.append("</script>");
	return sb.toString();
}
%>