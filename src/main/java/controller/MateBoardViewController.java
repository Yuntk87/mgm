package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PageHandler;
import common.SearchCondition;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dao.MateJoinDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;
import dto.MateJoinDto;

@WebServlet("/MateBoardView")
public class MateBoardViewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String temp = req.getParameter("num");
			int num = 0;
			if(temp != null) {
				num = Integer.parseInt(temp);			
			}
			
			MateBoardDao dao = new MateBoardDao(req.getServletContext());
			dao.updateViewCnt(num);
			MateBoardDto dto = dao.selectMateBoard(num);
			req.setAttribute("dto", dto);
			
			int page = Integer.parseInt(req.getParameter("page"));
			int pageSize = Integer.parseInt(req.getParameter("pageSize"));
			String searchField = req.getParameter("searchField");
			String searchWord = req.getParameter("searchWord");
			SearchCondition sc = new SearchCondition(searchField, searchWord, page, pageSize);
			req.setAttribute("sc", sc);
			
			HttpSession session = req.getSession();
			String jid = session.getAttribute("UserId").toString();
			MateJoinDao mdao = new MateJoinDao(getServletContext());
			MateJoinDto mdto = mdao.selectMateBoardJoin(num, jid);
			int cnt = mdao.count(num);
			req.setAttribute("cnt", cnt);
			req.setAttribute("mdto", mdto);
			
			mdao.close();
			dao.close();
			req.getRequestDispatcher("./MateBoardView.jsp").forward(req, resp);

	}
	
}
