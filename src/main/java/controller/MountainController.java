package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.MountainDao;
import dto.MountainDto;

@WebServlet("/mountain")
public class MountainController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");


	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		String mName = req.getParameter("mName");

		if("write".equals(mode)) {
			MountainDao dao = new MountainDao(getServletContext());
			MountainDto dto = dao.selectMountain(mName);
			req.setAttribute("dto", dto);
			dao.close();
			req.getRequestDispatcher("./MateBoardWrite.jsp").forward(req, resp);
		} else if("edit".equals(mode)) {
			MountainDao dao = new MountainDao(getServletContext());
			MountainDto dto = dao.selectMountain(mName);
			req.setAttribute("dto", dto);
			dao.close();
			req.getRequestDispatcher("./MateBoardEdit.jsp").forward(req, resp);
		} else if("register".equals(mode)) {
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("UserId");
			
			if("qwe".equals(id)) {
				String mname = req.getParameter("mname");
				String m_addr_1 = req.getParameter("m_addr_1");
				String m_addr_2 = req.getParameter("m_addr_2");
				
				String temp = req.getParameter("level");
				int level = 0;
				if(temp != null) {
					level = Integer.parseInt(temp);
				}
				
				MountainDao dao = new MountainDao(getServletContext());
				MountainDto dto = new MountainDto(mname, m_addr_1, m_addr_2, level);
				int res = dao.insertMountain(dto);
				
				if(res == 1) {
					resp.sendRedirect("./Main.jsp");
				} else {
					JSFunction.alertBack(resp, "등록 실패");
				}
				dao.close();
				
			} else {
				JSFunction.alertLocation(resp, "권한이 없습니다.", "./main.jsp");
			}
			
		} else {
			System.out.println("산 조회 실패");
		}
	}
	

}
