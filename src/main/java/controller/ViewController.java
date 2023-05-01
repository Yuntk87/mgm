package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageHandler;
import common.SearchCondition;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;

@WebServlet("/view")
public class ViewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		
		if("FreeBoard".equals(mode)) {
			String temp = req.getParameter("num");
			int num = 0;
			if(temp != null) {
				num = Integer.parseInt(temp);			
			}
			
			FreeBoardDao dao = new FreeBoardDao(req.getServletContext());
			dao.updateViewCount(num);
			FreeBoardDto dto = dao.selectView(num);
			req.setAttribute("dto", dto);
			
			int page = Integer.parseInt(req.getParameter("page"));
			int pageSize = Integer.parseInt(req.getParameter("pageSize"));
			String searchField = req.getParameter("searchField");
			String searchWord = req.getParameter("searchWord");
			SearchCondition sc = new SearchCondition(searchField, searchWord, page, pageSize);
			req.setAttribute("sc", sc);
			
			dao.close();
			req.getRequestDispatcher("./FreeBoardView.jsp").forward(req, resp);
			
		}
		

	}

	
}
