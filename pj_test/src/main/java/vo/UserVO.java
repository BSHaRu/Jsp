package vo;

import java.util.Date;

public class UserVO {
	private int uNum;
	private String uId; 
	private String pw; 
	private String uNick; 
	private String uName; 
	private String uPhone; 
	private String uEmail;
	private String uDate; 
	private String gender; 
	private String uAddr1; 
	private String uAddr2; 
	private String uAddr3; 
	private String role; 	// 권한
	private char uJoin; 	// 회원 탈퇴 여부(회원 삭제가 아님 -> 탈퇴시 N으로 변경)
	private Date uRegDate;  // 회원 가입일
	private Date uLeaveDate;// 회원 탈퇴일 (탈퇴시 며칠동안 가입 제한 이런거 해보고 싶긴함)
	
	
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuDate() {
		return uDate;
	}
	public void setuDate(String uDate) {
//		DateTimeFormatter dtf 
//			= DateTimeFormatter.ofLocalizedDate(uDate);
		this.uDate = uDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getuAddr1() {
		return uAddr1;
	}
	public void setuAddr1(String uAddr1) {
		this.uAddr1 = uAddr1;
	}
	public String getuAddr2() {
		return uAddr2;
	}
	public void setuAddr2(String uAddr2) {
		this.uAddr2 = uAddr2;
	}
	public String getuAddr3() {
		return uAddr3;
	}
	public void setuAddr3(String uAddr3) {
		this.uAddr3 = uAddr3;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public char getuJoin() {
		return uJoin;
	}
	public void setuJoin(char uJoin) {
		this.uJoin = uJoin;
	}
	public Date getuRegDate() {
		return uRegDate;
	}
	public void setuRegDate(Date uRegDate) {
		this.uRegDate = uRegDate;
	}
	public Date getuLeaveDate() {
		return uLeaveDate;
	}
	public void setuLeaveDate(Date uLeaveDate) {
		this.uLeaveDate = uLeaveDate;
	} 
	
}
