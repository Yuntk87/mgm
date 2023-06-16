package common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;


public class JSFunction {
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "	alert('" + msg + "');"
					+ "	location.href='" + url + "';"
					+ "</script>";
					out.print(script);
		}
		catch (Exception e) {}
	}
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "	alert('" + msg + "');"
					+ "	history.back();"
					+"</script>";
			out.print(script);
		}
		catch (Exception e) {}
	}
	
	
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			resp.setContentType("text/html:charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>"
					+ "	alert('" + msg + "');"
					+ "	location.href='" + url + "';"
					+ "</script>";
					writer.print(script);
		}
		catch (Exception e) {}
	}
	
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html:charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>"
					+ "	alert('" + msg + "');"
					+ "	history.back();"
					+"</script>";
			writer.print(script);
		}
		catch (Exception e) {}
	}
	
	//로그인 체크
	public static boolean loginChk(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("UserId") != null) {
			return true;
		} else {
			session.setAttribute("Uri", req.getRequestURI()+ "?" +req.getQueryString());
			return false;
		}
	}
}
