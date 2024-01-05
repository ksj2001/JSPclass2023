package model;

public class BuyDTO {
	private String order_date;
	private int order_no;
	private String buy_name;
	private String buy_phone;
	private String buy_email;
	private int buy_postcode;
	private String buy_roadaddress;
	private String id;
	
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getBuy_name() {
		return buy_name;
	}
	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}
	public String getBuy_phone() {
		return buy_phone;
	}
	public void setBuy_phone(String buy_phone) {
		this.buy_phone = buy_phone;
	}
	public String getBuy_email() {
		return buy_email;
	}
	public void setBuy_email(String buy_email) {
		this.buy_email = buy_email;
	}
	public int getBuy_postcode() {
		return buy_postcode;
	}
	public void setBuy_postcode(int buy_postcode) {
		this.buy_postcode = buy_postcode;
	}
	public String getBuy_roadaddress() {
		return buy_roadaddress;
	}
	public void setBuy_roadaddress(String buy_roadaddress) {
		this.buy_roadaddress = buy_roadaddress;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
