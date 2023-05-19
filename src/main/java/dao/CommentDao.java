package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletContext;
import common.JDBConnect;
import dto.CommentDto;

public class CommentDao extends JDBConnect{

	public CommentDao(ServletContext application) {
		super(application);
		// TODO Auto-generated constructor stub
	}

	//댓글 수 조회
	public int count(int fb_num) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM free_board_comment WHERE fb_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, fb_num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		return res;
	}
	
	//댓글 삭제	
	public int delete(HashMap<String, String> param) {
		int res = 0;
		String sql = "DELETE FROM free_board_comment WHERE fbc_num=? and commenter=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, param.get("fbc_num"));
			psmt.setString(2, param.get("commenter"));
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("댓글 삭제 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	public int deleteNum(int num) {
		int res = 0;
		String sql = "DELETE FROM free_board_comment WHERE fbc_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("관리자 댓글 삭제 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	
	//댓글 입력
	public int insert(CommentDto dto) {
		int res = 0;
		String sql = "INSERT INTO free_board_comment(fb_num, comment, commenter) VALUES(?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getFb_num());
			psmt.setString(2, dto.getComment());
			psmt.setString(3, dto.getCommenter());
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("댓글 등록 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	//댓글 전체 조회
	public ArrayList<CommentDto> SellectAll(int fb_num) {
		ArrayList<CommentDto> dtos = new ArrayList<CommentDto>();
		String sql = "SELECT * FROM free_board_comment WHERE fb_num = ? ORDER BY fbc_num DESC, postDate ASC";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, fb_num);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CommentDto dto = new CommentDto();
				dto.setFbc_num(rs.getInt("fbc_num"));
				dto.setFb_num(rs.getInt("fb_num"));
				dto.setComment(rs.getString("comment"));
				dto.setCommenter(rs.getString("commenter"));
				dto.setPostDate(rs.getTimestamp("postDate"));
				dtos.add(dto);
			}
		} catch(SQLException e) {
			System.out.println("댓글 전체 조회 중 예외 발생");
			e.printStackTrace();
		} return dtos;
	}
	
	
	//댓글 수정
	public int update(CommentDto dto) {
		int res = 0;
		String sql = "UPDATE free_board_comment SET comment=?, postDate=now() WHERE fbc_num=? and commenter=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getComment());
			psmt.setInt(2, dto.getFbc_num());
			psmt.setString(3, dto.getCommenter());
			
			res = psmt.executeUpdate();		
		} catch(SQLException e) {
			System.out.println("댓글 수정 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	
	
}
