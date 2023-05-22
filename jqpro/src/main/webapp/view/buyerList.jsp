<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// Controller에서 저장된 처리결과 값을 꺼낸다.
	List<BuyerVO> buyerlist = (List<BuyerVO>) request.getAttribute("buyerlist");
	Gson gson = new Gson();
	String result = gson.toJson(buyerlist);
	
	out.print(result);
	out.flush();

%>


<%--
[
	<%
		for(int i=0; i<buyerlist.size(); i++) {
			BuyerVO vo = buyerlist.get(i);
			if(i != 0) out.print(", "); // 자바 안쪽 출력은 out.print 바깥쪽
			
		
	%>
		{
			"id" : "<%= vo.getBuyer_id() %>",
			"nm" : "<%= vo.getBuyer_name() %>"
		}
		
	<%
		}
	%>
]
 --%>
