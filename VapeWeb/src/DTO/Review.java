package DTO;

public class Review {
	private int BNum;
	private String BTitle;
	private String BContent;
	private String BDate;
	private String id;
	private int authority;
	private int views;
	
	public int getBNum() {
		return BNum;
	}
	public void setBNum(int bNum) {
		BNum = bNum;
	}
	public String getBTitle() {
		return BTitle;
	}
	public void setBTitle(String bTitle) {
		BTitle = bTitle;
	}
	public String getBContent() {
		return BContent;
	}
	public void setBContent(String bContent) {
		BContent = bContent;
	}
	public String getBDate() {
		return BDate;
	}
	public void setBDate(String bDate) {
		BDate = bDate;
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

	