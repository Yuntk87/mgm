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


@WebServlet("/AskBoardDelete")
public class AskBoardDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String snum = req.getParameter("num");
			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./FreeBoardList");
				return;
			} else {
				int asknum = Integer.parseInt(snum);
				AskDao dao = new AskDao(getServletContext());
				AskDto dto = dao.selectView(asknum);
				
				HttpSession session = req.getSession();
				String id = session.getAttribute("UserId").toString();
				int res=0;
				
				if(id == null || dto == null) {
					JSFunction.alertBack(resp, "잘못된 접근입니다.");
				} else if(id.equals(dto.getId()) || "admin".equals(id) ) {
					res = dao.deleteView(asknum);
					dao.close();
					if(res==1) {
						resp.sendRedirect("./AskBoardList");
					} else {
						JSFunction.alertBack(resp, "삭제 실패");
					}
				} else {
					JSFunction.alertBack(resp, "잘못된 접근입니다.");
				}
			}

	}
}
