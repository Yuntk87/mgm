package dto;

public class MountainLikeDto {
	
	private Integer num;
	private String id;
	private Integer board_num;
	
	
	
	
	
	public MountainLikeDto() {
		super();
		
	}

	public MountainLikeDto(Integer num, String id) {
		this.num = num;
		this.id = id;
	}


	public MountainLikeDto(String id, Integer board_num) {
		this.id = id;
		this.board_num = board_num;
	}





	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Integer board_num) {
		this.board_num = board_num;
	}
	
	
	
	@Override
	public String toString() {
		return "LikeDto [num=" + num + ", id=" + id + ", board_num=" + board_num + "]";
	}
	
	
	
	
	
}
