<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
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
	String prodgu = request.getParameter("gu");
	
	IProdService service = ProdServiceImpl.getInstance();
	List<ProdVO> prodList = service.prodList(prodgu);
	
	request.setAttribute("prodlist", prodList);
	
	RequestDispatcher disp = request.getRequestDispatcher("/view/prodList.jsp");
	disp.forward(request, response);

%>
</body>
</html>