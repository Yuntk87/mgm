package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/distance")
public class Distance extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int res = 0;
		PrintWriter writer = resp.getWriter();
		String[] temp1 = req.getParameter("myLocation").split(" ");
		String[] temp2 = req.getParameter("mLocation").split(" ");
		
		double lat1 = Double.parseDouble(temp1[0]);
		double lat2 = Double.parseDouble(temp1[1]);
		double lon1 = Double.parseDouble(temp2[0]);
		double lon2 = Double.parseDouble(temp2[1]);
		
		res = (int)distance(lat1,lat2,lon1,lon2);
		
		writer.print(res);
	}
	
	private static double distance(double lat1, double lon1, double lat2, double lon2) {
		
		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515 * 1609.344;
		
		return (dist);
	}
	
	
	private static double deg2rad(double deg){
		return (deg * Math.PI/180.0);
	}
	private static double rad2deg(double rad){
		return (rad * 180 / Math.PI);
	}
}