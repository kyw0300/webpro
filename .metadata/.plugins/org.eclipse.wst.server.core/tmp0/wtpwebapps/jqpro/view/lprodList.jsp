<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// Controller에서 저장된 처리결과 값을 꺼낸다.
	List<LprodVO> lprodlist = (List<LprodVO>) request.getAttribute("lprodlist");
	Gson gson = new Gson(); 
	String result = gson.toJson(lprodlist);
	
	out.print(result);
	out.flush();
%>



<%--
[
	<%
		for(int i=0; i<lprodlist.size(); i++) {
			LprodVO vo = lprodlist.get(i);
			if(i != 0) out.print(", "); // 자바 안쪽 출력은 out.print 바깥쪽
			
		
	%>
		{
			"id" : "<%= vo.getLprod_id() %>",
			"gu" : "<%= vo.getLprod_gu() %>",
			"nm" : "<%= vo.getLprod_nm() %>"
		}
		
	<%
		}
	%>
]
 --%>