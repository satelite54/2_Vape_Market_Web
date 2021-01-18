package DTO;

import java.sql.Date;

public class Order {
	private String Onumber;
	private Date Odate;
	private Date delivery;
	
	public String getOnumber() {
		return Onumber;
	}
	public void setOnumber(String onumber) {
		Onumber = onumber;
	}
	public Date getOdate() {
		return Odate;
	}
	public void setOdate(Date odate) {
		Odate = odate;
	}
	public Date getDelivery() {
		return delivery;
	}
	public void setDelivery(Date delivery) {
		this.delivery = delivery;
	}
}
