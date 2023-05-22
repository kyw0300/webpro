package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청시 전송데이터 받기 - id
		String userId = request.getParameter("id");
		
		// service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		// id넣어서 service메서드 호출 - 리턴값 받기
		String res = service.idCheck(userId);
		// a001 입력시 a001를 리턴
		// 없는값 입력시 null 리턴
		
		// 결과값을 request에 저장
		request.setAttribute("resId", res);
		
		// view페이지로 이동
		request.getRequestDispatcher("/view/idcheck.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
