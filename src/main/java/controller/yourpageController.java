package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.UserDao;
import dto.FreeBoardDto;
import dto.UserDto;

@WebServlet("/yourpage")
public class yourpageController extends HttpServlet  {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		UserDao dao = new UserDao(getServletContext());
		UserDto dto = dao.selectUser(id);
		req.setAttribute("uto", dto);
		
		
		FreeBoardDao fdao = new FreeBoardDao(getServletContext());
		List<FreeBoardDto> boardLists = fdao.selectListmp(id);
		req.setAttribute("boardLists", boardLists);
		
		
		ConfirmDao cdao = new ConfirmDao(getServletContext());
		String res= cdao.selectmountain(id);
		req.setAttribute("mountainLists", res);
		
		req.getRequestDispatcher("./yourpage.jsp").forward(req, resp);	}
	

}
