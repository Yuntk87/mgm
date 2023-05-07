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

@WebServlet("/MateBoardDelete")
public class MateBoardDeleteController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String snum = req.getParameter("num");
			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./MateBoardList");
				return;
			} else {
				int matenum = Integer.parseInt(snum);
				MateBoardDao dao = new MateBoardDao(getServletContext());
				MateBoardDto dto = dao.selectView(matenum);
				
				HttpSession session = req.getSession();
				String id = session.getAttribute("UserId").toString();
				int res=0;
				
				if(id == null || dto == null) {
					JSFunction.alertBack(resp, "잘못된 접근입니다.");
				} else if(id.equals(dto.getId())) {
					res = dao.deleteView(matenum);
					dao.close();
					if(res==1) {
						resp.sendRedirect("./MateBoardList");
					} else {
						JSFunction.alertBack(resp, "삭제 실패");
					}
				} else {
					JSFunction.alertBack(resp, "잘못된 접근입니다.");
				}
			}

	}
	
}
