package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.AskDto;

public class AskDao extends JDBConnect{
	public AskDao(ServletContext application) {
		super(application);
	}
	
	public int insertWrite(AskDto dto) {
		int res = 0;
		String sql ="INSERT INTO ask_board (id, title, content, nickName) VALUES (?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getNickName());
			res = psmt.executeUpdate(); 
		}
			catch(SQLException e) { 
				e.printStackTrace();
				System.out.println("게시글 입력 중 오류발생");
			}
			return res;
	 }
	 public AskDto selectView(int num) {
			AskDto dto = null;
			
			String sql = "SELECT * FROM ask_board WHERE ask_num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new AskDto();
					dto.setAsk_num(rs.getInt("ask_num"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostDate(rs.getTimestamp("postDate"));
					dto.setA_count(rs.getInt("a_count"));
					dto.setNickName(rs.getString("nickName"));
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
			String sql = "DELETE from ask_board WHERE ask_num=?";
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
			String sql = "update ask_board set a_count = a_count+? where ask_num =?";
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
			
			String query = "SELECT COUNT(*) FROM ask_board";
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
		
	 
	 public int selectMyCount(String id) {
			int totalCount=0;
			
			String sql = "SELECT COUNT(*) FROM ask_board WHERE id=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				rs.next();
				totalCount = rs.getInt(1);
			}
			catch(Exception e) {
				System.out.println("나의 문의게시물 수를 구하는 중 예외 발생");
				e.printStackTrace();
			}
			return totalCount;
		}
	 
		public List<AskDto> selectList(Map<String, Object>map){
			ArrayList<AskDto> fbl = new ArrayList<AskDto>();
			AskDto dto = null;
			String query = "SELECT*FROM ask_board";
			if(map.get("searchWord")!=null) {
				query += " WHERE "+ map.get("searchField")+" "
						+ " LIKE '%" + map.get("searchWord")+"%' ";
			}
			query += " ORDER BY ask_num DESC";
			query += " LIMIT " + map.get("offset")+","+map.get("pageSize");
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				
				while(rs.next()) {
				    dto = new AskDto();
					
					dto.setAsk_num(rs.getInt("ask_num"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostDate(rs.getTimestamp("postDate"));
					dto.setA_count(rs.getInt("a_count"));
					dto.setNickName(rs.getString("nickName"));
					fbl.add(dto);
				}
			}
			catch(Exception e) {
				System.out.println("문의게시판 조회 중 오류 발생");
				e.printStackTrace();
			}
			return fbl;
		}
		public List<AskDto> selectMyList(String id){
			ArrayList<AskDto> mylist = new ArrayList<AskDto>();
			String query = "SELECT*FROM ask_board WHERE id=? ORDER BY ask_num DESC";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					AskDto dto = new AskDto();
					dto.setAsk_num(rs.getInt("ask_num"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostDate(rs.getTimestamp("postDate"));
					dto.setA_count(rs.getInt("a_count"));
					dto.setNickName(rs.getString("nickName"));
					mylist.add(dto);
				}
			}
			catch(Exception e) {
				System.out.println("1:1 문의게시판 게시물 조회 중 오류 발생");
				e.printStackTrace();
			}
			return mylist;
		}
		
}
