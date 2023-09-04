package dto;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.UUID;

public class ProductDTO {

	private int pNo;
	private int type;
	private String pName;
	private int price;
	private int delivery;
	private int stock;
	private int sold;
	private String thumb1;
	private String thumb2;
	private String thumb3;
	private String seller;
	private String etc;
	private Date regDate;
	
	// 파일 업로드 땜에 추가함
	private String path;
	
	public ProductDTO() {}
	
	public ProductDTO(String path) {
		this.path = path;
	}
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getPrice() {
		return price;
	}
	// 가격을 3자리 포멧으로 출력
	// ex)1,000 , 1,000,000 이런 식으로 가격 포멧 정하기
	public String getPriceWithComma() {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(price);
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	public String getThumb1() {
		return thumb1;
	}
	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}
	public void setThumb1ForReName(String thumb1) {
		// uuid로 바꿔준 이름으로 저장해줌
		this.thumb1 = fileRename(thumb1);
	}
	public String getThumb2() {
		return thumb2;
	}
	public void setThumb2(String thumb2) {
		this.thumb2 = thumb2;
	}
	public void setThumb2ForReName(String thumb2) {
		this.thumb2 = fileRename(thumb2);
	}
	public String getThumb3() {
		return thumb3;
	}
	public void setThumb3(String thumb3) {
		this.thumb3 = thumb3;
	}
	public void setThumb3ForReName(String thumb3) {
		this.thumb3 = fileRename(thumb3);
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	// 파일 업로드 추가
	public String fileRename(String thumb) {
		int i = thumb.lastIndexOf(".");
		String ext = thumb.substring(i);
		
		String uuid = UUID.randomUUID().toString();
		String sName = uuid + ext;
		
		File f1 = new File(path + "/" + thumb); 
		File f2 = new File(path + "/" + sName);
		f1.renameTo(f2);
		
		return sName;
	}

	@Override
	public String toString() {
		return "ProductDTO [pNo=" + pNo + ", type=" + type + ", pName=" + pName + ", price=" + price + ", delivery="
				+ delivery + ", stock=" + stock + ", sold=" + sold + ", thumb1=" + thumb1 + ", thumb2=" + thumb2
				+ ", thumb3=" + thumb3 + ", seller=" + seller + ", etc=" + etc + ", regDate=" + regDate + ", path="
				+ path + "]";
	}
}
