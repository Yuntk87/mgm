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
import dto.CommentDto;


@WebServlet("/FreeBoardComments")
public class FreeBoardCommentController extends HttpServlet{
	
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
		String temp = req.getParameter("fb_num");
		int fb_num = 0;
		if(temp!=null) fb_num = Integer.parseInt(temp);
		CommentDao dao = new CommentDao(req.getServletContext());
		ArrayList<CommentDto> dtos = dao.SellectAll(fb_num);
		
		JSONArray jArray = new JSONArray();
		for(int i=0; i<dtos.size(); i++) {
			JSONObject sObject = new JSONObject();
			sObject.put("fbc_num", dtos.get(i).getFbc_num()+"");
			sObject.put("fb_num", dtos.get(i).getFb_num()+"");
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
		String temp = req.getParameter("fb_num");
		int fb_num = 0;
		if(temp!=null) fb_num = Integer.parseInt(temp);
		String comment = req.getParameter("comment");
		
		CommentDao dao = new CommentDao(getServletContext());
		FreeBoardDao fdao = new FreeBoardDao(getServletContext());
				
		HttpSession session = req.getSession();
		String commenter = "";
		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
//		if(session.getAttribute("UserId") != null) commenter = session.getAttribute("UserId").toString();
		
		CommentDto dto = new CommentDto(commenter, comment, fb_num);
		
		System.out.println(dto);
		int res = dao.insert(dto);
		dao.close();
		if(res==1) fdao.updateCommentCnt(fb_num, 1);
		System.out.println(temp+"/"+comment);
	}
	

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fbc_num = req.getParameter("fbc_num").toString();
		
		String temp = req.getParameter("fb_num");
		int fb_num = 0;
		if(temp!=null) fb_num = Integer.parseInt(temp);
		
		CommentDao dao = new CommentDao(getServletContext());
		FreeBoardDao fdao = new FreeBoardDao(getServletContext());
		
		HttpSession session = req.getSession();
		String commenter = "";
		
		if("admin".equals(session.getAttribute("UserId"))) {
			int num=0;
			if(fbc_num != null) {
				num = Integer.parseInt(fbc_num);
			}
			int res = dao.deleteNum(num);
			if(res==1) fdao.updateCommentCnt(fb_num, -1);
			dao.close();
			fdao.close();
			System.out.println("del");
			
		} else if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("fbc_num", fbc_num);
		param.put("commenter", commenter); 
		
		int res = dao.delete(param);
		if(res==1) fdao.updateCommentCnt(fb_num, -1);
		dao.close();
		fdao.close();
		System.out.println("del");
	}

	protected void doPatch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getParameter("fbc_num");
		int fbc_num = 0;
		if(temp!=null) fbc_num = Integer.parseInt(temp);
		String comment = req.getParameter("comment");
		CommentDao dao = new CommentDao(getServletContext());
		
		HttpSession session = req.getSession();
		String commenter = "";
		if(session.getAttribute("UserNickName") != null) commenter = session.getAttribute("UserNickName").toString();
//		if(session.getAttribute("UserId") != null) commenter = session.getAttribute("UserId").toString();
		
		CommentDto dto = new CommentDto(fbc_num, commenter, comment);
		
		System.out.println(dto);
		dao.update(dto);
		dao.close();
		System.out.println(temp+"/"+comment);
		System.out.println("patch");
		
	}
	
}
