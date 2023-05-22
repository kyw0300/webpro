<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
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
	IBuyerService service = BuyerServiceImpl.getInstance();
	List<BuyerVO> list = service.selectIdName();
	
	request.setAttribute("buyerlist", list);
	RequestDispatcher disp = request.getRequestDispatcher("/view/buyerList.jsp");
	disp.forward(request, response);

%>
</body>
</html>