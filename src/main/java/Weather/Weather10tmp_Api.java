package Weather;
	import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
	import java.net.URL;
	import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/Weather10tmp_Api.do")
public class Weather10tmp_Api extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Date today = new Date();
    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
    	String nowDay = sdf1.format(today);
    	
		String servicekey = "adeampXz1N661Q8%2BfX44MDUOVH62BmiW8lcYCk7bc83ZFrDkCMsRYjCfVQFzMR78EP6quxn7ExAu2tWOboN7kw%3D%3D";
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey="+servicekey+"&pageNo=1&numOfRows=10&regId=11B10101&tmFc="+nowDay+"0600"); /*URL*/
	    
	    URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/xml");
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
	    resp.setContentType("text/xml; charset=utf-8");
	    PrintWriter out = resp.getWriter();
	    out.println(sb.toString());
	}
}

