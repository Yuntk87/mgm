package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.processing.SupportedSourceVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.MateBoardDao;
import dao.MateJoinDao;
import dto.MateBoardDto;
import dto.MateJoinDto;

@WebServlet("/MateJoin")
public class MateJoinController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();

		String jid = null;
		if(session.getAttribute("UserId") != null) {
			jid = session.getAttribute("UserId").toString();
		}
		int mateNum = 0;
		String temp1 = req.getParameter("mateNum");
		if(temp1 != null) {
			mateNum = Integer.parseInt(temp1);
		}
		
		int mNum = 0;
		String temp2 = req.getParameter("mNum");
		if(temp2 != null) {
			mNum = Integer.parseInt(temp2);
		}
		
		String temp3 = req.getParameter("dDay");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date dDay = null;
		if(temp3 != null) {
			try {
				dDay = sdf.parse(temp3);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}				
		}
		String id = req.getParameter("id");
		
		MateJoinDao dao = new MateJoinDao(getServletContext());
		MateJoinDto dto = dao.selectMateBoardJoin(mateNum, jid);
		int cnt = dao.count(mateNum); //현재 참가인원 카운트
		req.setAttribute("cnt", cnt);
		
		MateBoardDao mdao = new MateBoardDao(getServletContext());
		MateBoardDto mdto = mdao.selectView(mateNum);
		int mateLimit = mdto.getMateLimit(); //제한인원 

		List<String> mList = dao.selectJId(jid);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		

		JSONObject sObject = new JSONObject();
		
		//예정일과 기정 참가일정 비교하여 참가버튼 on/off
		if(dto == null) {
			if(ScheduleChk(mList,temp3) == 0) {
				dto = new MateJoinDto(mateNum, id, mNum, dDay, jid);
				dao.insertWrite(dto);
				cnt = dao.count(mateNum);
				dao.close();
				sObject.put("result","y"+"");
				sObject.put("cnt", cnt+"");
				resp.setContentType("application/json; charset=utf-8");
				out.println(sObject.toJSONString());
			} else {
				cnt = dao.count(mateNum);
				sObject.put("result","re"+"");
				sObject.put("cnt", cnt+"");
				resp.setContentType("application/json; charset=utf-8");
				out.println(sObject.toJSONString());
			}
		} else {
			dao.deleteMateBoardJoin(dto);
			cnt = dao.count(mateNum);
			dao.close();
			sObject.put("result","n"+"");
			sObject.put("cnt", cnt+"");
			resp.setContentType("application/json; charset=utf-8");
			out.println(sObject.toJSONString());
		}
		
		//제한인원 초과 시 체크넘버 변경
		if(cnt >= mateLimit) {
			mdao.updateJoinCheck(mateNum, 1);
		} else {
			mdao.updateJoinCheck(mateNum, 0);
		}
		mdao.close();

	}
	
	//일정 비교 함수
	public int ScheduleChk(List<String> mList, String dDay) {
		int res=0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		for(String tmp : mList) {
			try {
				Date tmp1 = sdf.parse(dDay);
				Date tmp2 = sdf.parse(tmp);
				String dDaychk = sdf1.format(tmp1);
				String days = sdf1.format(tmp2);

				if(dDaychk.equals(days)) {
					return res=1;
				} else {
					continue;
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

}
