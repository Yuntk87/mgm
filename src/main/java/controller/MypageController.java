package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateJoinDao;
import dao.UserDao;
import dto.FreeBoardDto;
import dto.MateJoinDto;
import dto.UserDto;

@WebServlet("/mypage")
public class MypageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = session.getAttribute("UserId").toString();
		UserDao dao = new UserDao(getServletContext());
		UserDto dto = dao.selectUser(id);
		req.setAttribute("uto", dto);
		
		MateJoinDao mdao = new MateJoinDao(req.getServletContext());
		List<MateJoinDto> cList = mdao.selectCalendar(id);
		dao.close();
		
		String clistStr = new Gson().toJson(cList);		 
		req.setAttribute("number", clistStr);
		System.out.println(clistStr);
		
		FreeBoardDao fdao = new FreeBoardDao(getServletContext());
		List<FreeBoardDto> boardLists = fdao.selectListmp(id);
		
		req.setAttribute("boardLists", boardLists);
		
		
		

		ConfirmDao cdao = new ConfirmDao(getServletContext());
		String res= cdao.selectmountain(id);
				
		
		req.setAttribute("mountainLists", res);
		
		
		req.getRequestDispatcher("./MyPage.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
