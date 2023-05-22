<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mystyle.css">
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#lprod').on('click',function(){
		$.ajax({
			url : "http://localhost/jqpro/0324/LprodController.jsp",
			type : "get",
			success : function(res){
				alert("성공");
				
				code = "<table border='1'>"
				code += "<tr>"
				code += "<td>아이디</td>"
				code += "<td>분류코드</td>"
				code += "<td>상품종류</td>"
				code += "</tr>"
				$(res).each(function(i,v){
					code += "<tr>"
					code += "<td>" + res[i].lprod_id + "</td>"
					code += "<td>" + res[i].lprod_gu + "</td>"
					code += "<td>" + v.lprod_nm + "</td>"
					code += "</tr>"
				})
				code += "</table>"
				
				$('#result1').html(code);
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	$('#buyer').on('click', function(){
		$.ajax({
			url : "http://localhost/jqpro/0324/BuyerController.jsp",
			type : "get",
			success : function(res){
				alert("성공");
				
				code = "";
				$(res).each(function(i,v){
					code += "<p>" + res[i].buyer_id + "  " + res[i].buyer_name + "</p>";
				})
				
				
				$('#td1').html(code);
				
				$('p').on('click',function(){
					text = $(this).text();
					id = text.substr(0,6);
// 					alert(id);
					
					// jsp String??
<%-- 					<%! --%>
// 					String id = "P10101";
<%-- 					%>	 --%>
					
					$.ajax({
						url : "http://localhost/jqpro/0324/BuyerController2.jsp",
						type : "get",
						data : {id : id},
						success : function(res){
// 							alert("클릭성공");
							
							code = "";
							code += "<p>BUYER_ID       : " + res.buyer_id + "</p>";
							code += "<p>BUYER_NAME     : " + res.buyer_name + "</p>";
							code += "<p>BUYER_LGU      : " + res.buyer_lgu + "</p>";
							code += "<p>BUYER_BANK     : " + res.buyer_bank + "</p>";
							code += "<p>BUYER_BANKNO   : " + res.buyer_bankno + "</p>";
							code += "<p>BUYER_BANKNAME : " + res.buyer_bankname + "</p>";
							code += "<p>BUYER_ZIP      : " + res.buyer_zip + "</p>";
							code += "<p>BUYER_ADD1     : " + res.buyer_add1 + "</p>";
							code += "<p>BUYER_ADD2     : " + res.buyer_add2 + "</p>";
							code += "<p>BUYER_MAIL     : " + res.buyer_mail + "</p>";
							
							
							$('#td2').html(code);
							
							
						},
						error : function(xhr){
							alert("상태 : " + xhr.status);
						},
						dataType : 'json'
					})
				})
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
})
</script>
<style type="text/css">
table{
	border: 2px solid orange;
}
td{
	width: 150px;
	height: 30px;
	text-align: center;
}
#td2{
	width: 500px;
	padding-left: 100px;
	text-align: left;
}
</style>
</head>
<body>

<div class="box">
	<p>
	</p>
	
	<input type="button" value="LPROD리스트" id="lprod">
	<br><br>
	<div class="result" id="result1"></div>
</div>

<div class="box">
	<p>
	</p>
	
	<input type="button" value="BUYER리스트" id="buyer">
	<br><br>
	<div class="result" id="result2">
		<table border="1">
			<tr>
				<td>거래처이름</td>
				<td>거래처상세정보</td>
			</tr>
			
			<tr>
				<td id="td1"></td>
				<td id="td2"></td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>