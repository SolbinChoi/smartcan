package kr.ac.sungkyul.smartcan.vo;

public class StatisticVo {
	private Long no; // 통계량 번호(PK)
	private Long amount; // 쓰레기양
	private Long day; // 날짜
	private Long month_no; // 월
	private Long point_no; // 지점위치 번호 (FK)
	private String name;  // 위치명
	private Long sum; // 통계 합
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Long getDay() {
		return day;
	}
	public void setDay(Long day) {
		this.day = day;
	}
	public Long getMonth_no() {
		return month_no;
	}
	public void setMonth_no(Long month_no) {
		this.month_no = month_no;
	}
	public Long getPoint_no() {
		return point_no;
	}
	public void setPoint_no(Long point_no) {
		this.point_no = point_no;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getSum() {
		return sum;
	}
	public void setSum(Long sum) {
		this.sum = sum;
	}
	@Override
	public String toString() {
		return "StatisticVo [no=" + no + ", amount=" + amount + ", day=" + day + ", month_no=" + month_no
				+ ", point_no=" + point_no + ", name=" + name + ", sum=" + sum + "]";
	}
	
	
	
}
