package kr.ac.sungkyul.smartcan.vo;

public class AdverBoardVo {
	private Long no;
	private String title;
	private String content;
	private Integer view_count;
	private Integer group_no;
	private Integer order_no;
	private Integer depth;
	private String reg_date;
	private Long user_no;
	private String imageurl;
	private String name; // 작성자 이름
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
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
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public Integer getGroup_no() {
		return group_no;
	}
	public void setGroup_no(Integer group_no) {
		this.group_no = group_no;
	}
	public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Long getUser_no() {
		return user_no;
	}
	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "AdverBoardVo [no=" + no + ", title=" + title + ", content=" + content + ", view_count=" + view_count
				+ ", group_no=" + group_no + ", order_no=" + order_no + ", depth=" + depth + ", reg_date=" + reg_date
				+ ", user_no=" + user_no + ", imageurl=" + imageurl + ", name=" + name + "]";
	}
	
	
	
	
	
}
