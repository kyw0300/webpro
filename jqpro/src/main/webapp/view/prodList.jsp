<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProdVO> prodlist = (List<ProdVO>) request.getAttribute("prodlist"); 

	JsonObject obj = new JsonObject();

	if(prodlist != null && prodlist.size() > 0) {
		obj.addProperty("flag", "ok");
		
		Gson gson = new Gson();
		JsonElement jele = gson.toJsonTree(prodlist);
		
		obj.add("datas", jele);
	} else {
		obj.addProperty("flag", "no");
	}
	
	out.print(obj);
	out.flush();
%>

<%--
{
"flag" : "ok",
"datas" : 
[
	<%
		for(int i=0; i<prodlist.size(); i++) {
			ProdVO vo = prodlist.get(i);
			if(i != 0) out.print(", "); // 자바 안쪽 출력은 out.print 바깥쪽
	%>
		{
			"id" : "<%= vo.getProd_id() %>",
			"nm" : "<%= vo.getProd_name() %>"
		}
		
	<%
		}
	%>
]
}
<%
	} else{ 
		
%>
{
"flag" : "no",
"datas" : "Boom!"
}

<%
	}
%>
 --%>