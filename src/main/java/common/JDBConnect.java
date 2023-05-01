package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	//데이터베이스와 연결 담당
	public Connection con;
	
	//정적 쿼리문을 실행할 때
	public Statement stmt;
	
	//동적 쿼리문을 실행할 때
	public PreparedStatement psmt;
	
	//select 쿼리문의 결과를 저장할 때
	public ResultSet rs;
	
	
	//기본 생성자
	public JDBConnect() {
		try {
			// JDBC 드라이버 로드
			Class.forName("com.mysql.mgm.Driver");
	
			// DB에 연결
			String url = "jdbc:mysql://localhost:3306/mgm_db";
			String id = "root";
			String pwd = "8011";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//두번째 생성자
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
	
			// DB에 연결
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자1)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//세번째 생성자
	public JDBConnect(ServletContext application) {
		try {
			//JDBC 드라이버 로드
			String driver = application.getInitParameter("MySqlDriver");
			Class.forName(driver);
	
			// DB에 연결
			String url = application.getInitParameter("MySqlURL");
			String id = application.getInitParameter("MySqlId");
			String pwd = application.getInitParameter("MySqlPwd");
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자2)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			//순서대로 진행해야 함
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
