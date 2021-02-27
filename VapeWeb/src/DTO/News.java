package DTO;

public class News {

	String title;
	String href;
	String content;
	String imgsrc;
	
	public String getTitle() {
		return title;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return title + "\n" + href + "\n" + content ;
	}
	
	
	
	}
	
	
