package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;

public class FreeBoardDao extends JDBConnect{
	public FreeBoardDao(ServletContext application) {
		super(application);
	}

	 public int insertWrite(FreeBoardDto dto) {
		int res = 0;
		String sql ="INSERT INTO free_board (category, id, title, content, nickName) VALUES (?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,dto.getCategory());
			psmt.setString(2,dto.getId());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getNickName());
			res = psmt.executeUpdate(); 
		}
			catch(SQLException e) { 
				e.printStackTrace();
				System.out.println("게시글 입력 중 오류발생");
			}
			return res;
	 }
	 
	 public FreeBoardDto selectView(int num) {
			FreeBoardDto dto = null;
			
//			String sql = "SELECT B.*, M.nickName "
//					+ "FROM member M INNER JOIN free_board B "
//					+ "ON M.id = B.id"
//					+ " WHERE fb_num=?";
			String sql = "SELECT * FROM free_board WHERE fb_num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new FreeBoardDto();
					dto.setFbnum(rs.getInt("fb_num"));
					dto.setCategory(rs.getString("category"));
					dto.setId(rs.getString("id"));
					dto.setNickName(rs.getString("nickName"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostDate(rs.getTimestamp("postDate"));
					dto.setViewCount(rs.getInt("viewCount"));
					dto.setC_count(rs.getInt("c_count"));
				}
			}
			catch(SQLException e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			System.out.println(dto);
			return dto;
		}
	 
	 public int updateViewCount(int num) {
			String sql = "UPDATE free_board SET viewCount = viewCount+1 WHERE fb_num=?";
			int res=0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				
				res = psmt.executeUpdate();
			} catch(SQLException e) {
				System.out.println("조회수 증가 중 예외 발생");
				e.printStackTrace();
			}
			return res;
		}
	 
	 public int updateEdit(FreeBoardDto dto) {
			String sql = "UPDATE free_board SET category=?, title=?, content=? WHERE fb_num=?";
			int res = 0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getCategory());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
				psmt.setInt(4, dto.getFbnum());
				
				res = psmt.executeUpdate();
			}
			catch(SQLException e) {
				System.out.println("게시물 수정 중 예외 발생");
				e.printStackTrace();
			}
			return res;
		}
	 
	 public int deleteView(int num) {
			int res=0;
			String sql = "DELETE from free_board WHERE fb_num=?";
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
	
	 
	 public int updateCommentCnt(int num, int commentCnt) {
			int res=0;
			String sql = "update free_board set c_count = c_count+? where fb_num =?";
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
	 
	 
	public int selectCount(Map<String, Object> map) {
		int totalCount=0;
		
		String query = "SELECT COUNT(*) FROM free_board";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + ""
					+" LIKE '%" + map.get("searchWord")+"%'";
		}
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<FreeBoardDto> selectList(Map<String, Object>map){
		ArrayList<FreeBoardDto> fbl = new ArrayList<FreeBoardDto>();
		FreeBoardDto dto = null;
		String query = "SELECT*FROM free_board";
		if(map.get("searchWord")!=null) {
			query += " WHERE "+ map.get("searchField")+" "
					+ " LIKE '%" + map.get("searchWord")+"%' ";
		}
		query += " ORDER BY fb_num DESC";
		query += " LIMIT " + map.get("offset")+","+map.get("pageSize");
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
			    dto = new FreeBoardDto();
				
				dto.setFbnum(rs.getInt("fb_num"));
				dto.setCategory(rs.getString("category"));
				dto.setId(rs.getString("id"));
				dto.setNickName(rs.getString("nickName"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getTimestamp("postDate"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setC_count(rs.getInt("c_count")); 
				fbl.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("자유게시판 게시물 조회 중 오류 발생");
			e.printStackTrace();
		}
		return fbl;
	}
	
	public List<FreeBoardDto> selectListmp(String id){
		ArrayList<FreeBoardDto> fbl = new ArrayList<FreeBoardDto>();
		FreeBoardDto dto = new FreeBoardDto();
		String sql = "SELECT*FROM free_board where id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			    dto = new FreeBoardDto();
				
				dto.setFbnum(rs.getInt("fb_num"));
				dto.setCategory(rs.getString("category"));
				dto.setId(rs.getString("id"));
				dto.setNickName(rs.getString("nickName"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getTimestamp("postDate"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setC_count(rs.getInt("c_count")); 
				fbl.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("자유게시판 게시물 조회 중 오류 발생");
			e.printStackTrace();
		}
		return fbl;
	}
		
}
