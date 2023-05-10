package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;


@WebServlet("/login")
public class LoginController extends HttpServlet{
	UserDao dao = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rememberId="";
		String check="";
		
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				if("id".equals(cookieName)) {
					rememberId = c.getValue();
					check = "checked";
				}
			}
		}
		req.setAttribute("rememberId", rememberId);
		req.setAttribute("check", check);
		req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pass");
		String rememberId = req.getParameter("rememberId");
		
		//req.getServletContext() = application 객체 생성
		UserDao dao = new UserDao(req.getServletContext());
		UserDto dto = dao.selectUser(id);
		System.out.println(dto);
		if(dto == null) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.println("alert('존재하지 않는 아이디 입니다.')");
			writer.print("</script>");
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
			writer.close();
		}
		else if(dto != null && dto.getId().equals(id) && dto.getPassword().equals(pwd)) {
			System.out.println("로그인 성공");
			if(rememberId != null) {
				Cookie cookie = new Cookie("id", id);
				resp.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("id","");
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
			
			//req.getSession() = session 객체 생성
			HttpSession session = req.getSession();
			
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserNickName", dto.getNickName());
			
			String Uri = (session.getAttribute("Uri") != null)? 
					session.getAttribute("Uri").toString() : null;

			if( Uri != null) {
				resp.sendRedirect(Uri);
			}else {
				resp.sendRedirect("./main");				
			}
			
		} else {
			req.getRequestDispatcher("./LoginForm.jsp?loginError=1").forward(req, resp);
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
	
}