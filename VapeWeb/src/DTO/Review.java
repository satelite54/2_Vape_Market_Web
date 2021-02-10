package DTO;

public class Review {
	private int RNum;
	private String RTitle;
	private String RContent;
	private String RDate;
	private String id;
	private int authority;
	private int views;
	
	public int getRNum() {
		return RNum;
	}
	public void setRNum(int rNum) {
		RNum = rNum;
	}
	public String getRTitle() {
		return RTitle;
	}
	public void setRTitle(String rTitle) {
		RTitle = rTitle;
	}
	public String getRContent() {
		return RContent;
	}
	public void setRContent(String rContent) {
		RContent = rContent;
	}
	public String getRDate() {
		return RDate;
	}
	public void setRDate(String rDate) {
		RDate = rDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}

	