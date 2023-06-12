package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoteDao;
import dto.MateBoardDto;
import dto.NoteDto;

@WebServlet("/noteList")
public class NoteListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
//		String recipients = session.getAttribute("UserNickName").toString();
		String recipients = "qwer";
		NoteDao dao = new NoteDao(getServletContext());
		
		List<NoteDto> noteLists = dao.selectAll(recipients);
		List<NoteDto> noteListsDel = dao.selectAllDel(recipients);
		req.setAttribute("noteLists", noteLists);
		req.setAttribute("noteListsDel", noteListsDel);
		
		dao.close();
		
		req.getRequestDispatcher("./NoteList.jsp").forward(req, resp);
	}

	
}
