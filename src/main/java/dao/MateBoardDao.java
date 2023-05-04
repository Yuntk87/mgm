package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;

public class MateBoardDao extends JDBConnect {

	public MateBoardDao(ServletContext application) {
		super(application);
	}

	public int insertMateBoard (MateBoardDto m) {
		int res=0;
		String sql = "INSERT INTO mate_board(m_num, id, title, content, dDay, mateLimit) values(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, m.getM_num());
			psmt.setString(2, m.getId());
			psmt.setString(3, m.getTitle());
			psmt.setString(4, m.getContent());
			psmt.setTimestamp(5, new Timestamp(m.getdDay().getTime()));
			psmt.setInt(6, m.getMateLimit());
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("메이트게시판 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int updateMateBoard(int num, String title, String content, Date dDay) {
		int res=0;
		String sql = "UPDATE mate_board SET title=? , content=? , dDay=? WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setTimestamp(3, new Timestamp(dDay.getTime()));
			psmt.setInt(4, num);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("메이트게시글 수정 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}

	public MateBoardDto selectMateBoard(int num) {
		MateBoardDto m = null;
		String query = "SELECT m.*, b.m_name FROM mate_board m INNER JOIN mountain_board b ON m.m_num = b.m_num WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				m = new MateBoardDto();
				m.setMate_num(rs.getInt(1));
				m.setM_num(rs.getInt(2));
				m.setId(rs.getString(3));
				m.setTitle(rs.getString(4));
				m.setContent(rs.getString(5));
				m.setdDay(rs.getTimestamp(6));
				m.setMateLimit(rs.getInt(7));
				m.setViewCount(rs.getInt(8));
				m.setCommentCount(rs.getInt(9));
				m.setPostDate(rs.getTimestamp(10));
				m.setM_name(rs.getString(11));
				return m;
			}
		}
		catch (Exception e) {
			System.out.println("메이트게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return m;
	}
	
	
	public int updateEdit(MateBoardDto dto) {
			String sql = "UPDATE mate_board SET dDay=?, mateLimit=?, title=?, content=? WHERE mate_num=?";
			int res = 0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setTimestamp(1, new Timestamp(dto.getdDay().getTime()));
				psmt.setInt(2, dto.getMateLimit());
				psmt.setString(3, dto.getTitle());
				psmt.setString(4, dto.getContent());
				psmt.setInt(5, dto.getMate_num());
				
				res = psmt.executeUpdate();
			}
			catch(SQLException e) {
				System.out.println("게시물 수정 중 예외 발생");
				e.printStackTrace();
			}
			return res;
	}
	 
	public int deleteMateBoard(int num) {
		int res=0;
		String sql = "DELETE FROM mate_board WHERE mate_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("메이트게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public List<MateBoardDto> selectList(Map<String, Object>map) {
		ArrayList<MateBoardDto> mbs = new ArrayList<MateBoardDto>();
		MateBoardDto m = null;
		String sql = "SELECT m.*, b.m_name FROM mate_board m INNER JOIN mountain_board b ON m.m_num = b.m_num ";
		if(map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		sql += " ORDER BY mate_num DESC ";
		sql += "LIMIT " + map.get("offset")+","+map.get("pageSize");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				m = new MateBoardDto();
				m.setMate_num(rs.getInt(1));
				m.setM_num(rs.getInt(2));
				m.setId(rs.getString(3));
				m.setTitle(rs.getString(4));
				m.setContent(rs.getString(5));
				m.setdDay(rs.getTimestamp(6));
				m.setMateLimit(rs.getInt(7));
				m.setViewCount(rs.getInt(8));
				m.setCommentCount(rs.getInt(9));
				m.setPostDate(rs.getTimestamp(10));
				m.setM_name(rs.getString(11));
				mbs.add(m);
			}
			
		}
		catch(Exception e) {
			System.out.print("메이트게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return mbs;
	}
	
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM mate_board";
		if(map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		System.out.print(sql);
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.print("메이트게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int updateViewCnt(int num) {
		int res=0;
		String sql = "UPDATE mate_board SET viewCount=viewCount+1 WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("조회수 수정 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	 public int updateCommentCnt(int num, int commentCnt) {
			int res=0;
			String sql = "update mate_board set commentCount = commentCount+? where mate_num =?";
			try {
				psmt= con.prepareStatement(sql);
				psmt.setInt(1, commentCnt);
				psmt.setInt(2, num);
				System.out.println(sql);
				res = psmt.executeUpdate();
			}catch(SQLException e) {
				System.out.println("댓글 수 수정 중 예외발생");
				e.printStackTrace();
			}
			return res;
		}
	 
	 public MateBoardDto selectView(int num) {
		 MateBoardDto dto = null;
			String sql = "SELECT * FROM mate_board WHERE mate_num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new MateBoardDto();
					dto.setMate_num(rs.getInt("mate_num"));
					dto.setM_num(rs.getInt("m_num"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setdDay(rs.getTimestamp("dDay"));
					dto.setMateLimit(rs.getInt("mateLimit"));
					dto.setViewCount(rs.getInt("viewCount"));
					dto.setCommentCount(rs.getInt("commentCount"));
					dto.setPostDate(rs.getTimestamp("postDate"));
				}
			}
			catch(SQLException e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			System.out.println(dto);
			return dto;
		}
	 
	 public int deleteView(int num) {
			int res=0;
			String sql = "DELETE from mate_board WHERE mate_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1,num);
				res = psmt.executeUpdate();
			}catch(SQLException e) {
				System.out.println("게시물 삭제 중 예외발생");
				e.printStackTrace();
			}
			return res;
		}
}
