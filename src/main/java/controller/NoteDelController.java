package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import dao.NoteDao;

@WebServlet("/noteDel")
public class NoteDelController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tmp = req.getParameter("noteNum");
		int noteNum = 0;
		if(tmp != null) {
			noteNum = Integer.parseInt(tmp);
		}
		
		NoteDao dao = new NoteDao(getServletContext());
		int res = dao.updateDelWaiting(noteNum, 1);
		
		if(res==1) {
			resp.sendRedirect("./noteList");
		} else {
			JSFunction.alertBack(resp, "쪽지 보내기 실패");
		}
		dao.close();
	}
	
	
	
}
