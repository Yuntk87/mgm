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

@WebServlet("/ConfirmBoardDelete")
public class ConfirmBoardDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String snum = req.getParameter("num");
			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./ConfirmBoardList");
				return;
			} else {
				int cdnum = Integer.parseInt(snum);
				ConfirmDao dao = new ConfirmDao(getServletContext());
				int res=0;
				res = dao.deleteCerBoard(cdnum);
				dao.close();
				
				if(res==1) {
					resp.sendRedirect("./admin");
				} else {
					JSFunction.alertBack(resp, "삭제 실패");
				}
				
			}

	}
	
}

