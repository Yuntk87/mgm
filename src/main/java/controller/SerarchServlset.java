package controller;


	import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

	/**
	 * Servlet implementation class SerarchServlset
	 */
	@WebServlet("/SearchServlate")
	public class SerarchServlset extends HttpServlet {
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post요청");
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String nickName=request.getParameter("nickName");
		
		String res = getJSON(nickName);
		response.getWriter().print(res); 
		}
		
		public String getJSON(String nickName) {
			if(nickName==null) nickName="";
			StringBuffer result=new StringBuffer("");
			result.append("{\"result\":[");
			
			UserDao dao = new UserDao(getServletContext());
			ArrayList<dto.UserDto> userList= dao.search(nickName);
			
			for(int i =0;i<userList.size();i++) {
				result.append("[{\"value\":\""+userList.get(i).getUser_num()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getId()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getPassword()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getNickName()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getName()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getPhone()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getpNumber()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getAddr1()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getAddr2()+"\"},");
				result.append("{\"value\":\""+userList.get(i).getPostDate()+"\"}],");
				
			}
			result.append("]}");
		return result.toString();		
		}
	}


