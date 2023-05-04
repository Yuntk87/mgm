package common;

public class SearchCondition {
	private String searchField = ""; //검색분야
	private String searchWord = ""; //검색어
	private int page = 1; //현재 페이지
	private int pageSize = 5; // 한 페이지 크기(화면에 보여지는 게시물 수)
	
	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	

	public SearchCondition() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//검색어가 지정된 경우
	public SearchCondition(String searchField, String searchWord, int page, int pageSize) {
		super();
		this.searchField = searchField;
		this.searchWord = searchWord;
		this.page = page;
		this.pageSize = pageSize;
	}
	

	public SearchCondition(int page, int pageSize) {
		this("","",page,pageSize);
	}

	public int getOffset(int page) {
		return (page-1)*pageSize;
	}
	
	public String getQueryString() {
		return getQueryString(page);
	}
	
	public String getQueryString(int page) {
		return "?page="+page+"&pageSize="+pageSize+"&searchField="+searchField+"&searchWord="+searchWord;
	}

	@Override
	public String toString() {
		return "SearchCondition [searchField=" + searchField + ", searchWord=" + searchWord + ", page=" + page
				+ ", pageSize=" + pageSize + "]";
	}




	
}
