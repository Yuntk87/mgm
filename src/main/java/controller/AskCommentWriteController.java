package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.AskCommentDao;
import dao.AskDao;
import dto.AskCommentDto;
import dto.AskDto;
@WebServlet("/AskCommentWrite")
public class AskCommentWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("ask_num");
		int ask_num = 0;
		if(temp!=null) ask_num = Integer.parseInt(temp);
		AskDao dao = new AskDao(req.getServletContext());
		AskDto dto = dao.selectView(ask_num);
		req.setAttribute("dto", dto);
		dao.close();
		req.getRequestDispatcher("./AskCommentWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("ask_num");
		int ask_num = 0;
		if(temp!=null) ask_num = Integer.parseInt(temp);
		String comment = req.getParameter("comment");
		
		AskCommentDao dao = new AskCommentDao(getServletContext());
		AskDao adao = new AskDao(getServletContext());
				
		HttpSession session = req.getSession();
		String commenter = "";
//		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
		if(session.getAttribute("UserId") != null && "admin".equals(session.getAttribute("UserId"))) commenter = session.getAttribute("UserNickName").toString();
		
		AskCommentDto dto = new AskCommentDto(commenter, comment, ask_num);
		
		System.out.println(dto);
		int res = dao.insert(dto);
		dao.close();
		if(res==1) {
			adao.updateCommentCnt(ask_num, 1);
			System.out.println(temp+"/"+comment);
			resp.sendRedirect("./AskBoardList");
		} else {
			JSFunction.alertBack(resp, "글쓰기 실패");
		}
	}
}
