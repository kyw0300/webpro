<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="../js/jquery.serializejson.min.js"></script>
<script type="text/javascript">
$(function(){
	chk = 0;
	
	// 데이타 유효성 체크
	// id
	$('#uid').on('keyup',function(){
		idvalue = $(this).val().trim();
		
		idreg = /^[a-z][a-zA-Z0-9]{3,14}$/;
		if(!(idreg.test(idvalue))){
			$('#idCheck').prop('disabled',true);
		} else {
			$('#idCheck').prop('disabled',false);
		}
		
		regcheck(idreg,idvalue,this);
	})
	
	$('#uname').on('keyup',function(){
		namevalue = $(this).val().trim();
		namereg = /^[가-힣]{2,5}$/
		
		regcheck(namereg, namevalue, this);
		
// 		if(!(namereg.test(namevalue))){
// 			$(this).css('border', '3px solid red');
// 		} else {
// 			$(this).css('border', '3px solid green');
// 		}
	})
	
	$('#pwd').on('keyup',function(){
		passvalue = $(this).val().trim();
		passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+]).{5,12}$/;
		regcheck(passreg, passvalue, this);
		
// 		passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+~`\-={}[\]:;'"<>,.?\\/])[A-Za-z\d!@#$%^&*()_+~`\-={}[\]:;'"<>,.?\\/]{8,}$/
// 		regcheck(passreg, passvalue, this);
		
		// 전방탐색
// 		str = ["1000원","2원","원","5000원"];
// 		reg = /.+(?=원)/;
// 		reg = /(?=.*원)/;
		
// 		for(i=0; i < str.length; i++) {
// 			bb = reg.test(str[i]);
// 			alert(bb);
// 		}
		
	})
	
	$('#umail').on('keyup',function(){
		mailvalue = $(this).val().trim();
		mailreg = /^[a-zA-Z0-9]+@[a-z][0-9a-zA-z]+(\.[a-zA-Z]+){1,2}$/
		regcheck(mailreg, mailvalue, this);
	})
	
	$('#uhp').on('keyup',function(){
		hpvalue = $(this).val().trim();
		hpreg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}$/
		regcheck(hpreg, hpvalue, this);
	})
	
	regcheck = function(reg, value, ele){
		if(!(reg.test(value))){
			$(ele).css('border', '3px solid red');
		} else {
			$(ele).css('border', '3px solid green');
		}
	}
	
	
	$('#idCheck').on('click',function(){
		// 입력한 값을 가져온다.
		idvalue = $('#uid').val().trim();
		
// 		console.log(idvalue);
		
		if(idvalue.length < 1 || idvalue == null) {
			alert("id를 입력해주세요.");
			return false;
		}
		
		$.ajax({
 			url: '<%= request.getContextPath()%>/idCheck.do',
			type: 'get',
			data: {"id": idvalue},
			success: function(res){
// 				alert(res.flag);
				$('#idspan').text(res.flag).css({'color': 'blue', 'font-size': '0.8em'});
				chk = 1;
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
	
	$('#zipSearch').on('click',function(){
		window.open("zipsearch.jsp","우편번호찾기","width=500 height=500");
	})
	
	// 우편번호 검색 모달창 실행 - 검색버튼 클릭
	$('#zip').on('click',function(){
		dongvalue = $('#dong').val();
// 		alert(dong);
		if(dongvalue.length < 1 || dongvalue == null) {
			alert("검색어를 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url: '<%= request.getContextPath()%>/zipSearch.do',
			type: 'post',
			data: {"dong": dongvalue},
			success: function(res){
// 				alert("성공");
				
				code ="<table border='1'>";
				code += "<tr><td>우편번호</td><td>주소</td><td>번지</td></tr>"
				$(res).each(function(i,v){
					bunji = v.bunji;
					// undefined 비교
					if(typeof bunji == "undefined" ) bunji = "";
					
					code += "<tr><td>" + v.zipcode + "</td>";
					code += "<td>" + v.sido + "  " + v.gugun + "  " + v.dong + "</td>";
// 					code += "<td>" + v.gugun + "</td>";
// 					code += "<td>" + v.dong + "</td>";
					code += "<td>" + bunji + "</td></tr>";
				})
				code += "</table>";
				console.log(code);
				$('#result1').html(code);
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
	
	// 결과에서 한 줄을 선택하면(클릭이벤트)
	$(document).on('click','#result1 tr',function(){
		zip = $('td:eq(0)', this).text();
		addr = $('td:eq(1)', this).text();
		
		$('#uzip').val(zip);
		$('#uadd1').val(addr);
		
		// 검색내용 삭제
		$('#dong').val("");
		$('#result1').empty();
		
		// 모달 닫아주기
		$("#zipModal").modal('hide');
	})
	
	$('#register').on('click',function(){
		
		// id 중복체크 여부 확인
		if(chk == 0) {
			alert("id 중복체크를 해주세요!");
			return false;
		}
				
		// 입력한 모든 값을 가져온다. - val()
// 		idval = $('#uid').val().trim();
// 		passval = $('#pwd').val().trim();
// 		nameval = $('#uname').val().trim();
// 		birval = $('#ubir').val().trim();
// 		hpval = $('#uhp').val().trim();
// 		mailval = $('#umail').val().trim();
// 		zipval = $('#uzip').val().trim();
// 		add1val = $('#uadd1').val().trim();
// 		add2val = $('#uadd2').val().trim();
		
// 		fdata = {"id": idval, 
// 				 "pass": passval, 
// 				 "name": nameval, 
// 				 "bir": birval, 
// 				 "hp": hpval, 
// 				 "mail": mailval,
// 				 "zip": zipval, 
// 				 "add1": add1val, 
// 				 "add2": add2val
// 				};

// 		fdata = "id=" + idval + "&name=" + nameval + "&pass=" + passval

		fdata1 = $('form').serialize();
		fdata2 = $('form').serializeArray();
		fdata3 = $('form').serializeJSON();
		
		console.log(fdata1);
		console.log(fdata2);
		console.log(fdata3);
		
		$.ajax({
			url: '<%= request.getContextPath()%>/insert.do',
			data: fdata3,
			type: 'post',
			success: function(res){
// 				alert("가입성공");
				
				
				$('#joinspan').text(res.cnt).css('color', 'blue');
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
})
</script>
<style>
	tr:first-child{
		background: black;
		color: white;
	}
	#result1 tr:not(:first-child):hover{
		background: gray;
	}
	.borderstyle{
		border : 2px solid red;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>

		<form action="" class="needs-validation" novalidate>

			<div class="form-group">
				<label for="uid">아이디:</label>
				<button type="button" id="idCheck" class="btn btn-secondary btn-sm">중복검사</button>
				<span id="idspan"></span>
				<input type="text" class="form-control" id="uid" placeholder="Enter userID" name="mem_id" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="pwd">비밀번호:</label>
				<input type="text" class="form-control" id="pwd" placeholder="Enter password" name="mem_pass" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="uname">이름:</label>
				<input type="text" class="form-control" id="uname" placeholder="Enter username" name="mem_name" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="form-group">
				<label for="unbir">생년월일:</label>
				<input type="date" class="form-control" id="ubir" placeholder="Enter userbir" name="mem_bir" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="form-group">
				<label for="uhp">전화번호:</label>
				<input type="text" class="form-control" id="uhp" placeholder="Enter userhp" name="mem_hp" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="umail">이메일:</label>
				<input type="text" class="form-control" id="umail" placeholder="Enter usermail" name="mem_mail" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="uzip">우편번호:</label>
				<button type="button" id="zipSearch" class="btn btn-secondary btn-sm">검색</button>
				<button type="button" data-toggle="modal" data-target="#zipModal" class="btn btn-secondary btn-sm">검색modal</button>
				<input type="text" class="form-control" id="uzip" placeholder="Enter userzip" name="mem_zip" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="uadd1">주소:</label>
				<input type="text" class="form-control" id="uadd1" placeholder="Enter useradd1" name="mem_add1" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="uadd2">상세주소:</label>
				<input type="text" class="form-control" id="uadd2" placeholder="Enter useradd2" name="mem_add2" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<button type="button" id="register" class="btn btn-outline-primary btn-lg">Submit</button>
			<span id="joinspan"></span>
		</form>
	</div>
	
<div class="modal" id="zipModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호 찾기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="box">
			<p>찾는 동을 입력하세요.</p>
			<input type="text" id="dong">
			
			<input type="button" value="검색" id="zip" class="btn btn-info">
			<br><br>
			<div class="result" id="result1"></div>
		</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="send" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
	
</body>
</html>
