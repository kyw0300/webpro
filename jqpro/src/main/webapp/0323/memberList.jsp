<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
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
	// controller역할 원래는 servlet(웹에서 동작하는 자바 클래스)으로 해야됨 근데 아직 몰라서 이걸로함	

	//요청시 전송데이터 받기
	
	//service객체가 필요
	IMemberService service = MemberServiceImpl.getInstance();

	//데이터로 처리 수행(대부분 DB와 연결해서 CRUD처리함)
	List<MemberVO> memList = service.getAllMember();
	
	//처리결과를 request에 저장
	request.setAttribute("listvalue", memList);
	
	//처리결과를 view 페이지로 이동시켜 응답데이타를 생성 - json Object 배열 객체
	//이동방법 forward,redirect? , forward로 해야함 redirect 밖으로 나가버림
	RequestDispatcher disp = request.getRequestDispatcher("../view/listData.jsp");
	disp.forward(request, response);
			
	
%>

</body>
</html>