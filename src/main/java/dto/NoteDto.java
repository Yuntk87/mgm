package dto;

import java.util.Date;

public class NoteDto {
	private int note_num;
	private String senders;
	private String recipients;
	private String content;
	private Date sendDate;
	private int readCheck;
	private int delWaiting;
	
	
	public int getNote_num() {
		return note_num;
	}
	public void setNote_num(int note_num) {
		this.note_num = note_num;
	}
	public String getSenders() {
		return senders;
	}
	public void setSenders(String senders) {
		this.senders = senders;
	}
	public String getRecipients() {
		return recipients;
	}
	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public int getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}
	public int getDelWaiting() {
		return delWaiting;
	}
	public void setDelWaiting(int delWaiting) {
		this.delWaiting = delWaiting;
	}
	
	
	public NoteDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoteDto(String senders, String recipients, String content) {
		super();
		this.senders = senders;
		this.recipients = recipients;
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "NoteDto [note_num=" + note_num + ", senders=" + senders + ", recipients=" + recipients + ", content="
				+ content + ", sendDate=" + sendDate + ", readCheck=" + readCheck + ", delWaiting=" + delWaiting + "]";
	}

}
