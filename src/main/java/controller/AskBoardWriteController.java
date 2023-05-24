package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.AskDao;
import dao.FreeBoardDao;
import dto.AskDto;
import dto.FreeBoardDto;

@WebServlet("/AskBoardWrite")
public class AskBoardWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(JSFunction.loginChk(req)) {
			req.getRequestDispatcher("/AskBoardWrite.jsp").forward(req, resp);				
		} else {
		req.getRequestDispatcher("/LoginForm.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(JSFunction.loginChk(req)) {

			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("UserId");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			AskDao dao = new AskDao(req.getServletContext());
			AskDto dto = new AskDto(id, title, content);
			System.out.println(dto);
			int res = dao.insertWrite(dto);
			
			if(res==1) {
				resp.sendRedirect("./AskBoardList");
			} else {
				JSFunction.alertBack(resp, "글쓰기 실패");
			}
			dao.close();
			
		} else {
		req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
}
