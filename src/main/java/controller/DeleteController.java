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
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;

@WebServlet("/delete")
public class DeleteController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String snum = req.getParameter("num");
		if(snum==null) {
			JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./List");
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
			} else if(id.equals(dto.getId())) {
				res = dao.deleteView(fbnum);
				dao.close();
				if(res==1) {
					resp.sendRedirect("./List?mode=FreeBoard");
				} else {
					JSFunction.alertBack(resp, "삭제 실패");
				}
			} else {
				JSFunction.alertBack(resp, "잘못된 접근입니다.");
			}

		}

	}
	
}
