package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringJoiner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dao.z_memberDao;
import dto.UserDto;
import dto.z_memberDto;


@WebServlet("/register")
public class RegisterController extends HttpServlet{
	UserDao dao = null;
	
	
	
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

		
		    String email1 = req.getParameter("email");
		    String email2 = req.getParameter("email1");
		 	String id = email1 + "@" + email2;
		 	
		 	String password = req.getParameter("password");
		 	String nickName = req.getParameter("nickName");
		 	String pNumber = req.getParameter("pNumber");		
		 	String gender = req.getParameter("gender");		
		 	
		 	String address = req.getParameter("roadAddress");
		 	String[] temp = address.split(" ");
		 	String addr1 = temp[0].toString(); 		
		 	StringBuilder sb = new StringBuilder();
		 	for(int i=1; i<temp.length; i++) {
		 		sb.append(temp[i].toString()).append(" ");
		 	}
		 	String addr2 = sb.toString();
		 	
		 	String name = req.getParameter("name");
		 	String phone = req.getParameter("phone");

		 	UserDao dao = new UserDao(req.getServletContext());
		    UserDto dto = new UserDto(id, password, nickName, name, phone, pNumber,
						gender,addr1, addr2);

		 	
			int res = dao.insertUser(dto);
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
		String nickName = req.getParameter("nickName");
		UserDao dao = new UserDao(req.getServletContext());
		PrintWriter out = resp.getWriter();
		int res = dao.chkId(nickName);
		out.write(res+"");
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
