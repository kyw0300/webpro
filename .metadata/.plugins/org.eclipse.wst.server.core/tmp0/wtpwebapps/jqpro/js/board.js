/**
 * 
 */
$.hitUpdateServer = function(target){
	$.ajax({
		url: `${mypath}/hitUpdate.do`,
		type: 'get',
		data: {num: vidx},
		success: function(res) {
			if(res.flag == "ok") {
//				alert("조회수 증가 성공");
				
				// 화면수정
				vhit = $(target).parents('.card').find('#hit');
				
				phit = parseInt($(vhit).text()) + 1;
				
		 		$(vhit).text(phit);
		 						
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

$.boardUpdateServer = function(){
	$.ajax({
		url: `${mypath}/boardUpdate.do`,
		type: 'post',
		data: fdata,
		success: function(res) {
			if(res.flag == "ok") {
//				alert("글 수정성공");
		 		vparents = $(vmodify).parents('.card');
		 		$(vparents).find('a').text(msub);
		 		$(vparents).find('#em').text(mmail);
		 		$(vparents).find('.wp3').html(mcon);				
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

$.replyUpdateServer = function(target){
	$.ajax({
		url: `${mypath}/replyUpdate.do`,
		type: 'post',
		data: reply, // reply객체 - renum, cont 들어있다
		success: function(res) {
			if(res.flag == "ok") {
//				alert("댓글 수정성공");
				
//				$.replyListServer(target);
				$(vp3).html(modiout);
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

$.deleteBoardServer = function(target){ // target: 클릭한 등록 버튼 , 클릭한 제목
	$.ajax({
		url: `${mypath}/boardDelete.do`,
		type: 'get',
		data: { "num": vidx },
		success: function(res) {
			if(res.flag == "ok") {
//				alert("게시글 삭제성공");
				$(target).parents('.card').remove();
				currentPage = 1;
				$.listPageServer(currentPage);
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
	
}

$.deleteReplyServer = function(target){ // target: 클릭한 등록 버튼 , 클릭한 제목
	$.ajax({
		url: `${mypath}/replyDelete.do`,
		type: 'get',
		data: { "renum": vidx },
		success: function(res) {
			if(res.flag == "ok") {
//				alert("댓글 삭제성공");
				$(target).parents('.reply-body').remove();
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
	
}

$.replyListServer = function(target){ // target: 클릭한 등록 버튼 , 클릭한 제목
	$.ajax({
		url: `${mypath}/replyList.do`,
		type: 'get',
		// board.jsp 에서 만든 전역변수 사용 가능 (board.js가 외부 스크립트로 들어갔기 때문, 코딩만 따로했지 같이 실행)
		data: { "bonum": vidx }, // 값으로 reply.bonum 도 사용가능(전역변수)
		success: function(res){
//			alert("댓글리스트 성공");
			
			// target: 출력한 등록버튼을 기준으로 
			rcode = "";
			$.each(res,function(i,v){
				content = v.cont;
				content = content.replaceAll(/\n/g,"<br>");
				
				rcode += "<div class='reply-body'>";
			    rcode += "<p class='p1'>";
			    rcode += `작성자&nbsp;<span id="rwr">${v.name}</span>&nbsp;&nbsp;&nbsp;
			    	        날짜&nbsp;<span id="rda">${v.redate}</span>&nbsp;&nbsp;&nbsp;`;
			    rcode += "</p>";
			    rcode += "<p class='p2'>"
			    rcode += `<input type='button' idx= '${v.renum}' name='r_delete' class='action' value='댓글삭제'>`;
			    rcode += `<input type='button' idx= '${v.renum}' name='r_modify' class='action' value='댓글수정'></p>`;
	            
			    rcode += "<p class='p3'>" + content + "</p>";
	            
			    rcode += `</div>`
			})
			
			$(target).parents('.card').find('.reply-body').remove();
			$(target).parents('.card').find('.card-body').append(rcode); 
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

$.replyWriteServer = function(re){
	$.ajax({
		url: `${mypath}/replyWrite.do`,
		type: 'post',
		data: reply, // cont, bonum, name
		success : function(res){
			// 저장성공
//			alert(res.flag);
			if(res.flag == "ok") {
				// 댓글내용을 출력 - 등록버튼(re)을 기준으로 출력
				$.replyListServer(re);
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

$.boardWriteServer = function(fdata){
	$.ajax({
		url: `${mypath}/boardWrite.do`,
		type: 'post',
		data: fdata,
		success : function(res) {
			alert(res.flag);
			if(res.flag == "ok") {
				currentPage = 1;
				$.listPageServer(currentPage);
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

$.listPageServer = function(cpage) {
	vtype = $('#stype option:selected').val().trim();
	vword = $('#sword').val().trim();

	$.ajax({
		url: `${mypath}/boardList.do`,
		type: 'post',
		data: {
			"page": cpage,
			"stype": vtype,
			"sword": vword
		},
		success: function(res) {
			// 			 alert("성공");
			startPage = res.sp;
			endPage = res.ep;
			totalPage = res.tp;

			code = "<h2>YOUNGWOO 게시판</h2>";
			code += "<div id='accordion'>";
			$(res.datas).each(function(i, v) {
				content = v.content;
				content = content.replaceAll(/\n/g,"<br>");
				
				code += "<div class='card'>";
				code += "<div class='card-header'>";
				code += `<a class='btn action' name = 'list' idx='${v.num}' data-bs-toggle='collapse' href='#collapse${v.num}' +  id='title1'> ${v.subject} </a></div>`;
				code += `<div id='collapse${v.num}' class='collapse' data-bs-parent='#accordion'>`;
				code += "<div class='card-body'>";
				code += "<p class='p1'>";
				code += `작성자&nbsp;<span id="wr">${v.writer}</span>&nbsp;&nbsp;&nbsp;  이메일&nbsp;<span id="em">${v.mail}</span>&nbsp;&nbsp;&nbsp; 
			            날짜&nbsp;<span id="da">${v.wdate}</span>&nbsp;&nbsp;&nbsp;    조회수&nbsp;<span id="hit">${v.hit}</span>&nbsp;&nbsp;&nbsp`;
				code += "</p>";
				code += "<p class='p2'>"
				code += `<input type='button' idx= '${v.num}' name='delete' class='action' value='삭제'>`;
				code += `<input type='button' idx= '${v.num}' name='modify' class='action' value='수정'></p>`;

				code += "<p class='p3 wp3'>" + content + "</p>";

				code += `<p class="p4">
		          	<textarea rows="" cols="50"></textarea>
		          	<input type="button" idx=${v.num} name="reply" class="action" value="등록">
		          </p></div></div></div>`;
			})
			code += "</div></div>";

			// 리스트 출력
			$('#result').html(code);

			// 페이지 처리
			// 이전
			pager = "";
			pager += `<ul class="pagination">`;
			if (startPage > 1) {
				pager += `<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`;
				// 				 pager += `</ul>`;
			}

			// 페이지번호
			for (i = startPage; i <= endPage; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`
				} else {
					pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`
				}
			}

			// 다음
			if (endPage < totalPage) {
				pager += `<li class="page-item"><a id="next" class="page-link" href="#">Next</a></li>`;
			}
			pager += `</ul>`;

			$('#pagelist').html(pager);

		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}
