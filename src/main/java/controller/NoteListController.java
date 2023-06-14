package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import dao.NoteDao;
import dto.MateBoardDto;
import dto.NoteDto;

@WebServlet("/noteList")
public class NoteListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(JSFunction.loginChk(req)) {
			HttpSession session = req.getSession();
			String mode = req.getParameter("mode");
			
			String recipients = session.getAttribute("UserNickName").toString();
			NoteDao dao = new NoteDao(getServletContext());
			
			List<NoteDto> noteLists = dao.selectAll(recipients);
			List<NoteDto> noteListsDel = dao.selectAllDel(recipients);
			List<NoteDto> noteListsSend = dao.selectAllSendList(recipients);
			req.setAttribute("noteLists", noteLists);
			req.setAttribute("noteListsDel", noteListsDel);
			req.setAttribute("noteListsSend", noteListsSend);
			
			int cnt = dao.ReadChk(recipients);
			req.setAttribute("cnt", cnt);
			dao.close();
			if("recycle".equals(mode)) {
				req.getRequestDispatcher("./NoteRecycleList.jsp").forward(req, resp);
			} else if("sendList".equals(mode)) {
				req.getRequestDispatcher("./NoteSendList.jsp").forward(req, resp);
			} else req.getRequestDispatcher("./NoteList.jsp").forward(req, resp);
		} else {
		req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
	
}
