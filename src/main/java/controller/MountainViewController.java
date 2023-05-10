package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MountainDao;
import dto.MountainDto;

@WebServlet("/MountainView")
public class MountainViewController extends HttpServlet{
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			String snum = request.getParameter("m_num");
			System.out.println(snum);
			
			
			int num = Integer.parseInt(snum);
			
			MountainDao dao = new MountainDao(request.getServletContext());
			
			dao.updateRecommend(num);
			
			MountainDto mountainList = dao.selectMountain(num);
			
			request.setAttribute("mountainList", mountainList);
			dao.close();
			request.getRequestDispatcher("./MountainView.jsp").forward(request, response);
			
		}
}
