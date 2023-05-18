package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

import common.JDBConnect;
import dto.MountainLikeDto;

public class MountainLikeDao extends JDBConnect {
	public MountainLikeDao (ServletContext application) {
		super(application);
	}
	
	public int deleteAll(int board_num) {
		String sql = "DELETE FROM mountain_board_like WHERE board_num = ?";
		
		int res = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_num);
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("종아요 삭제중 오류 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public int countAll(int board_num) {
		String sql = "SELECT count(*) FROM mountain_board_like WHERE board_num = ?";
		int res = 0;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("좋아요 수 구하는중 오류");
			e.printStackTrace();
		}
		return res;
	}
	
	public int count(int board_num, String id) {
		String sql = "SELECT count(*) FROM mountain_board_like WHERE board_num = ? AND id=?";
		int res = 0;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_num);
			psmt.setString(2, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("좋아요 수 구하는중 오류");
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(int board_num , String id) {
		int res = 0;
		String sql = "DELETE FROM mountain_board_like WHERE board_num = ? AND id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_num);
			psmt.setString(2, id);
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("좋아요 삭제 중 오류 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int insert(String id, int board_num) {
		int res = 0;
		String sql = "INSERT INTO mountain_board_like (id, board_num) VALUES ( ?, ? )";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, board_num);
			res = psmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("좋아요 작성중 오류 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<MountainLikeDto> selectAll(int board_num) {
		String sql = "SELECT num, id , board_num FROM mountain_board_like WHERE board_num = ? ORDER BY num ASC";
		ArrayList<MountainLikeDto> dtos = new ArrayList<MountainLikeDto>();
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_num);
			rs = psmt.executeQuery();
			while (rs.next()) {
				MountainLikeDto dto = new MountainLikeDto();
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setBoard_num(rs.getInt(3));
				dtos.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public MountainLikeDto select(int num) {
		String sql = "SELECT num, id, board_num FROM mountain_board_like WHERE num = ?";
		MountainLikeDto dto = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
		} catch(SQLException e ) {
			System.out.println("select 중 오류 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	
	
	
	
	
	
	
}
