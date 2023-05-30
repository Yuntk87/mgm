package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	public List<String> selectJId(String jId) {
		ArrayList<String> mbs = new ArrayList<String>();
		String query = "SELECT d_day FROM mate_board_join WHERE j_id=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, jId);	
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				mbs.add(rs.getString(1));
			}
			
		}
		catch(Exception e) {
			System.out.print("참가기록 조회 중 예외 발생");
			e.printStackTrace();
		}
		return mbs;
	}
	
	public List<MateJoinDto> selectCalendar(String jId) {
		ArrayList<MateJoinDto> mbs = new ArrayList<MateJoinDto>();
//		MateJoinDto m = null;
		String query = "SELECT J.d_day, M.m_name FROM mate_board_join J INNER JOIN mountain_board M ON J.m_num=M.m_num WHERE j_id=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, jId);	
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MateJoinDto m = new MateJoinDto();
				m.setdDay(rs.getTimestamp(1));
				m.setM_name(rs.getString(2));
				mbs.add(m);
			}
			System.out.println(mbs);
		}
		catch(Exception e) {
			System.out.print("캘린더 조회 중 예외 발생");
			e.printStackTrace();
		}
		return mbs;
	}
	
	public ArrayList<MateJoinDto> selectMateJoin(String id) {
		String query = "select m.d_day, mb.m_name , group_concat(m.j_id)"
				+ "	from mate_board_join as m"
				+ "    INNER JOIN mountain_board as mb"
				+ "    ON m.m_num=mb.m_num"
				+ "    where id=?"
				+ "    group by m.d_day , m.m_num;";
		ArrayList<MateJoinDto> mates = new ArrayList<MateJoinDto>();
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);	
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MateJoinDto m  = new MateJoinDto();
				m.setM_name(rs.getString(2));
				m.setjId(rs.getString(3));
				m.setdDay(rs.getTimestamp(1));
				mates.add(m);
				System.out.println("조회 목록 : " + m);
			}	
		}
		catch (Exception e) {
			System.out.println("마이페이지 matejoin등록중 오류발생");
			e.printStackTrace();
		}
		return mates;
	}		
				
	
		
	
}
