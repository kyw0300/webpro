<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
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
	String prodId = request.getParameter("id");
	IProdService service = ProdServiceImpl.getInstance();
	
	ProdVO vo = service.prodDetail(prodId);
	
	request.setAttribute("prodDetail", vo);
	
	RequestDispatcher disp = request.getRequestDispatcher("/view/prodDetail.jsp");
	disp.forward(request, response);
%>
</body>
</html>