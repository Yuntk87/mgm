package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import common.PageHandler;
import common.SearchCondition;
import dao.AskCommentDao;
import dao.AskDao;
import dao.CommentDao;
import dao.FreeBoardDao;
import dto.AskCommentDto;
import dto.AskDto;
import dto.FreeBoardDto;

@WebServlet("/AskBoardList")
public class AskBoardListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		if(JSFunction.loginChk(req)) {
				AskDao dao = new AskDao(getServletContext());
				
				Map<String, Object> param = new HashMap<String, Object>();
				String searchField = req.getParameter("searchField");
				String searchWord = req.getParameter("searchWord");
				int pageSize = Integer.parseInt(req.getServletContext().getInitParameter("PageSize"));
				
				SearchCondition sc = null;
				PageHandler ph = null;
				
				int page = 1;
				String pageTemp = req.getParameter("page");
				if(pageTemp != null && !"".equals(pageTemp))
					page = Integer.parseInt(pageTemp);
				
				if(searchWord != null && !"".equals(searchWord) && !"null".equals(searchWord)) {
					param.put("searchField", searchField);
					param.put("searchWord", searchWord);
					sc = new SearchCondition(searchField,searchWord,page,pageSize);
				} else {
					sc = new SearchCondition(page,pageSize);
				}
				
				HttpSession session = req.getSession();
				String id = session.getAttribute("UserId").toString();
				
				
				
				Date today = new Date();
				req.setAttribute("today", today);
				
				if(!id.equals("admin")) {
					int totalCount = dao.selectMyCount(id);
					ph = new PageHandler(totalCount, sc);
					
					List<AskDto> boardLists = dao.selectMyList(id);
					req.setAttribute("ph", ph);
					req.setAttribute("boardLists", boardLists);
					req.getRequestDispatcher("./AskBoardList.jsp").forward(req, resp);
					dao.close();
				}else {
					int totalCount = dao.selectCount(param);
					ph = new PageHandler(totalCount, sc);
					param.put("offset", sc.getOffset(page));
					param.put("pageSize", pageSize);
					
					List<AskDto> boardLists = dao.selectList(param);
					req.setAttribute("ph", ph);
					req.setAttribute("boardLists", boardLists);
					req.getRequestDispatcher("./AskBoardList.jsp").forward(req, resp);
					dao.close();
				}
					

		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}

}