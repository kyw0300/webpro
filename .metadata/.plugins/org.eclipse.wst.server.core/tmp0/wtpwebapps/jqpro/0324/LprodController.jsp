<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//요청데이터
	
	//service객체
	ILprodService service = LprodServiceImpl.getInstance();

	List<LprodVO> prodlist = service.selectAll();
	
	request.setAttribute("lprodlist", prodlist);
	RequestDispatcher disp = request.getRequestDispatcher("/view/lprodList.jsp");
	disp.forward(request, response);
%>
</body>
</html>