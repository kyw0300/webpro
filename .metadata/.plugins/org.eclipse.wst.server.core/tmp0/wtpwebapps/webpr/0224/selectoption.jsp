<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: 3px dotted red;
	}
	td{
		width: 200px;
		height: 100px; 
	}
	td:nth-child(1) {
		background-color: yellow;
		text-align: center;
		color: blue;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String foods = request.getParameter("foods");
	
	String foods2[] = request.getParameterValues("foods2");
	
	String str = "";
	for(String ss : foods2) {
		str += ss + "<br>";
	}

%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%= userId%></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><%= userName%></td>
		</tr>
		
		<tr>
			<td>한개만 선택</td>
			<td><%= foods%></td>
		</tr>
		
		<tr>
			<td>여러개 선택</td>
			<td><%= str%></td>
		</tr>
		
	</table>
</body>
</html>