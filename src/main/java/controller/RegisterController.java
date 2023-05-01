package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.memberDao;
import dto.memberDto;


@WebServlet("/register")
public class RegisterController extends HttpServlet{
	memberDao dao = null;
	
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("mode");
		if("idchk".equals(method)) {
			this.doIdChk(req, resp);
		} else super.service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./RegisterForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 	String id = req.getParameter("id");
		 	String pwd = req.getParameter("pwd");
		 	String name = req.getParameter("name");
		 	String nickName = req.getParameter("nickName");
		 	
		 	String temp = req.getParameter("birth");
		 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 	Date birth = null;
			try {
				birth = sdf.parse(temp);
			} catch (ParseException e) {
				e.printStackTrace();
			}		 		

		 	String addr_do = req.getParameter("addr_do");
		 	String addr_si = req.getParameter("addr_si");
		 	String addr_gu = req.getParameter("addr_gu");
		 	String addr = req.getParameter("addr");
		 	String tel = req.getParameter("tel");

		 	memberDto dto = new memberDto(id, pwd, name, nickName, birth, addr_do, addr_si, addr_gu, addr, tel);
		 	memberDao dao = new memberDao(req.getServletContext());

		 	
			int res = dao.insertMember(dto);
			if(res!=0) {
				System.out.println("회원가입 성공");
				resp.sendRedirect("./login");
			}
			else {
				System.out.println("회원가입 실패");
				req.setAttribute("dto", dto);
				req.setAttribute("msg", "회원가입 실패");
				req.getRequestDispatcher("./RegisterForm.jsp").forward(req, resp);
			}
	}
	
	protected void doIdChk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		memberDao dao = new memberDao(req.getServletContext());
		PrintWriter out = resp.getWriter();
		int res = dao.chkId(id);
		out.write(res+"");
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
