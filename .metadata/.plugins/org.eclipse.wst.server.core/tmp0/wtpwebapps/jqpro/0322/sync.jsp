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
}
td{
	width: 300px;
	height: 40px;
	text-align: center;
}
</style>
</head>
<body>
<%
//요청시 전송데이터 받기

//데이터로 처리 수행(대부분 DB와 연결해서 CRUD처리함)

//처리결과로 응답데이타를 생성 - json Object 배열 객체
String id = "stw77";
%>

<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td><%= id%></td>
		<td>서태웅</td>
		<td>010-1234-1234</td>
		<td>stw@naver.com</td>
	</tr>
	<tr>
		<td>jdm999</td>
		<td>정대만</td>
		<td>010-9999-9999</td>
		<td>jdm@naver.com</td>
	</tr>
	<tr>
		<td>ccs8</td>
		<td>채치수</td>
		<td>010-4567-4576</td>
		<td>ccs@naver.com</td>
	</tr>
	<tr>
		<td>sts0300</td>
		<td>송태섭</td>
		<td>010-6789-8766</td>
		<td>sts@naver.com</td>
	</tr>
	<tr>
		<td>kbh10</td>
		<td>강백호</td>
		<td>010-7777-1010</td>
		<td>kbh@naver.com</td>
	</tr>
</table>

</body>
</html>