package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;

@WebServlet("/admin")
public class AdminController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("UserId");
		if("admin".equals(id)) {
			UserDao dao = new UserDao(getServletContext());
			ArrayList<UserDto> userList = dao.selectAll();
			
			
			
			req.setAttribute("userList", userList);
			
			req.getRequestDispatcher("./AdminPage.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
	
}
