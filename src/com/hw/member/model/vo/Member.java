package com.hw.member.model.vo;
//우선 회원만 따로 객체 - 탑승객 분리
import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6946062357741025709L;

	//식별 번호-수정 불가 (랜덤으로 저장 예정)
	//private String mem_no;//회원 - 나중 생성
	//private String PMR_no;//회원, 비회원 모두 가지고 있음 (비회원은 userEmail은 그대로 pw가 PMR_no로 대체됨)
	//탑승객(겸 예약) 번호는 항공 건수에 따라 예약시마다 부여됨 / 회원도 별개로 추가됨
	//단 탑승객 table에서, pmr_no가 user_password에 대신 들어가서 비밀번호 역할
	
	
	/*reservation no(pmr_no)는 랜덤함수로 userpwd 들어갈 예정*/
	
	
	//탑승객 table / 멤버 table 분리??
	//고유 번호 추가하게 되면 테이블 분리 / 그냥 이메일(고유)로 사용할꺼면 그대로 가능
	
	private String userId;	// 사용자 이메일-아이디
	private String userPwd; // 사용자 비밀번호
	
	private String title;//mr,ms..
	private String userName;// 사용자 이름 - full name
	private String c_code;//국가코드
	private String phone;	// 연락처
	private String address; // 주소

	private Date enrollDate;// 가입일
	
	public Member() {}
	
	// 로그인 & 회원가입용 생성자
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	
	//탑승객 조회용 생성자
	public Member(String userId, String userPwd, String title, String userName, String c_code, String phone, String address,
			Date enrollDate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.title = title;
		this.userName = userName;
		this.c_code = c_code;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}



	@Override
	public String toString() {
		return "ID(EMAIL) : " + userId + "\nPWD(encrypted) : " + userPwd;
	}

	public String toString2() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", title=" + title + ", userName=" + userName
				+ ", c_code=" + c_code + ", phone=" + phone + ", address=" + address + ", enrollDate=" + enrollDate + "]";
	}

	
	
}
