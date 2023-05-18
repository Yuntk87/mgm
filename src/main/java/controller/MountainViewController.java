package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MountainDao;
import dao.MountainLikeDao;
import dto.MountainDto;

@WebServlet("/view")
public class MountainViewController extends HttpServlet{
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			String snum = request.getParameter("m_num");
			System.out.println(snum);
			
			
			int num = Integer.parseInt(snum);
			
			MountainDao dao = new MountainDao(request.getServletContext());
			
			// 로그인이랑 연동되었을 경우 "id" -> key값으로 변경필요
			HttpSession session = request.getSession();
			String id = session.getAttribute("UserId").toString();
			System.out.println(id);
			
			MountainDto mountainList = dao.selectMountain(num);
			MountainLikeDao ldao = new MountainLikeDao(request.getServletContext());
			int res = ldao.count(num, id);
			request.setAttribute("res", res);
			request.setAttribute("mountainList", mountainList);
			dao.close();
			request.getRequestDispatcher("./MountainView.jsp").forward(request, response);
			
		}
}
