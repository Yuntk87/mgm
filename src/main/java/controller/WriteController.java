package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MountainDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MountainDto;

@WebServlet("/write")
public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		
		if(JSFunction.loginChk(req)) {
			if("FreeBoard".equals(mode)) {
				req.getRequestDispatcher("/FreeBoardWrite.jsp").forward(req, resp);				
			} else if("ConfirmBoard".equals(mode)){
				req.getRequestDispatcher("/ConfirmBoard.jsp").forward(req, resp);	
			} else {
				req.getRequestDispatcher("/MateBoardWrite.jsp").forward(req, resp);	
			}
		} else {
			req.getRequestDispatcher("/LoginForm.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		
		if("FreeBoard".equals(mode)) {
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("UserId");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String category = req.getParameter("category");
			System.out.println(category);
			
			FreeBoardDao dao = new FreeBoardDao(req.getServletContext());
			FreeBoardDto dto = new FreeBoardDto(category, id, title, content);
			System.out.println(dto);
			int res = dao.insertWrite(dto);
			
			if(res==1) {
				resp.sendRedirect("./List?mode=FreeBoard");
			} else {
				JSFunction.alertBack(resp, "글쓰기 실패");
			}
			dao.close();
			
		} else if("ConfirmBoard".equals(mode)) {
			String tmp = req.getParameter("m_num");
			int m_num = 0;
			if(tmp != null) {
				m_num = Integer.parseInt(tmp);
			}
			
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("UserId");
			
			ConfirmDao dao = new ConfirmDao(req.getServletContext());
			ConfirmBoardDto dto = new ConfirmBoardDto(m_num, id);
			System.out.println(dto);
			int res = dao.insertConfirmBoard(dto);
			
			if(res==1) {
				resp.sendRedirect("./Navi.jsp");
			} else {
				JSFunction.alertBack(resp, "글쓰기 실패");
			}
			dao.close();
			
		} else if("MountainRegister".equals(mode)) {
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("UserId");
			
			//manager 계정 필요
			if("qwe".equals(id)) {
				
				String mname = req.getParameter("mname");
				String addr_do = req.getParameter("addr_do");
				String addr_si = req.getParameter("addr_si");
				String addr_gu = req.getParameter("addr_gu");
				String addr = req.getParameter("addr");
				
				String temp = req.getParameter("level");
				int level = 0;
				if(temp != null) {
					level = Integer.parseInt(temp);
				}
				
				MountainDao dao = new MountainDao(getServletContext());
				MountainDto dto = new MountainDto(mname, addr_do, addr_si, addr_gu, addr,level);
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
			

			
			
		}
		
		

	}
	
}