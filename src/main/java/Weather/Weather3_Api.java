package Weather;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/Weather3_Api.do")
public class Weather3_Api extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Date today = new Date();
    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
    	String nowDay = sdf1.format(today);
    	Date yDay = null;
		try {
			yDay = sdf1.parse(nowDay);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
    	Calendar cal = new GregorianCalendar(Locale.KOREA);
    	cal.setTime(yDay);
    	cal.add(Calendar.DATE,-1);
    	String yDate = sdf1.format(cal.getTime());
    	
    	System.out.println(yDate);
    	
    	String servicekey = "adeampXz1N661Q8%2BfX44MDUOVH62BmiW8lcYCk7bc83ZFrDkCMsRYjCfVQFzMR78EP6quxn7ExAu2tWOboN7kw%3D%3D";
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey="+servicekey +"&dataType=JSON&numOfRows=1000&pageNo=1"
        		+ "&base_date="+yDate+"&base_time=2300&nx=69&ny=107"); /*URL*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        resp.setContentType("text/json; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(sb.toString()); 
    }
}