package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/boardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("subject");
		String mail = request.getParameter("mail");
		String content = request.getParameter("content");
		String pass = request.getParameter("password");
		
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setSubject(title);
		vo.setMail(mail);
		vo.setContent(content);
		vo.setPassword(pass);
		vo.setWip(request.getRemoteAddr());
		
		IBoardService service = BoardServiceImpl.getInstance();
		int cnt = service.updateBoard(vo);
		
		request.setAttribute("result", cnt);
		
		// view 페이지로 이동
		request.getRequestDispatcher("/boardView/result.jsp").forward(request, response);
		
	}

}
