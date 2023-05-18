package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;



@WebServlet("/find")
public class FindController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		if("id".equals(mode)) {
		UserDao	dao = new UserDao(getServletContext());
		String name=req.getParameter("name");
		String phone=req.getParameter("phone");
		System.out.println(name+"/"+phone);
		String id = dao.findId(name, phone);
		req.setAttribute("id", id);
		if(id==null) {
			String script=""
					+"<script>"
					+"alert('아이디찾기에 실패하였습니다');"
					+" location.href='./login.jsp';"
					+"</script>";
		}
		System.out.println("id=" + id );
		req.getRequestDispatcher("./FindId.jsp").forward(req, resp);
		
		}else {
			
			UserDao	daoo=new UserDao(getServletContext());
			String id2=req.getParameter("id2");
			String phone2=req.getParameter("phone2");
			String name2=req.getParameter("name2");
			System.out.println(id2+"/"+phone2+"/"+name2);
			String pwd=daoo.findPwd(id2, phone2,name2);
			req.setAttribute("pwd", pwd);
			if(pwd==null) {
				String script=""
						+"<script>"
						+"alert('비밀번호찾기에 실패하였습니다');"
						+" location.href='./login.jsp';"
						+"</script>";
			}
			System.out.println("pwd=" + pwd );
			
			req.getRequestDispatcher("./findPwd.jsp").forward(req, resp);
		}
	}
	
    
	
}
