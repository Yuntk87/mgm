package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;
import dto.MountainDto;

@WebServlet("/FreeBoardWrite")
public class FreeBoardWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		if(JSFunction.loginChk(req)) {
				req.getRequestDispatcher("/FreeBoardWrite.jsp").forward(req, resp);				
		} else {
			req.getRequestDispatcher("/LoginForm.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(JSFunction.loginChk(req)) {

				HttpSession session = req.getSession();
				String id = (String)session.getAttribute("UserId");
				String nickName = req.getParameter("nickName");
				String title = req.getParameter("title");
				String content = req.getParameter("content");
				String category = req.getParameter("category");
				System.out.println(category);
				
				FreeBoardDao dao = new FreeBoardDao(req.getServletContext());
				FreeBoardDto dto = new FreeBoardDto(category, nickName, title, content);
				System.out.println(dto);
				int res = dao.insertWrite(dto);
				
				if(res==1) {
					resp.sendRedirect("./FreeBoardList");
				} else {
					JSFunction.alertBack(resp, "글쓰기 실패");
				}
				dao.close();
				
		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
		
		

	}
	
}