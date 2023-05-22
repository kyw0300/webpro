<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
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
	request.setCharacterEncoding("UTF-8");	

	// String 
	String id = request.getParameter("id");

	IBuyerService service = BuyerServiceImpl.getInstance();
	BuyerVO vo = service.selectById(id);
	
	request.setAttribute("buyer", vo);
	RequestDispatcher disp = request.getRequestDispatcher("/view/buyer.jsp");
	disp.forward(request, response);

%>
</body>
</html>