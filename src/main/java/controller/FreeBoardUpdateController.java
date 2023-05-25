package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

import common.JSFunction;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;

@WebServlet("/FreeBoardEdit")
public class FreeBoardUpdateController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String snum = req.getParameter("num");

			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./FreeBoardList");
				return;
			}
			int num = Integer.parseInt(snum);
			
			FreeBoardDao dao = new FreeBoardDao(req.getServletContext());
			FreeBoardDto dto = dao.selectView(num);
			req.setAttribute("dto", dto);
			
			HttpSession session = req.getSession();
			String id = session.getAttribute("UserId").toString();
			
			if(!id.equals(dto.getId())) {
				JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
				return;
			}
			
			dao.close();
			req.getRequestDispatcher("/FreeBoardEdit.jsp").forward(req, resp);
		} 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String snum = req.getParameter("num");

			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./FreeBoardList");
				return;
			}
			int fbnum = Integer.parseInt(snum);
			String category = req.getParameter("category");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			FreeBoardDao dao = new FreeBoardDao(req.getServletContext());
			FreeBoardDto dto = new FreeBoardDto(fbnum, category, title, content);
			dao.updateEdit(dto);
			resp.sendRedirect("./FreeBoardList");
			dao.close();
	}

}
