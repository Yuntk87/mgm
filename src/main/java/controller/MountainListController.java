package controller;

import java.io.IOException;
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
import dao.MountainDao;
import dto.MountainDto;


@WebServlet("/MountainList")
public class MountainListController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("UserId");
//		String requestUri = request.getRequestURI();
//		if(id == null) {
//			System.out.println(requestUri);
//			request.getRequestDispatcher("./LoginForm.jsp?toUrl="+requestUri).forward(request, response);
//		}
		
		MountainDao dao = new MountainDao(request.getServletContext());
		Map<String, String> param = new HashMap<String, String>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");

		int pageSize = Integer.parseInt(request.getServletContext().getInitParameter("PageSize"));
		
		SearchCondition sc = null;
		PageHandler ph = null;
		
		int page = 1;
		String pageTemp = request.getParameter("page");
		
		if(pageTemp != null && !"".equals(pageTemp)) {
			page = Integer.parseInt(pageTemp);
		}
		if(searchWord != null && !"".equals(searchWord)) {
			param.put("searchField", searchField);
			param.put("searchWord", searchWord);
			sc = new SearchCondition(searchField, searchWord, page, pageSize);
		}else {
			sc = new SearchCondition(page, pageSize);
		}
		int totalCount = dao.selectCount(param);
		System.out.println(totalCount);
		System.out.println(sc.getQueryString());
		ph = new PageHandler(totalCount, sc);
		
		param.put("offset", sc.getOffset(page)+"");
		param.put("pageSize", pageSize+"");
		
		List<MountainDto> mountainList = dao.selectList(param);
		
		request.setAttribute("ph", ph);
		request.setAttribute("mountainList", mountainList);
		
		dao.close();
		
		request.getRequestDispatcher("./MountainList.jsp").forward(request, response);
		
	}
}
