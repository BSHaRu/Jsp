package dto;

import java.util.Date;

public class FileDTO {
	private int fno;
	private int ano;
	private String oriName;
	private String newName;
	private int download;
	private Date regDate;

	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "FileDTO [fno=" + fno + ", ano=" + ano + ", oriName=" + oriName + ", newName=" + newName + ", download="
				+ download + ", regDate=" + regDate + "]";
	}
	
}
