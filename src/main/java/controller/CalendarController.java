package controller;


import java.io.IOException;
import java.net.http.HttpTimeoutException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.MateJoinDao;
import dto.MateJoinDto;

@WebServlet("/Calendar")
public class CalendarController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		
		MateJoinDao dao = new MateJoinDao(req.getServletContext());
		List<MateJoinDto> cList = dao.selectCalendar(session.getAttribute("UserId").toString());
		dao.close();
		
		String clistStr = new Gson().toJson(cList);		 
		req.setAttribute("number", clistStr);
		System.out.println(clistStr);
		
		req.getRequestDispatcher("./Calendar.jsp").forward(req, resp);
	}

	/*
	 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException {
	 * 
	 * HttpSession session = req.getSession();
	 * 
	 * String jid = "qwe"; if(session.getAttribute("UserId") != null) { jid =
	 * session.getAttribute("UserId").toString(); }
	 * 
	 * MateJoinDao dao = new MateJoinDao(getServletContext()); List<MateJoinDto>
	 * cList = dao.selectCalendar(jid); System.out.println("clist=>"+cList);
	 * req.setAttribute("number", cList);
	 * 
	 * dao.close();
	 * 
	 * req.getRequestDispatcher("./Calendar.jsp").forward(req, resp);
	 * 
	 * }
	 */
	
	

}
