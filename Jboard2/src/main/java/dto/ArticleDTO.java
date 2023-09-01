package dto;

import java.util.Date;

public class ArticleDTO {
	private int no;
	private int parent;		// 부모 글 번호(no를 가르키는거임) -> 어느 글의 댓글인지 알려주는 역할
	private int comment; 	// 댓글 개수를 의미해서 int임
	private String cate;
	private String title;
	private String content; // 내용 or 댓글
	private int file;
	private int hit;
	private String writer;
	private String regIp;
	private Date regDate;
	
	// join 추가
	private String nick;
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	// 파일 join 추가
	private FileDTO fileDto;
	public FileDTO getFileDto() {
		return fileDto;
	}
	public void setFileDto(FileDTO fileDto) {
		this.fileDto = fileDto;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFile() {
		return file;
	}
	public void setFile(int file) {
		this.file = file;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ArticleDTO [no=" + no + ", parent=" + parent + ", comment=" + comment + ", cate=" + cate + ", title="
				+ title + ", content=" + content + ", file=" + file + ", hit=" + hit + ", writer=" + writer + ", regIp="
				+ regIp + ", regDate=" + regDate + ", nick=" + nick + ", fileDto=" + fileDto + ", getNick()="
				+ getNick() + ", getFileDto()=" + getFileDto() + ", getNo()=" + getNo() + ", getParent()=" + getParent()
				+ ", getComment()=" + getComment() + ", getCate()=" + getCate() + ", getTitle()=" + getTitle()
				+ ", getContent()=" + getContent() + ", getFile()=" + getFile() + ", getHit()=" + getHit()
				+ ", getWriter()=" + getWriter() + ", getRegIp()=" + getRegIp() + ", getRegDate()=" + getRegDate()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
