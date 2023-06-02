package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.JSFunction;
import dao.MountainDao;
import dto.MateBoardCommentDto;
import dto.MountainDto;

@WebServlet("/mountain")
public class MountainController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		if("search".equals(mode)) {
			MountainDao dao = new MountainDao(getServletContext());
			
			String mName = req.getParameter("mName");
			List<MountainDto> mList = dao.selectListName(mName);
			
			JSONArray jArray = new JSONArray();
			for(int i=0; i<mList.size(); i++) {
				JSONObject sObject = new JSONObject();
				sObject.put("mNum", mList.get(i).getM_num()+"");
				sObject.put("mName", mList.get(i).getM_name()+"");
				sObject.put("addr1", mList.get(i).getM_addr_1());
				sObject.put("addr2", mList.get(i).getM_addr_2());
				sObject.put("level", mList.get(i).getLevel()+"");
				sObject.put("recommend", mList.get(i).getM_recommend()+"");
				jArray.add(sObject);
			}
			dao.close();
			resp.setContentType("application/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println(jArray.toJSONString());
			
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		String mountainName = req.getParameter("mountainName");

		if("searchWrite".equals(mode)) {
			
			MountainDao dao = new MountainDao(getServletContext());
			MountainDto dto = dao.selectMountain(mountainName);
			req.setAttribute("dto", dto);
			req.setAttribute("limit", req.getParameter("limitVal"));
			req.setAttribute("dDay", req.getParameter("dDayVal"));
			req.setAttribute("dDayF", req.getParameter("dDayVal").replace("T", " "));
			dao.close();
			req.getRequestDispatcher("./MateBoardWrite.jsp").forward(req, resp);
			
		} else if("searchEdit".equals(mode)) {
			MountainDao dao = new MountainDao(getServletContext());
			MountainDto mdto = dao.selectMountain(mountainName);
			req.setAttribute("mdto", mdto);
			req.setAttribute("limit", req.getParameter("limitVal"));
			req.setAttribute("dDay", req.getParameter("dDayVal"));
			req.setAttribute("dDayF", req.getParameter("dDayVal").replace("T", " "));
			req.setAttribute("title", req.getParameter("title1"));
			req.setAttribute("content", req.getParameter("content1"));
			req.setAttribute("num", req.getParameter("num"));
			req.setAttribute("mNum", req.getParameter("mNum"));
			dao.close();
			req.getRequestDispatcher("./MateBoardEdit.jsp").forward(req, resp);
			
		} else if("edit".equals(mode)) {
			MountainDao dao = new MountainDao(getServletContext());
			MountainDto dto = dao.selectMountain(mountainName);
			req.setAttribute("dto", dto);
			dao.close();
			req.getRequestDispatcher("./MateBoardEdit.jsp").forward(req, resp);
		} else if("register".equals(mode)) {
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("UserId");
			
			if("qwe".equals(id)) {
				String mname = req.getParameter("mname");
				String m_addr_1 = req.getParameter("m_addr_1");
				String m_addr_2 = req.getParameter("m_addr_2");
				
				String temp = req.getParameter("level");
				int level = 0;
				if(temp != null) {
					level = Integer.parseInt(temp);
				}
				
				MountainDao dao = new MountainDao(getServletContext());
				MountainDto dto = new MountainDto(mname, m_addr_1, m_addr_2, level);
				int res = dao.insertMountain(dto);
				
				if(res == 1) {
					resp.sendRedirect("./Main.jsp");
				} else {
					JSFunction.alertBack(resp, "등록 실패");
				}
				dao.close();
				
			} else {
				JSFunction.alertLocation(resp, "권한이 없습니다.", "./main.jsp");
			}
			
		} else {
			System.out.println("산 조회 실패");
		}
	}
	

}
