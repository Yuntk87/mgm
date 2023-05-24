package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.AskCommentDto;
import dto.CommentDto;
import dto.FreeBoardDto;

public class AskCommentDao extends JDBConnect{

	public AskCommentDao(ServletContext application) {
		super(application);
	}
	
	//댓글 수 조회
	public int count(int ask_num) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM ask_board_comment WHERE ask_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, ask_num);
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
	public int deleteNum(int num) {
		int res = 0;
		String sql = "DELETE FROM ask_board_comment WHERE ac_num=?";
		
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
	public int insert(AskCommentDto dto) {
		int res = 0;
		String sql = "INSERT INTO ask_board_comment(ask_num, comment, commenter) VALUES(?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getAsk_num());
			psmt.setString(2, dto.getComment());
			psmt.setString(3, dto.getCommenter());
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("댓글 등록 중 예외 발생");
			e.printStackTrace();
		} return res;
	}
	
	
	//댓글 전체 조회
	public ArrayList<AskCommentDto> SellectAll(int ask_num) {
		ArrayList<AskCommentDto> dtos = new ArrayList<AskCommentDto>();
		String sql = "SELECT * FROM ask_board_comment WHERE ask_num = ? ORDER BY ac_num DESC, c_postDate ASC";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, ask_num);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AskCommentDto dto = new AskCommentDto();
				dto.setAc_num(rs.getInt("ac_num"));
				dto.setAsk_num(rs.getInt("ask_num"));
				dto.setComment(rs.getString("comment"));
				dto.setCommenter(rs.getString("commenter"));
				dto.setC_postDate(rs.getTimestamp("c_postDate"));
				dtos.add(dto);
			}
		} catch(SQLException e) {
			System.out.println("댓글 전체 조회 중 예외 발생");
			e.printStackTrace();
		} return dtos;
	}
	
	//댓글 조회
	 public AskCommentDto selectView(int num) {
			AskCommentDto dto = null;
			
			String sql = "SELECT * FROM ask_board_comment WHERE ac_num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new AskCommentDto();
					dto.setAc_num(rs.getInt("ac_num"));
					dto.setComment(rs.getString("comment"));
					dto.setC_postDate(rs.getTimestamp("c_postDate"));
				}
			}
			catch(SQLException e) {
				System.out.println("댓글 조회 중 예외 발생");
				e.printStackTrace();
			}
			System.out.println(dto);
			return dto;
		}
	 
	//댓글 수정
		public int Edit(AskCommentDto dto) {
			int res = 0;
			String sql = "UPDATE ask_board_comment SET comment=?, c_postDate=now() WHERE ac_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getComment());
				psmt.setInt(2, dto.getAc_num());
				
				res = psmt.executeUpdate();		
			} catch(SQLException e) {
				System.out.println("댓글 수정 중 예외 발생");
				e.printStackTrace();
			} return res;
		}
}
