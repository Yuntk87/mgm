package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MateJoinDao;
import dao.UserDao;
import dto.MateJoinDto;

@WebServlet("/user")
public class UserController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		
		if("del".equals(mode)) {
			String temp = req.getParameter("userNum");
			int userNum = 0;
			if(temp != null) {
				userNum = Integer.parseInt(temp);
			}
			UserDao dao = new UserDao(getServletContext());
			dao.delete(userNum);
			dao.close();
			
			resp.sendRedirect("./UserTable.jsp");
		}
			
	}
	
}
