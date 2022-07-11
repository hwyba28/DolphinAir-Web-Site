package flightTest;

import java.sql.Date;

public class Flight {

	//모두 각 항공편 마다 필수 값
	private String route_no;//항공편명 - (검색 조건은 X)
	
	private String from;//출발지
	private String to;//도착지

	private Date departure;//출발 날짜, 시간 / 얘는 입력값 그대로 보여지므로
	private Date arrival;//도착 시간 /직접가져와야하는애만 String로?!(그에 해당하는 데이터)
	
	//자유 검색(도착지 어디든) / 날짜랑 출발지 만으로..
	public Flight(String from, Date departure) {
		super();
		this.from = from;
		this.departure = departure;
	}	
	
	//일반 검색
		public Flight(String from, String to, Date departure) {
			super();
			this.from = from;
			this.to = to;
			this.departure = departure;
		}

		
	//조회 결과
	public Flight(String from, String to, Date departure, Date arrival) {
		super();
		this.from = from;
		this.to = to;
		this.departure = departure;
		this.arrival = arrival;//가져오기만 함!
	}

	
	public Flight(String route_no, String from, String to, Date departure, Date arrival) {
		super();
		this.route_no = route_no;
		this.from = from;
		this.to = to;
		this.departure = departure;
		this.arrival = arrival;
	}


	public Flight() {
	}

	public String getRoute_no() {
		return route_no;
	}


	public void setRoute_no(String route_no) {
		this.route_no = route_no;
	}


	public String getFrom() {
		return from;
	}


	public void setFrom(String from) {
		this.from = from;
	}


	public String getTo() {
		return to;
	}


	public void setTo(String to) {
		this.to = to;
	}


	public Date getDeparture() {
		return departure;
	}


	public void setDeparture(Date departure) {
		this.departure = departure;
	}


	public Date getArrival() {
		return arrival;
	}


	public void setArrival(Date arrival) {
		this.arrival = arrival;
	}


	@Override
	public String toString() {
		return "Flight [route_no=" + route_no + ", from=" + from + ", to=" + to + ", departure=" + departure
				+ ", arrival=" + arrival + "]";
	}
	
	
	
}
