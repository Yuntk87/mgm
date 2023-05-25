package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;


@WebServlet("/user")
public class UserController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("mode");
		if("idchk".equals(method)) {
			this.doIdChk(req, resp);
		} else super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		HttpSession session = req.getSession();
		String id = session.getAttribute("UserId").toString();
		
		if("del".equals(mode)) {
			String temp = req.getParameter("userNum");
			int userNum = 0;
			if(temp != null) {
				userNum = Integer.parseInt(temp);
			}
			UserDao dao = new UserDao(getServletContext());
			dao.delete(userNum);
			dao.close();
			
			resp.sendRedirect("./UserTable.jsp");
			
		} else if("Withdrawal".equals(mode)) {
			System.out.println("email: "+id);
			UserDao dao = new UserDao(getServletContext());
			int res = dao.delete(id);
			if(res>0) {
				
				String script=""
							+"<script>"
							
							+" location.href='./WithdrawalPage.jsp';"
							+"</script>";
				resp.setContentType("text/html; charset=utf-8");
				resp.getWriter().print(script);
				dao.close();
			System.out.println("회원삭제완료");
			}else System.out.println("회원삭제실패");
			
		} else if("Modify".equals(mode)) {
			UserDao dao = new UserDao(getServletContext());
			UserDto dto = dao.selectUser(id);
			req.setAttribute("uto", dto);
			dao.close();
			req.getRequestDispatcher("./UserModifyForm.jsp").forward(req, resp);
		}
			
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

	 	UserDao dao = new UserDao(getServletContext());
	    UserDto dto = new UserDto(id, password, nickName, name, phone, pNumber,
					gender,addr1, addr2);

	 	
		int res = dao.update(dto);
		dao.close();
		if(res!=0) {
			System.out.println("회원수정 성공");
			resp.sendRedirect("./LoginForm.jsp");
		}
		else {
			System.out.println("회원수정 실패");
			req.setAttribute("dto", dto);
			req.setAttribute("msg", "회원수정 실패");
			req.getRequestDispatcher("./UserModifyForm.jsp").forward(req, resp);
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
	
}
