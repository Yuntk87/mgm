package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MateJoinDao;
import dto.MateJoinDto;

@WebServlet("/MateJoin")
public class MateJoinController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//
//		String jid = null;
//		if(session.getAttribute("UserId") != null) {
//			jid = session.getAttribute("UserId").toString();
//		}
//		int mateNum = 0;
//		String temp1 = req.getParameter("mateNum");
//		if(temp1 != null) {
//			mateNum = Integer.parseInt(temp1);
//		}
//		
//		int mNum = 0;
//		String temp2 = req.getParameter("mNum");
//		if(temp2 != null) {
//			mNum = Integer.parseInt(temp2);
//		}
//		
//		String temp3 = req.getParameter("dDay");
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		Date dDay = null;
//		if(temp3 != null) {
//			try {
//				dDay = sdf.parse(temp3);
//			} catch (ParseException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}				
//		}
//		String id = req.getParameter("id");
//		
//		MateJoinDao dao = new MateJoinDao(getServletContext());
//		MateJoinDto dto = dao.selectMateBoardJoin(mateNum, jid);
//		if(dto == null) {
//			dto = new MateJoinDto(mateNum, id, mNum, dDay, jid);
//			dao.insertWrite(dto);
//			System.out.println("참가완료");
//		} else {
//			System.out.println("이미 참가하였습니다.");
//		}
//		dao.close();
//		req.getRequestDispatcher("./MateBoardList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();

		String jid = null;
		if(session.getAttribute("UserId") != null) {
			jid = session.getAttribute("UserId").toString();
		}
		int mateNum = 0;
		String temp1 = req.getParameter("mateNum");
		if(temp1 != null) {
			mateNum = Integer.parseInt(temp1);
		}
		
		int mNum = 0;
		String temp2 = req.getParameter("mNum");
		if(temp2 != null) {
			mNum = Integer.parseInt(temp2);
		}
		
		String temp3 = req.getParameter("dDay");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date dDay = null;
		if(temp3 != null) {
			try {
				dDay = sdf.parse(temp3);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}				
		}
		String id = req.getParameter("id");
		
		
		MateJoinDao dao = new MateJoinDao(getServletContext());
		MateJoinDto dto = dao.selectMateBoardJoin(mateNum, jid);
		if(dto == null) {
			dto = new MateJoinDto(mateNum, id, mNum, dDay, jid);
			dao.insertWrite(dto);
			dao.close();
			out.println("y");
		} else {
			dao.close();
			out.println("n");
		}
	}

}
