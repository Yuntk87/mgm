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
		//휴지통으로 이동
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
			JSFunction.alertBack(resp, "쪽지 삭제 실패");
		}
		dao.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		NoteDao dao = new NoteDao(getServletContext());
		String[] noteNum = req.getParameterValues("inputNoteNum");
		
		//mode 쿼리값을 받아 Recycle 이면 휴지통으로 아니면 삭제
		if(mode!=null && "recycle".equals(mode)) {
			if(noteNum != null) {
				for(int i=0; i<noteNum.length; i++) {
					dao.updateDelWaiting(Integer.parseInt(noteNum[i]), 1);
				}
				resp.sendRedirect("./noteList");
			}
		} else {
			if(noteNum != null) {
				for(int i=0; i<noteNum.length; i++) {
					dao.delete(Integer.parseInt(noteNum[i]));
				}
				resp.sendRedirect("./noteList");
			}
		}
		
	}
	
	
	
}
