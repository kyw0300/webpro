package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("mem_id");
		String pass = request.getParameter("mem_pass");
		String name = request.getParameter("mem_name");
		String bir = request.getParameter("mem_bir");
		String hp = request.getParameter("mem_hp");
		String mail = request.getParameter("mem_mail");
		String zip = request.getParameter("mem_zip");
		String add1 = request.getParameter("mem_add1");
		String add2 = request.getParameter("mem_add2");
		
		MemberVO memVO = new MemberVO();
		memVO.setMem_id(id);
		memVO.setMem_pass(pass);
		memVO.setMem_name(name);
		memVO.setMem_bir(bir);
		memVO.setMem_hp(hp);
		memVO.setMem_mail(mail);
		memVO.setMem_zip(zip);
		memVO.setMem_add1(add1);
		memVO.setMem_add2(add2);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.insertMember(memVO);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
	}

}
