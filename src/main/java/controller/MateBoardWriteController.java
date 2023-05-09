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
import dao.MountainDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;
import dto.MountainDto;

@WebServlet("/MateBoardWrite")
public class MateBoardWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(JSFunction.loginChk(req)) {
				req.getRequestDispatcher("/MateBoardWrite.jsp").forward(req, resp);	
		} else {
			req.getRequestDispatcher("/LoginForm.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(JSFunction.loginChk(req)) {

				String tmp = req.getParameter("mNum");
				int m_num = 0;
				if(tmp != null) {
					m_num = Integer.parseInt(tmp);
				}
				
				HttpSession session = req.getSession();
				String id = (String)session.getAttribute("UserId");
				String nickName = req.getParameter("nickName");
				String title = req.getParameter("title");
				String content = req.getParameter("content");
				int limit = Integer.parseInt(req.getParameter("limit"));
	
				String temp1 = req.getParameter("dDay");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
				Date dDay = null;
				if(temp1 != null) {
					try {
						dDay = sdf.parse(temp1);
					} catch (ParseException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}				
				}
				MateBoardDao dao = new MateBoardDao(req.getServletContext());
				MateBoardDto dto = new MateBoardDto(m_num, nickName, title, content, dDay, limit);
				System.out.println(dto);
				
				int res = dao.insertMateBoard(dto);
				
				if(res==1) {
					resp.sendRedirect("./MateBoardList");
				} else {
					JSFunction.alertBack(resp, "글쓰기 실패");
				}
				dao.close();
		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
		
		

	}
	
}