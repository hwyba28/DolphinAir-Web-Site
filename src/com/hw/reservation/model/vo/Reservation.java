package com.hw.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1908514236384240543L;
	
	private String PMR_no;//예약 번호
	//회원이면 정보 긁어오기
	private String email;
	
	private String title;
	private String name;
	private String c_code;
	private String phone;
	private String address;
	
	private String Route_no;
//	private String Route_no = "";//나중에 사용하려고 여기는 기본값 지정?!
	private String From;
	private String To;
	private String Departure;
	private Date Arrival;//임시로 작동 안되어서! 일단 date로!
	
	private String Arrival2;
	
	
	
	
	
	private String pclass;
	
	private String meal;
	private String seat;
	private String luggage;
//------------------------------------------------------
	
	private String owner;
	private String card_no;
	private String mm;
	private String yy;
	private String cvc;//텍스트로 입력받아야 하므로!
	
//-----------------------------------------------------
	
	
	private Date reserveDate;//예약 날짜 시스템 자동
	

	private String reserveDate2;
	
	
	public Reservation() {}

	
	
	

	public Reservation(String pMR_no, String email, String title, String name, String c_code, String phone,
			String address, String route_no, String from, String to, String departure, String arrival, String pclass,
			String meal, String seat, String luggage, String owner, String card_no, String mm, String yy, String cvc,
			Date reserveDate, String reserveDate2) {
		super();
		PMR_no = pMR_no;
		this.email = email;
		this.title = title;
		this.name = name;
		this.c_code = c_code;
		this.phone = phone;
		this.address = address;
		Route_no = route_no;
		From = from;
		To = to;
		Departure = departure;
		Arrival2 = arrival;
		this.pclass = pclass;
		this.meal = meal;
		this.seat = seat;
		this.luggage = luggage;
		this.owner = owner;
		this.card_no = card_no;
		this.mm = mm;
		this.yy = yy;
		this.cvc = cvc;
		this.reserveDate = reserveDate;
		
		this.reserveDate2 = reserveDate2;
	}





	public String getPMR_no() {
		return PMR_no;
	}


	public void setPMR_no(String pMR_no) {
		PMR_no = pMR_no;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getC_code() {
		return c_code;
	}


	public void setC_code(String c_code) {
		this.c_code = c_code;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getRoute_no() {
		return Route_no;
	}


	public void setRoute_no(String route_no) {
		Route_no = route_no;
	}


	public String getFrom() {
		return From;
	}


	public void setFrom(String from) {
		From = from;
	}


	public String getTo() {
		return To;
	}


	public void setTo(String to) {
		To = to;
	}


	public String getDeparture() {
		return Departure;
	}


	public void setDeparture(String departure) {
		Departure = departure;
	}


	public Date getArrival() {
		return Arrival;
	}


	public void setArrival(Date arrival) {
		Arrival = arrival;
	}


	public String getPclass() {
		return pclass;
	}


	public void setPclass(String pclass) {
		this.pclass = pclass;
	}


	public String getMeal() {
		return meal;
	}


	public void setMeal(String meal) {
		this.meal = meal;
	}


	public String getSeat() {
		return seat;
	}


	public void setSeat(String seat) {
		this.seat = seat;
	}


	public String getLuggage() {
		return luggage;
	}


	public void setLuggage(String luggage) {
		this.luggage = luggage;
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getCard_no() {
		return card_no;
	}


	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}


	public String getMm() {
		return mm;
	}


	public void setMm(String mm) {
		this.mm = mm;
	}


	public String getYy() {
		return yy;
	}


	public void setYy(String yy) {
		this.yy = yy;
	}


	public String getCvc() {
		return cvc;
	}


	public void setCvc(String cvc) {
		this.cvc = cvc;
	}


	public Date getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}


//보여주기식 조회용(날짜)는 모두 String으로!
	public String getReserveDate2() {
		return reserveDate2;
	}


	public void setReserveDate2(String reserveDate) {
		this.reserveDate2 = reserveDate;
	}


	
	

	public String getArrival2() {
		return Arrival2;
	}





	public void setArrival2(String arrival2) {
		Arrival2 = arrival2;
	}




	@Override
	public String toString() {
		return "Reservation [PMR_no=" + PMR_no + ", email=" + email + ", title=" + title + ", name=" + name
				+ ", c_code=" + c_code + ", phone=" + phone + ", address=" + address + ", Route_no=" + Route_no
				+ ", From=" + From + ", To=" + To + ", Departure=" + Departure + ", Arrival=" + Arrival + ", pclass="
				+ pclass + ", meal=" + meal + ", seat=" + seat + ", luggage=" + luggage + ", owner=" + owner
				+ ", card_no=" + card_no + ", mm=" + mm + ", yy=" + yy + ", cvc=" + cvc + ", reserveDate=" + reserveDate
				+ "]";
	}

	
	
	public String toString2() {
		return "PMR_no: " + PMR_no + " email=" + email + "\n title=" + title + " name=" + name +"\n"
				 + c_code + ")" + phone + " address=" + address + ", Route_no :" + Route_no
				+ " From=" + From + " To=" + To + ", Departure: " + Departure + " Arrival:" + Arrival + "\n pclass="
				+ pclass + " meal=" + meal + " seat=" + seat + " luggage=" + luggage + "예약 날짜 : " + reserveDate2;
	}
	
	
	//카드 번호는 추가로
	public String toString3() {
		return "Reservation [owner=" + owner + ", card_no=" + card_no + ", mm=" + mm + ", yy=" + yy + ", cvc=" + cvc
				+ ", reserveDate2=" + reserveDate2 + "]";
	}
	
	

}