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
import dto.AskCommentDto;

@WebServlet("/AskCommentEdit")
public class AskCommentEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String snum = req.getParameter("ac_num");

			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./AskBoardList");
				return;
			}
			int num = Integer.parseInt(snum);
			
			AskCommentDao dao = new AskCommentDao(req.getServletContext());
			AskCommentDto dto = dao.selectView(num);
			req.setAttribute("dto", dto);
			
			HttpSession session = req.getSession();
			String id = session.getAttribute("UserId").toString();
			
			if(!id.equals("admin")) {
				JSFunction.alertBack(resp, "관리자만 수정할 수 있습니다.");
				return;
			}
			
			dao.close();
			req.getRequestDispatcher("/AskCommentEdit.jsp").forward(req, resp);
		} 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String snum = req.getParameter("ac_num");

			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./AskBoardList");
				return;
			}
			int acnum = Integer.parseInt(snum);
			String comment = req.getParameter("comment");
			
			AskCommentDao dao = new AskCommentDao(req.getServletContext());
			AskCommentDto dto = new AskCommentDto(acnum, comment);
			int res = dao.Edit(dto);
			if (res==1) {
				resp.sendRedirect("./AskBoardList");
			}else {
				JSFunction.alertBack(resp, "댓글 수정 실패");
			}
			
			dao.close();
	}
}
