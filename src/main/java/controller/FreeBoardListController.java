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

import org.apache.catalina.core.ApplicationContext;

import common.JSFunction;
import common.PageHandler;
import common.SearchCondition;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;


@WebServlet("/FreeBoardList")
public class FreeBoardListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		if(JSFunction.loginChk(req)) {
				FreeBoardDao dao = new FreeBoardDao(getServletContext());
				
				Map<String, Object> param = new HashMap<String, Object>();
				String searchField = req.getParameter("searchField");
				String searchWord = req.getParameter("searchWord");
				String sortField = req.getParameter("sortField");
				
				if(sortField != null) {
					if(sortField.equals("postDateDESC")) {
						sortField = "postDate DESC";
					} else {
						sortField = req.getParameter("sortField");
					}
				}
				
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
				
				int totalCount = dao.selectCount(param);
				ph = new PageHandler(totalCount, sc);
				param.put("offset", sc.getOffset(page));
				param.put("pageSize", pageSize);
				param.put("sortField", sortField);
				
				List<FreeBoardDto> boardLists = dao.selectList(param);
				req.setAttribute("ph", ph);
				req.setAttribute("boardLists", boardLists);
				req.setAttribute("sortField", sortField);
				
				Date today = new Date();
				req.setAttribute("today", today);
				dao.close();
				
				req.getRequestDispatcher("./FreeBoardList.jsp").forward(req, resp);

		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
	
}
