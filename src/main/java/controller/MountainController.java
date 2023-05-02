package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MountainDao;
import dto.MountainDto;

@WebServlet("/mountain")
public class MountainController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mName = req.getParameter("mName");
		
		MountainDao dao = new MountainDao(getServletContext());
		MountainDto dto = dao.selectMountain(mName);
		req.setAttribute("dto", dto);
		
		dao.close();
		req.getRequestDispatcher("./MateBoardWrite.jsp").forward(req, resp);
	}
	
}
