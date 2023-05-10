package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import dao.MountainDao;
import dto.MountainDto;

@WebServlet("/MountainRegister")
public class MountainRegisterController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("./MountainSearchRegister.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_name = request.getParameter("m_name");
		String m_addr_1 = request.getParameter("m_addr_1");
		String m_addr_2 = request.getParameter("m_addr_2");
		String snum = request.getParameter("level");
		int level = Integer.parseInt(snum);

		
		MountainDto dto = new MountainDto( m_name, m_addr_1, m_addr_2, level);

		MountainDao dao = new MountainDao(request.getServletContext());
		int res = dao.insertMountain(dto);
		
		if(res==1) {
			response.sendRedirect("./MountainRegisterList");
		} else {
			JSFunction.alertBack(response, "글쓰기 실패");
		}
		dao.close();
		
		
		
	}
}
