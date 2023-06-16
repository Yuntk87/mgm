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
import dao.UserDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;
import dto.MountainDto;
import dto.UserDto;

@WebServlet("/ConfirmBoardWrite")
public class ConfirmBoardWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(JSFunction.loginChk(req)) {
				req.getRequestDispatcher("/ConfirmBoard.jsp").forward(req, resp);	
		} else {
			req.getRequestDispatcher("/LoginForm.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(JSFunction.loginChk(req)) {
			
				String tmp = req.getParameter("mName");
				int m_num = 0;
				if(tmp != null) {
					MountainDao mdao = new MountainDao(getServletContext());
					m_num = mdao.selectMountainNum(tmp);		
					mdao.close();
				}
				
				HttpSession session = req.getSession();
				String id = (String)session.getAttribute("UserId");
				int res = 0;			
				if(id != null) {
					ConfirmDao dao = new ConfirmDao(req.getServletContext());
					ConfirmBoardDto dto = new ConfirmBoardDto(m_num, id);
					res = dao.insertConfirmBoard(dto);
					UserDao udao = new UserDao(getServletContext());
					int res1 = udao.updateLevel(id, 1); //글 개수에 따라 유저 레벨업
					udao.close();
					dao.close();
				}
	
				if(res==1) {
					resp.sendRedirect("./Navi.jsp");
				} else {
					JSFunction.alertBack(resp, "글쓰기 실패");
				}
				
		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
		
		

	}
	
}