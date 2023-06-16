package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.catalina.tribes.transport.RxTaskPool;

import common.JDBConnect;
import dto.FreeBoardDto;
import dto.NoteDto;
import dto.UserDto;

public class NoteDao extends JDBConnect{
	public NoteDao(ServletContext application) {
		super(application);
	}

	public NoteDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int insertNote(NoteDto n) {
		int res=0;
		String sql="insert into note(senders,recipients,content) values(?,?,?)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1,n.getSenders());
			psmt.setString(2,n.getRecipients());
			psmt.setString(3,n.getContent());
			res=psmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("쪽지 입력중 오류발생");
			e.printStackTrace();
		}return res;
				    
	}  	
	
	public ArrayList<NoteDto> selectAll(String nickName){
		ArrayList<NoteDto> nList = new ArrayList<NoteDto>();
		try {
			String sql = "select * from note where recipients=? AND delWaiting=0 ORDER BY note_num DESC";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nickName);
			rs=psmt.executeQuery();
			NoteDto n = null;
			
			while(rs.next()) {
				n = new NoteDto();
				n.setNote_num(rs.getInt("note_num"));
				n.setSenders(rs.getString("senders"));
				n.setRecipients(rs.getString("recipients"));
				n.setContent(rs.getString("content"));
				n.setSendDate(rs.getTimestamp("sendDate"));
				n.setReadCheck(rs.getInt("readCheck"));
				n.setDelWaiting(rs.getInt("delWaiting"));
				nList.add(n);
			}
		} catch (SQLException e) {
			System.out.println("쪽지 조회중 오류발생");
			e.printStackTrace();
		}
		return nList;
	}
	
	public ArrayList<NoteDto> selectAllSendList(String nickName){
		ArrayList<NoteDto> nList = new ArrayList<NoteDto>();
		try {
			String sql = "select * from note where senders=? ORDER BY note_num DESC";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nickName);
			rs=psmt.executeQuery();
			NoteDto n = null;
			
			while(rs.next()) {
				n = new NoteDto();
				n.setNote_num(rs.getInt("note_num"));
				n.setSenders(rs.getString("senders"));
				n.setRecipients(rs.getString("recipients"));
				n.setContent(rs.getString("content"));
				n.setSendDate(rs.getTimestamp("sendDate"));
				n.setReadCheck(rs.getInt("readCheck"));
				n.setDelWaiting(rs.getInt("delWaiting"));
				nList.add(n);
			}
		} catch (SQLException e) {
			System.out.println("쪽지 조회중 오류발생");
			e.printStackTrace();
		}
		return nList;
	}
	
	
	public ArrayList<NoteDto> selectAllDel(String nickName){
		ArrayList<NoteDto> nList = new ArrayList<NoteDto>();
		try {
			String sql = "select * from note where recipients=? AND delWaiting=1 ORDER BY note_num DESC";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nickName);
			rs=psmt.executeQuery();
			NoteDto n = null;
			
			while(rs.next()) {
				n = new NoteDto();
				n.setNote_num(rs.getInt("note_num"));
				n.setSenders(rs.getString("senders"));
				n.setRecipients(rs.getString("recipients"));
				n.setContent(rs.getString("content"));
				n.setSendDate(rs.getTimestamp("sendDate"));
				n.setReadCheck(rs.getInt("readCheck"));
				n.setDelWaiting(rs.getInt("delWaiting"));
				nList.add(n);
			}
		} catch (SQLException e) {
			System.out.println("쪽지 조회중 오류발생");
			e.printStackTrace();
		}
		return nList;
	}
	
	
	 public NoteDto selectView(int num) {
		 	NoteDto n = null;
			
			String sql = "SELECT * FROM note WHERE note_num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					n = new NoteDto();
					n.setNote_num(rs.getInt("note_num"));
					n.setSenders(rs.getString("senders"));
					n.setRecipients(rs.getString("recipients"));
					n.setContent(rs.getString("content"));
					n.setSendDate(rs.getTimestamp("sendDate"));
					n.setReadCheck(rs.getInt("readCheck"));
					n.setDelWaiting(rs.getInt("delWaiting"));
				}
			}
			catch(SQLException e) {
				System.out.println("쪽지 조회 중 예외 발생");
				e.printStackTrace();
			}
			return n;
		}
	

	public int delete(int noteNum) {
		int res = 0;
		try {
			
			String sql = "DELETE FROM note WHERE note_num=?";
			psmt = con.prepareStatement(sql); 
			psmt.setInt(1, noteNum);
			res = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateReadChk(int noteNum) {
		int res = 0;
		String sql = "UPDATE note SET readCheck = 1 WHERE note_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, noteNum);
			res = psmt.executeUpdate();	
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("읽은메세지 수정오류");
		} return res;
	}

	public int updateDelWaiting(int noteNum, int num) {
		int res = 0;
		String sql = "UPDATE note SET delWaiting = ? WHERE note_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.setInt(2, noteNum);
			res = psmt.executeUpdate();	
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("휴지통 이동 오류");
		} return res;
	}
	
	public int ReadChk(String nickName) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM note WHERE recipients=? AND readCheck = 0 AND delWaiting = 0";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nickName);
			rs=psmt.executeQuery();	
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("읽은메세지 카운트 오류");
		} return res;
	}
	
}
	    
	
	
	
	
	
