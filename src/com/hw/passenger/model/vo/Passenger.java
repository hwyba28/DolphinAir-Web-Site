package com.hw.passenger.model.vo;

import java.io.Serializable;
//현재 reservation에 들어간 상태
public class Passenger implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2812879731161575550L;
	
	
	private String PMR_no;
	private String email;
	
	private String name;
	private String c_code;

	private String phone;
	private String address;

	
	/*옵션 : 클래스/기내식/좌석/수화물 --> 탑승객 정보에*/
	
	private String pclass;
	private String meal;//null 가능
	private String seat;
	private String luggage;//null 가능
	
	
	public Passenger() {}
	
	
	//회원의 경우 있는 정보 가져와야 함 / 모두 탑승객 필수 항목
	public Passenger(String pmr_no, String email, String name, String c_code, String phone, String address,
			String pclass, String meal, String seat, String luggage) {
		super();
		PMR_no = pmr_no;
		this.email = email;
		this.name = name;
		this.c_code = c_code;
		this.phone = phone;
		this.address = address;
		this.pclass = pclass;
		this.meal = meal;
		this.seat = seat;
		this.luggage = luggage;
	}

	
	
	
	
	public String getPMR_no() {
		return PMR_no;
	}


	public void setPMR_no(String pmr_no) {
		PMR_no = pmr_no;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
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

//-----------------------------------------------------
	

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


	@Override
	public String toString() {
		return "Passenger [PMR_no=" + PMR_no + ", email=" + email + ", name=" + name + ", c_code=" + c_code + ", phone="
				+ phone + ", address=" + address + ", pclass=" + pclass + ", meal=" + meal + ", seat=" + seat
				+ ", luggage=" + luggage + "]";
	}

	

}
