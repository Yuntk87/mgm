package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.NoteDao;
import dto.NoteDto;

@WebServlet("/noteWrite")
public class NoteWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String recipients = req.getParameter("recipients");
		req.setAttribute("recipients", recipients);
		req.getRequestDispatcher("./NoteWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
//		String senderString = session.getAttribute("UserNickName").toString();
		String senderString = "qwes";
		String recipients = req.getParameter("recipients");
		String content = req.getParameter("content");
		
		NoteDao dao = new NoteDao(getServletContext());
		NoteDto dto = new NoteDto(senderString,recipients,content);
		int res = dao.insertNote(dto);
		if(res==1) {
			resp.sendRedirect("./noteList");
		} else {
			JSFunction.alertBack(resp, "쪽지 보내기 실패");
		}
		dao.close();
		
	}
	
	
	
	
}
