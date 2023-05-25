package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.JSFunction;
import common.SearchCondition;
import dao.AskCommentDao;
import dao.AskDao;
import dao.CommentDao;
import dao.FreeBoardDao;
import dto.AskCommentDto;
import dto.AskDto;
import dto.CommentDto;
import dto.FreeBoardDto;

@WebServlet("/AskComment")
public class AskCommentController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("mode");
		if("del".equals(method)) {
			this.doDelete(req, resp);
		} else super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("ask_num");
		String nickName = req.getParameter("nickName");
		System.out.println(temp+"------------------------");
		int ask_num = 0;
		if(temp!=null) ask_num = Integer.parseInt(temp);
//		AskDao dao = new AskDao(req.getServletContext());
//		AskDto dto = dao.selectView(ask_num);
//		req.setAttribute("dto", dto);
//		dao.close();
		//req.getRequestDispatcher("./AskComment.jsp").forward(req, resp);
		
		AskCommentDao cdao = new AskCommentDao(req.getServletContext());
		ArrayList<AskCommentDto> dtos = cdao.SellectAll(ask_num);
		
		JSONArray jArray = new JSONArray();
		for(int i=0; i<dtos.size(); i++) {
			JSONObject sObject = new JSONObject();
			sObject.put("ac_num", dtos.get(i).getAc_num()+"");
			sObject.put("ask_num", dtos.get(i).getAsk_num()+"");
			sObject.put("comment", dtos.get(i).getComment());
			sObject.put("commenter", dtos.get(i).getCommenter());
			sObject.put("c_postDate", dtos.get(i).getC_postDate()+"");
			jArray.add(sObject);
		}
		cdao.close();
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		System.out.println(jArray.toJSONString());
		out.println(jArray.toJSONString());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("ask_num");
		int ask_num = 0;
		if(temp!=null) ask_num = Integer.parseInt(temp);
		String comment = req.getParameter("comment");
		
		AskCommentDao dao = new AskCommentDao(getServletContext());
		AskDao adao = new AskDao(getServletContext());
				
		HttpSession session = req.getSession();
		String commenter = "";
//		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
		if(session.getAttribute("UserId") != null) commenter = session.getAttribute("UserNickName").toString();
		
		AskCommentDto dto = new AskCommentDto(commenter, comment, ask_num);
		
		System.out.println(dto);
		int res = dao.insert(dto);
		dao.close();
		if(res==1) {
			adao.updateCommentCnt(ask_num, 1);
			System.out.println(temp+"/"+comment);
			resp.sendRedirect("./AskBoardList");
		} else {
			JSFunction.alertBack(resp, "글쓰기 실패");
		}
	}
	

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ac_num = req.getParameter("ac_num").toString();
		
		String temp = req.getParameter("ask_num");
		int ask_num = 0;
		if(temp!=null) ask_num = Integer.parseInt(temp);
		
		AskCommentDao dao = new AskCommentDao(getServletContext());
		AskDao adao = new AskDao(getServletContext());
		
		HttpSession session = req.getSession();
		String commenter = "";
		
		if("admin".equals(session.getAttribute("UserId"))) {
			int num=0;
			if(ac_num != null) {
				num = Integer.parseInt(ac_num);
			}
			int res = dao.deleteNum(num);
			if(res==1) adao.updateCommentCnt(ask_num, -1);
			dao.close();
			adao.close();
			System.out.println("del");
			
		} else {
			req.getRequestDispatcher("/LoginForm.jsp").forward(req, resp);
		}
	}
	/*
	 * protected void doPatch(HttpServletRequest req, HttpServletResponse resp)
	 * throws ServletException, IOException { String temp =
	 * req.getParameter("ac_num"); int ac_num = 0; if(temp!=null) ac_num =
	 * Integer.parseInt(temp); String comment = req.getParameter("comment");
	 * AskCommentDao dao = new AskCommentDao(getServletContext());
	 * 
	 * HttpSession session = req.getSession(); String commenter = ""; //
	 * if(session.getAttribute("UserNickName") != null) commenter =
	 * session.getAttribute("UserNickName").toString();
	 * if(session.getAttribute("UserId") != null) commenter =
	 * session.getAttribute("UserNickName").toString();
	 * 
	 * AskCommentDto dto = new AskCommentDto(ac_num, commenter, comment);
	 * 
	 * System.out.println(dto); dao.Edit(dto); dao.close();
	 * System.out.println(temp+"/"+comment); System.out.println("patch");
	 * 
	 * }
	 */
}
