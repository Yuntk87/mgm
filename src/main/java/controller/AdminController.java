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

import common.PageHandler;
import common.SearchCondition;
import dao.ConfirmDao;
import dao.UserDao;
import dto.ConfirmBoardDto;
import dto.UserDto;

@WebServlet("/admin")
public class AdminController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("UserId");
		if("admin".equals(id)) {
			
			//유저관리
			UserDao udao = new UserDao(getServletContext());
			ArrayList<UserDto> userList = udao.selectAll();
			req.setAttribute("userList", userList);
			
			//인증관리
			ConfirmDao cdao = new ConfirmDao(getServletContext());
			
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
			
			int totalCount = cdao.selectCount(param);
			ph = new PageHandler(totalCount, sc);
			param.put("offset", sc.getOffset(page));
			param.put("pageSize", pageSize);
			
			List<ConfirmBoardDto> boardLists = cdao.selectList(param);
			req.setAttribute("ph", ph);
			req.setAttribute("boardLists", boardLists);
			
			Date today = new Date();
			req.setAttribute("today", today);
			
			
			udao.close();
			cdao.close();
			req.getRequestDispatcher("./AdminPage.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
	
}
