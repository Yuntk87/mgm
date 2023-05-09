package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.processing.SupportedSourceVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MateJoinDao;
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
		int cnt = dao.count(mateNum);
		req.setAttribute("cnt", cnt);
		
		List<String> mList = dao.selectJId(jid);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		

		if(dto == null) {
			if(ScheduleChk(mList,temp3) == 0) {
				dto = new MateJoinDto(mateNum, id, mNum, dDay, jid);
				dao.insertWrite(dto);
				dao.close();
				out.println("y");
			} else {
				out.println("re");
			}
		} else {
			dao.deleteMateBoardJoin(dto);
			dao.close();
			out.println("n");
		}
		
	}
	
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
					return res=0;
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

}
