package kr.ac.sungkyul.smartcan.vo;

public class MapVo {
	private Long no;
	private String name;
	private double localx;
	private double localy; // 좌표
	private Long regionno; // 지역번호
	private double amount;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getLocalx() {
		return localx;
	}
	public void setLocalx(double localx) {
		this.localx = localx;
	}
	public double getLocaly() {
		return localy;
	}
	public void setLocaly(double localy) {
		this.localy = localy;
	}
	public Long getRegionno() {
		return regionno;
	}
	public void setRegionno(Long regionno) {
		this.regionno = regionno;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "MapVo [no=" + no + ", name=" + name + ", localx=" + localx + ", localy=" + localy + ", regionno="
				+ regionno + "]";
	}
	
	
}
