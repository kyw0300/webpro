<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: 1px solid blue;
		border-collapse: collapse;
		text-align: center;
		margin: 50px auto;
	}
	td{
		width: 200px;
		height: 100px;
	}
	td:nth-child(1) {
		background-color: #faadd3;
	}
	
	div{
		border: 1px solid black;
		margin: 50px auto;
		width: 500px;
		padding: 10px;
		height: 500px;
	}
	p{
		border: 1px solid green;
	}
	p:nth-child(1){
		background-color: #faadd3;
	}
	p:nth-child(2){
		height: 85%;		

	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String tel = request.getParameter("tel");
	String area = request.getParameter("area");
	
	String rep = area.replaceAll("\r", "").replaceAll("\n", "<br>");

%>

	<div>
		<h1>이름 <%= name%></h1>
		<p><span> 아이디 </span> <span><%= id%></span></p>
		<p><span> 전화번호 </span> <span><%= tel%></span></p>
		<p><span> 자기소개 </span> <span><%= area%></span></p>
	</div>
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%= name%></td>
		</tr>
		
		<tr>
			<td>아이디</td>
			<td><%= id%></td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td><%= tel%></td>
		</tr>
		
	</table>
	
	<div>
		<p><span>자기소개</span></p>
		<p><%= rep%></p>
	</div>
	
</body>
</html>