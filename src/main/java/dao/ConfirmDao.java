package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.UserDto;

public class ConfirmDao extends JDBConnect {

	public ConfirmDao(ServletContext application) {
		super(application);
	}
	
	public int insertConfirmBoard (ConfirmBoardDto c) {
		int res=0;
		String sql = "INSERT INTO confirm_board(m_num, id) values(?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, c.getM_num());
			psmt.setString(2, c.getId());
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("인증게시판 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public ConfirmBoardDto selectCerBoard(int num) {
		ConfirmBoardDto c = null;
		String query = "SELECT*FROM confirm_board WHERE cb_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				c = new ConfirmBoardDto();
				c.setM_num(rs.getInt("m_num"));
				c.setId(rs.getString("id"));
				return c;
			}
		}
		catch (Exception e) {
			System.out.println("인증게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return c;
	}
	
	
	public int deleteCerBoard(int num) {
		int res=0;
		String sql = "DELETE FROM confirm_board WHERE cb_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("인증게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM confirm_board";
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
			System.out.print("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int Count(String nickNname) {
		int Count = 0;
		String sql = "SELECT COUNT(*) FROM confirm_board WHERE id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nickNname);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				Count = rs.getInt(1);
			}
		}
		catch(Exception e) {
			System.out.println("인증게시글 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return Count;
	}
	
	public String selectmountain(String id) {
		ArrayList<ConfirmBoardDto> c = new ArrayList<ConfirmBoardDto>();
		String sql = "SELECT M.m_name FROM confirm_board C INNER JOIN mountain_board M ON C.m_num = M.m_num where id=? order by c.m_num desc limit 3";
		String res="";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);	
			rs = psmt.executeQuery();
			res="";
			while(rs.next()) {
				
				res += rs.getString("m_name") +" ";
				
			}
		}
		catch (Exception e) {
			System.out.println("인증카운트중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<ConfirmBoardDto> selectList(Map<String, Object>map){
		ArrayList<ConfirmBoardDto> fbl = new ArrayList<ConfirmBoardDto>();
		ConfirmBoardDto dto = null;
		String query = "SELECT C.*, M.m_name FROM confirm_board C INNER JOIN mountain_board M ON C.m_num=M.m_num";
		if(map.get("searchWord")!=null) {
			query += " WHERE "+ map.get("searchField")+" "
					+ " LIKE '%" + map.get("searchWord")+"%' ";
		}
		query += " ORDER BY cb_num DESC";
		query += " LIMIT " + map.get("offset")+","+map.get("pageSize");
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
			    dto = new ConfirmBoardDto();
				
				dto.setCd_num(rs.getInt("cb_num"));
				dto.setM_num(rs.getInt("m_num"));
				dto.setId(rs.getString("id"));
				dto.setPostDate(rs.getTimestamp("postDate"));
				dto.setM_name(rs.getString("m_name"));
				fbl.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("인증게시판 게시물 조회 중 오류 발생");
			e.printStackTrace();
		}
		return fbl;
	}
	
	public ArrayList searchConfirm(String id){
		String query = "SELECT C.*, M.m_name FROM confirm_board C INNER JOIN mountain_board M ON C.m_num=M.m_num WHERE id LIKE ?";
		ArrayList<ConfirmBoardDto> confirmList=new ArrayList<ConfirmBoardDto>();
		id = "%"+id+"%";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			ConfirmBoardDto dto = null;
			while(rs.next()) {
			    dto = new ConfirmBoardDto();
				
				dto.setCd_num(rs.getInt("cb_num"));
				dto.setM_num(rs.getInt("m_num"));
				dto.setId(rs.getString("id"));
				dto.setPostDate(rs.getTimestamp("postDate"));
				dto.setM_name(rs.getString("m_name"));
				confirmList.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("인증게시판 아이디 검색 중 오류 발생");
			e.printStackTrace();
		}
		return confirmList;
	}
}
