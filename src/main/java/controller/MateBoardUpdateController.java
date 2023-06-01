package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

import common.JSFunction;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;

@WebServlet("/MateBoardEdit")
public class MateBoardUpdateController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String snum = req.getParameter("num");

			if(snum==null) {
				JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./MateBoardList");
				return;
			}
			int num = Integer.parseInt(snum);
			
			MateBoardDao dao = new MateBoardDao(req.getServletContext());
			MateBoardDto dto = dao.selectView(num);
			req.setAttribute("dto", dto);
			
			
			HttpSession session = req.getSession();
			String id = session.getAttribute("UserId").toString();
			String nickName = session.getAttribute("UserNickName").toString();
			
			if(!id.equals(dto.getId())) {
				JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
				return;
			}
			
			dao.close();
			req.getRequestDispatcher("/MateBoardEdit.jsp").forward(req, resp);
		}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String temp1 = req.getParameter("mNum");
		int mNum = 0;
		if(temp1 == null) {
			JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./MateBoardList");
			return;
		} else {
			mNum = Integer.parseInt(temp1);
		}
		
		String snum = req.getParameter("num");
		int mateNum = 0;
		if(snum==null) {
			JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./MateBoardList");
			return;
		} else {
			mateNum = Integer.parseInt(snum);				
		}
		
		String temp2 = req.getParameter("dDay");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
		Date dDay = null;
		if(temp2 != null) {
			try {
				dDay = sdf.parse(temp2);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}				
		}
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		String temp3 = req.getParameter("limit");
		int mateLimit = 0;
		if(temp3==null) {
			JSFunction.alertLocation(resp, "잘못된 접근입니다.", "./MateBoardList");
			return;
		} else {
			mateLimit = Integer.parseInt(temp3);				
		}
		
		MateBoardDao dao = new MateBoardDao(req.getServletContext());
		MateBoardDto dto = new MateBoardDto(mateNum, mNum, title, content, dDay, mateLimit);
		dao.updateEdit(dto);
		dao.close();
		
		resp.sendRedirect("./MateBoardList");
	}
	
}
