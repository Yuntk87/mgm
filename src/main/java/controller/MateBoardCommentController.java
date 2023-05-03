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

import dao.CommentDao;
import dao.FreeBoardDao;
import dao.MateBoardCommentDao;
import dao.MateBoardDao;
import dto.CommentDto;
import dto.MateBoardCommentDto;


@WebServlet("/MateBoardComments")
public class MateBoardCommentController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("mode");
		if("del".equals(method)) {
			this.doDelete(req, resp);
		} else if("mody".equals(method)) {
			this.doPatch(req,resp);
		} else super.service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("mate_num");
		int mate_num = 0;
		if(temp!=null) mate_num = Integer.parseInt(temp);
		MateBoardCommentDao dao = new MateBoardCommentDao(req.getServletContext());
		ArrayList<MateBoardCommentDto> dtos = dao.SellectAll(mate_num);
		
		JSONArray jArray = new JSONArray();
		for(int i=0; i<dtos.size(); i++) {
			JSONObject sObject = new JSONObject();
			sObject.put("matec_num", dtos.get(i).getMatec_num()+"");
			sObject.put("mate_num", dtos.get(i).getMate_num()+"");
			sObject.put("comment", dtos.get(i).getComment());
			sObject.put("commenter", dtos.get(i).getCommenter());
			sObject.put("postDate", dtos.get(i).getPostDate()+"");
			jArray.add(sObject);
		}
		dao.close();
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(jArray.toJSONString());
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("mate_num");
		int mate_num = 0;
		if(temp!=null) mate_num = Integer.parseInt(temp);
		String comment = req.getParameter("comment");
		
		MateBoardCommentDao dao = new MateBoardCommentDao(getServletContext());
		MateBoardDao mdao = new MateBoardDao(getServletContext());
				
		HttpSession session = req.getSession();
		String commenter = "";
//		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
		if(session.getAttribute("UserId") != null) commenter = session.getAttribute("UserId").toString();
		
		MateBoardCommentDto dto = new MateBoardCommentDto(commenter, comment, mate_num);
		
		System.out.println(dto);
		int res = dao.insert(dto);
		dao.close();
		if(res==1) mdao.updateCommentCnt(mate_num, 1);
		System.out.println(temp+"/"+comment);
	}
	

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matec_num = req.getParameter("matec_num").toString();
		
		String temp = req.getParameter("mate_num");
		int mate_num = 0;
		if(temp!=null) mate_num = Integer.parseInt(temp);
		
		MateBoardCommentDao dao = new MateBoardCommentDao(getServletContext());
		MateBoardDao mdao = new MateBoardDao(getServletContext());
		
		HttpSession session = req.getSession();
		String commenter = "";
//		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
		if(session.getAttribute("UserId") != null) commenter = session.getAttribute("UserId").toString();
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("matec_num", matec_num);
		param.put("commenter", commenter); 
		
		int res = dao.delete(param);
		if(res==1) mdao.updateCommentCnt(mate_num, -1);
		dao.close();
		mdao.close();
		System.out.println("del");
	}

	protected void doPatch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("matec_num");
		int matec_num = 0;
		if(temp!=null) matec_num = Integer.parseInt(temp);
		String comment = req.getParameter("comment");
		MateBoardCommentDao dao = new MateBoardCommentDao(getServletContext());
		
		HttpSession session = req.getSession();
		String commenter = "";
//		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
		if(session.getAttribute("UserId") != null) commenter = session.getAttribute("UserId").toString();
		
		MateBoardCommentDto dto = new MateBoardCommentDto(matec_num, commenter, comment);
		
		System.out.println(dto);
		dao.update(dto);
		dao.close();
		System.out.println(temp+"/"+comment);
		System.out.println("patch");
		
	}
	
}
