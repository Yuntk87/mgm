package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;

@WebServlet("/FreeBoardDelete")
public class FreeBoardDeleteController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String snum = req.getParameter("num");
			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./FreeBoardList");
				return;
			} else {
				int fbnum = Integer.parseInt(snum);
				FreeBoardDao dao = new FreeBoardDao(getServletContext());
				FreeBoardDto dto = dao.selectView(fbnum);
				
				HttpSession session = req.getSession();
				String id = session.getAttribute("UserId").toString();
				int res=0;
				
				if(id == null || dto == null) {
					JSFunction.alertBack(resp, "잘못된 접근입니다.");
				} else if(id.equals(dto.getId()) || "admin".equals(id) ) {
					res = dao.deleteView(fbnum);
					dao.close();
					if(res==1) {
						resp.sendRedirect("./FreeBoardList");
					} else {
						JSFunction.alertBack(resp, "삭제 실패");
					}
				} else {
					JSFunction.alertBack(resp, "잘못된 접근입니다.");
				}
			}

	}
	
}
