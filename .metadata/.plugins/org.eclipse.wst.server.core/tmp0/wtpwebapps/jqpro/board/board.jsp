<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- 외부 스크립트 순서 중요 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/board.js" type="text/javascript"></script>
  <script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
<style type="text/css">
  	*{
  		box-sizing: border-box;
  	}
  	p{
/*   		border: 1px solid gray; */
  		margin: 1px;
  		padding: 3px;
  		height: auto;
  	}
  	.p1{
  		float : left;
  		width: 70%;
  	}
  	.p2{
  		float: right;
  		width: 28%;
  	}
  	.p3{
  		clear: both;
  	}
  	input[name=reply]{
  		height: 54px;
  		vertical-align: top;
  	}
  	#pagelist{
  		width: 300px;
  		margin: 0px auto;
  	}
  	label{
  		display: inline-block;
  		width: 80px;
  		height: 30px;
  	}
  	.reply-body{
  		background: #f1faad;
  		border: 1px solid gold;
  		margin: 1px;
  		padding: 5px;
  	}
</style>
<script type="text/javascript">
 
currentPage = 1;
mypath = '<%=request.getContextPath()%>';
// console.log(mypath);

reply = { }; // 전역객체, 동적으로 속성과 기능을 추가 가능 reply.name = "" reply.bonum=31~~

$(function(){
	$.listPageServer(1);
	
	// 이벤트
	
	// 다음 클릭
	$(document).on('click','#next',function(){
		
		// modifyForm이 열려 있는지 비교한다.
		if($('#modifyForm').css('display') != 'none') {
			// 열려있으면
			replyReset();
		}
		
		currentPage = parseInt($('.pageno').last().text().trim()) + 1;
// 		alert(currentPage);
		$.listPageServer(currentPage);
	})
	
	// 이전 클릭
	$(document).on('click','#prev',function(){
		
		// modifyForm이 열려 있는지 비교한다.
		if($('#modifyForm').css('display') != 'none') {
			// 열려있으면
			replyReset();
		}
		
		currentPage = parseInt($('.pageno').first().text().trim()) - 1;
// 		alert(currentPage);
		$.listPageServer(currentPage);
	})
	
	// 페이지번호 클릭
	$(document).on('click','.pageno',function(){
		
		// modifyForm이 열려 있는지 비교한다.
		if($('#modifyForm').css('display') != 'none') {
			// 열려있으면
			replyReset();
		}
		
		currentPage = $(this).text().trim();
		$.listPageServer(currentPage);
	})
	
	// 검색 search클릭
	$('#search').on('click',function(){
		
		// modifyForm이 열려 있는지 비교한다.
		if($('#modifyForm').css('display') != 'none') {
			// 열려있으면
			replyReset();
		}
		
		$.listPageServer(1);
	})
	
	// 글쓰기 data-bs-toggle="modal" data-bs-target="#wModal"
// 	$('#write').on('click',function(){
// 		$('#wModal').modal('show');
// 	})
	
	// 글쓰기 모달창에서 send전송 버튼 클릭
	$('#send').on('click',function(){
		// 입력한 모든 값을 가져온다.
		fdata = $('#wform').serializeJSON();
		
		console.log(fdata);
		
		$('#wform .txt').val("");
		$('#wModal').modal('hide');
		
		// 서버로 전송하기 파라미터 fdata?????
		$.boardWriteServer(fdata);
		
	})
	
	// 수정 삭제 등록 댓글수정 댓글삭제, 제목클릭 -- 이벤트
	$(document).on('click', '.action', function(){
		vaction = $(this).attr('name');
		vidx = $(this).attr('idx');
			
		if(vaction == "modify") {
// 			alert(vidx + "번 글을 수정");

			vmodify = this;

			// 수정할 본문의 내용을 가져온다.
			vparents = $(this).parents('.card');
			vtitle = $(vparents).find('a').text().trim();
			vname = $(vparents).find('#wr').text().trim();
			vmail = $(vparents).find('#em').text().trim();
			vp3 = $(vparents).find('.p3').html().trim();
			
			cont = vp3.replace(/<br>/g,"\n");
			
			// 같은 이름을 html()로 가져오면 첫번째 것만 가져온다.
			// text()는 모두 가져옴
			
			
			// modal창에 출력한다.
			$('#mform #writer').val(vname);
			$('#mform #subject').val(vtitle);
			$('#mform #mail').val(vmail);
			$('#mform #content').val(cont);
			$('#mform #num').val(vidx);
			
			// 모달창 띄울거임
			$('#mModal').modal('show');
			
			$('#mform #writer').prop('disabled', true);
			
		} else if(vaction == "delete") {
			alert(vidx + "번 글을 삭제");
			$.deleteBoardServer(this);
			
		} else if(vaction == "list") {
// 			alert(vidx + "번 글과 댓글을 모두 보기");
			$.replyListServer(this);
			
			// 조회수 증가
// 			vs = $(this).parents('.card').find('#collapse'+vidx).attr('class');
// 			alert(vs);
			
// 			v = $(this).parents('.card').attr('class');
// 			alert(v);
			
			vshow = $(this).attr('aria-expanded');
// 			alert(vshow);
			
			if(vshow == "true") {
				//alert("조회수 증가");
				$.hitUpdateServer(this);
			}
			
			
		} else if(vaction == "reply") {
// 			alert(vidx + "번 글에 댓글 등록");
			
// 			console.log($(this).prev().val());
			
			cont = $(this).prev().val();
			name1 = String.fromCharCode( parseInt(Math.random()*26 + 65)); // A ~ Z 까지 랜덤 생성
			name2 = String.fromCharCode( parseInt(Math.random()*26 + 97)); // a ~ z 까지 랜덤 생성
			name3 = parseInt(Math.random() * 100 + 1);
			
			reply.name = name1 + name2 + name3;
			reply.cont = cont;
			reply.bonum = vidx;
			
			$(this).prev().val("");
			
			// 서버로 전송
			$.replyWriteServer(this);
			
			
			// 댓글 리스트를 출력
			// 비동기이기떄문에 여기 쓰면 안됨, 결과가 생기기 전에 실행될 수 있음
// 			$.replyListServer
		} else if(vaction == "r_modify") {
// 			alert(vidx + "번 댓글을 수정");

			// modifyForm이 열려 있는지 비교한다.
			if($('#modifyForm').css('display') != 'none') {
				// 열려있으면
				replyReset();
			}
			
			// 수정할 내용(원래 내용)을 가져온다.
			modifycont = $(this).parents('.reply-body').find('.p3').html();
			
			// 원래 내용의 <br>태그를 다시 \n으로 변경 - modifyForm(수정폼)에 출력
			mcont = modifycont.replace(/<br>/g, "\n");
			$('#modifyForm textarea').val(mcont)
			
			// 수정폼을 p3으로 이동
// 			$(this).parents('.reply-body').find('.p3').empty();
			$(this).parents('.reply-body').find('.p3').empty().append($('#modifyForm'));		
			
			// 수정폼을 보이기
			$('#modifyForm').css('display', 'block');
// 			$('#modifyForm').show();
			
			
		} else if(vaction == "r_delete") {
			alert(vidx + "번 댓글을 삭제");
			$.deleteReplyServer(this);
			
		}
	}) // 이벤트 끝
	
	replyReset = function(){
		// p3을 찾는다.
		vp3 = $('#modifyForm').parent();
		
		// 수정폼을 body로 이동시킴(append), 안보이게 설정
		$('body').append($('#modifyForm'));
		
// 		$('#modifyForm').hide();
		$('#modifyForm').css('display', 'none');
		
		// 원래 내용을 p3에 다시 출력
		$(vp3).html(modifycont);
	}
	
	// 댓글 수정창에서 확인 버튼
	$('#btnok').on('click',function(){
		// 입력한 내용을 가져온다.
		modicont = $('#modifyForm textarea').val();
		
		// \n을 <br>로 바꿔준다.
		modiout = modicont.replace(/\n/g,"<br>");
		
		// p3을 찾는다.
// 		vp3 = $(this).parents($('.p3')); 위에 .p3이 여러개라 안됨
		vp3 = $('#modifyForm').parent();
		
		// modifyForm을 body로 이동 - 안보이게 설정
		$('body').append($('#modifyForm'));
		$('#modifyForm').css('display', 'none');
		
		// p3에 입력한 내용 출력(<br>태그로 변경된 내용임)
		// DB에 수정 성공 후 해야함
// 		$(vp3).html(modiout);
		
		reply.renum = vidx;
		reply.cont = modicont;
		
		$.replyUpdateServer(this);
	})
	
	// 댓글 수정창에서 취소 버튼
	$('#btnreset').on('click',function(){
		replyReset();
	})
	
	// 글 수정 modal창에서 전송버튼 클릭
	$('#msend').on('click',function(){
		fdata = $('#mform').serializeJSON();
		console.log(fdata);
		
		// 서버로 보내기
		$.boardUpdateServer();
		
		
		// 수정한 내용으로 본문의 내용 화면 바꾸기 - DB에서 update 성공 후에 실행해야함
		
		// modal창에 수정한 내용을 가져온다.
		mwri = $('#mform #writer').val();
		msub = $('#mform #subject').val();
		mmail = $('#mform #mail').val();
		mcon = $('#mform #content').val();
		
		mcon = mcon.replaceAll(/\n/g,"<br>")
		
		$('#mModal').modal('hide');
		
		// 화면(본문의 내용)바꾸기 
// 		vparents = $(vmodify).parents('.card');
// 		$(vparents).find('a').text(msub);
// 		$(vparents).find('#em').text(mmail);
// 		$(vparents).find('.wp3').html(mcon);

	})
}) 
</script>

<style type="text/css">
nav a{
/* 	display: none; 영역없음 아래껀 영역있음*/
	visibility: hidden;
}
#stype {
	width: 100px;
}
#sword{
	width: 150px;
}
label{
	display: inline-block;
	width: 80px;
	height: 30px;
}
#modifyForm{
	display: none;
}
</style>

</head>
<body>

<div id="modifyForm">
	<textarea rows="5" cols="50"></textarea>
	<input type="button" value="확인" id="btnok">
	<input type="button" value="취소" id="btnreset">
</div>


<input type="button" value="글쓰기" id="write" data-bs-toggle="modal" data-bs-target="#wModal">
<br><br>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
<!--     <a class="navbar-brand" href="javascript:void(0)">게시판</a> -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
      	
      	<select class="form-select" id="stype">
		  <option value="">전체</option>
		  <option value="writer">이름</option>
		  <option value="subject">제목</option>
		  <option value="content">내용</option>
		</select>
      
        <input class="form-control me-2" type="text" id="sword" placeholder="Search">
        <button class="btn btn-primary" type="button" id="search">Search</button>
      </form>
    </div>
  </div>
</nav>
<br><br>

<div id="result" class="container mt-3"></div>
<br><br>
<div id="pagelist"></div>

<!-- 글쓰기 The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글쓰기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="" name="wform" id="wform">
          <label>이름</label>
          <input type="text" class="txt" name="writer"><br>
          
          <label>제목</label>
          <input type="text" class="txt" name="subject"><br>
          
          <label>이메일</label>
          <input type="text" class="txt" name="mail"><br>
          
          <label>비밀번호</label>
          <input type="password" class="txt" name="password"><br>
          
          <label>내용</label><br>
		  <textarea rows="5" cols="40" class="txt" name="content"></textarea>
		  <br><br>
		  <input type="button" value="전송" id="send">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- 글수정 The Modal -->
<div class="modal" id="mModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="" name="mform" id="mform">
        
          <input type="hidden" id="num" name="num">
        
          <label>이름</label>
          <input type="text" class="txt" id="writer" name="writer"><br>
          
          <label>제목</label>
          <input type="text" class="txt" id="subject" name="subject"><br>
          
          <label>이메일</label>
          <input type="text" class="txt" id="mail" name="mail"><br>
          
          <label>비밀번호</label>
          <input type="password" class="txt" id="password" name="password" password="password"><br>
          
          <label>내용</label><br>
		  <textarea rows="5" cols="40" class="txt" id=content name="content"></textarea>
		  <br><br>
		  <input type="button" value="전송" id="msend">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>