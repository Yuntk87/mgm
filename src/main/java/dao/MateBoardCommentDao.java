package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletContext;
import common.JDBConnect;
import dto.CommentDto;
import dto.MateBoardCommentDto;
import dto.MateBoardDto;

public class MateBoardCommentDao extends JDBConnect{

	public MateBoardCommentDao(ServletContext application) {
		super(application);
		// TODO Auto-generated constructor stub
	}

	//댓글 수 조회
	public int count(int mate_num) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM mate_board_comment WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, mate_num);
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
		String sql = "DELETE FROM mate_board_comment WHERE matec_num=? and commenter=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, param.get("matec_num"));
			psmt.setString(2, param.get("commenter"));
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("댓글 삭제 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	
	//댓글 입력
	public int insert(MateBoardCommentDto dto) {
		int res = 0;
		String sql = "INSERT INTO mate_board_comment(mate_num, comment, commenter) VALUES(?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getMate_num());
			psmt.setString(2, dto.getComment());
			psmt.setString(3, dto.getCommenter());
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("댓글 등록 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	//댓글 전체 조회
	public ArrayList<MateBoardCommentDto> SellectAll(int fb_num) {
		ArrayList<MateBoardCommentDto> dtos = new ArrayList<MateBoardCommentDto>();
		String sql = "SELECT * FROM mate_board_comment WHERE mate_num = ? ORDER BY matec_num DESC, postDate ASC";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, fb_num);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MateBoardCommentDto dto = new MateBoardCommentDto();
				dto.setMatec_num(rs.getInt("matec_num"));
				dto.setMate_num(rs.getInt("mate_num"));
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
	public int update(MateBoardCommentDto dto) {
		int res = 0;
		String sql = "UPDATE mate_board_comment SET comment=?, postDate=now() WHERE matec_num=? and commenter=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getComment());
			psmt.setInt(2, dto.getMatec_num());
			psmt.setString(3, dto.getCommenter());
			res = psmt.executeUpdate();		
		} catch(SQLException e) {
			System.out.println("댓글 수정 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	
	
}
