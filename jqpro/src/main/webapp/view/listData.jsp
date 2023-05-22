<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// Controller에서 저장된 처리결과 값을 꺼낸다.
	List<MemberVO> varlist = (List<MemberVO>) request.getAttribute("listvalue");
	Gson gson = new Gson(); //gson사용
	String result = gson.toJson(varlist);
	
	out.print(result);
	out.flush();
%>

<%-- [
	<%
		for(int i=0; i<varlist.size(); i++) {
			MemberVO vo = varlist.get(i);
			if(i != 0) out.print(", "); // 자바 안쪽 출력은 out.print 바깥쪽
	%>
	
		{
			"mem_id" : "<%= vo.getMem_id() %>",
			"mem_name" : "<%= vo.getMem_name() %>",
			"mem_hp" : "<%= vo.getMem_hp() %>",
			"mem_mail" : "<%= vo.getMem_mail() %>"
		}
		
	<%
		}
	%>
]
--%>
