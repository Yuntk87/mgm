package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.MountainDao;
import dao.MountainLikeDao;

@WebServlet("/like")
public class MountainLikeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("board_num");
		int board_num = 0;
		if(temp!=null) board_num = Integer.parseInt(temp);
		
		MountainLikeDao dao = new MountainLikeDao(req.getServletContext());
		String mode = req.getParameter("mode");
		MountainDao mdao = new MountainDao(req.getServletContext());
		
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("UserId").toString();
		
		
		if("like".equals(mode)) {
			int res = dao.insert(id, board_num);
			if(res==1) {
				mdao.updateRecommend(board_num, 1);
			}
		}else {
			int res = dao.delete(board_num, id);
			if(res==1) {
				mdao.updateRecommend(board_num, -1);
			}
			
		}
		int res = dao.countAll(board_num);
		
		resp.setContentType("application/json; charset=utf-8" );
		PrintWriter out = resp.getWriter();
		JSONObject jobjt = new JSONObject();
		jobjt.put("res", res); // {res : 5 }
		out.print(jobjt);
		
	}




	
	
	

	
	
	
	
}
