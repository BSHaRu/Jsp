package vo;

import java.util.Date;

public class Free_boardVO {
	private int free_num;
	private String free_category; // 이걸로 제목 / 작성자 / 내용 등 검색 기능 하려는거임
	private String free_title;
	private String free_author;
	private String free_content;
	private Date free_regDate; 		// 글 작성 시간
	private Date free_regMoidfyDate;// 글 수정 시간
	private int free_re_ref;		// 원글 번호
	private int free_re_lev;		// 댓글 뷰 깊이 -> 해당 답변 글에 "들여쓰기" or "ㄴ>" 이거 표시해주는 친구
	private int free_re_seq;		// 대댓글 정렬 순서 -> 이 친구는 원글에 답변 할 수 있게 해주는 친구(sequel)
	private int free_author_num;	// 회원번호
	private int free_readCount;		// 조회수
	private char free_delete;		// 글 삭제시 원글만 사라지고 대댓글은 유지하는 장치
	
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public String getFree_category() {
		return free_category;
	}
	public void setFree_category(String free_category) {
		this.free_category = free_category;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_author() {
		return free_author;
	}
	public void setFree_author(String free_author) {
		this.free_author = free_author;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public Date getFree_regDate() {
		return free_regDate;
	}
	public void setFree_regDate(Date free_regDate) {
		this.free_regDate = free_regDate;
	}
	public Date getFree_regMoidfyDate() {
		return free_regMoidfyDate;
	}
	public void setFree_regMoidfyDate(Date free_regMoidfyDate) {
		this.free_regMoidfyDate = free_regMoidfyDate;
	}
	public int getFree_re_ref() {
		return free_re_ref;
	}
	public void setFree_re_ref(int free_re_ref) {
		this.free_re_ref = free_re_ref;
	}
	public int getFree_re_lev() {
		return free_re_lev;
	}
	public void setFree_re_lev(int free_re_lev) {
		this.free_re_lev = free_re_lev;
	}
	public int getFree_re_seq() {
		return free_re_seq;
	}
	public void setFree_re_seq(int free_re_seq) {
		this.free_re_seq = free_re_seq;
	}
	public int getFree_author_num() {
		return free_author_num;
	}
	public void setFree_author_num(int free_author_num) {
		this.free_author_num = free_author_num;
	}
	public int getFree_readCount() {
		return free_readCount;
	}
	public void setFree_readCount(int free_readCount) {
		this.free_readCount = free_readCount;
	}
	public char getFree_delete() {
		return free_delete;
	}
	public void setFree_delete(char free_delete) {
		this.free_delete = free_delete;
	}
	
}
