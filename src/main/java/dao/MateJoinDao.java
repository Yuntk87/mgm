package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.FreeBoardDto;
import dto.MateBoardDto;
import dto.MateJoinDto;

public class MateJoinDao extends JDBConnect{

	public MateJoinDao(ServletContext application) {
		super(application);
	}
	
	public int insertWrite(MateJoinDto dto) {
		int res = 0;
		String sql ="INSERT INTO mate_board_join (mate_num, id, m_num, d_day, j_id) VALUES (?,?,?,?,?)";
			
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,dto.getMateNum());
			psmt.setString(2,dto.getId());
			psmt.setInt(3, dto.getmNum());
			psmt.setTimestamp(4, new Timestamp(dto.getdDay().getTime()));
			psmt.setString(5,dto.getjId());
			res = psmt.executeUpdate(); 
		}
			catch(SQLException e) { 
				e.printStackTrace();
				System.out.println("참가자 입력 중 오류발생");
				}
			return res;
	}
	
	public int deleteMateBoardJoin(MateJoinDto dto) {
		int res=0;
		String sql = "DELETE FROM mate_board_join WHERE mate_num=? AND j_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,dto.getMateNum());
			psmt.setString(2,dto.getjId());
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("참가 취소 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public int count(int mate_num) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM mate_board_join WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, mate_num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("참가자 수 조회 중 예외 발생");
			e.printStackTrace();
		} 
		return res;
	}
	
	
	public MateJoinDto selectMateBoardJoin(int mateNum, String jId) {
		MateJoinDto m = null;
		String query = "SELECT * FROM mate_board_join WHERE mate_num=? AND j_id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, mateNum);	
			psmt.setString(2, jId);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				m = new MateJoinDto();
				m.setMatejNum(rs.getInt(1));
				m.setMateNum(rs.getInt(2));
				m.setId(rs.getString(3));
				m.setmNum(rs.getInt(4));
				m.setdDay(rs.getTimestamp(5));
				m.setjId(rs.getString(6));
				m.setPostDate(rs.getTimestamp(7));
				return m;
			}
		}
		catch (Exception e) {
			System.out.println("메이트 참가글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return m;
	}
		
}
