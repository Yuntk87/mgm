package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoteDao;
import dto.NoteDto;

@WebServlet("/noteView")
public class NoteViewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tmp = req.getParameter("noteNum");
		int num = 0;
		if(tmp != null) {
			num = Integer.parseInt(tmp);
		}
		NoteDao dao = new NoteDao(getServletContext());
		dao.updateReadChk(num);
		NoteDto dto = dao.selectView(num);
	
		req.setAttribute("dto", dto);
		dao.close();
		req.getRequestDispatcher("./NoteView.jsp").forward(req, resp);
	}
	
	
	
}
