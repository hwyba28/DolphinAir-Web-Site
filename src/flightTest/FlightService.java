package flightTest;

import static com.hw.common.JDBCTemplate.close;
import static com.hw.common.JDBCTemplate.commit;
import static com.hw.common.JDBCTemplate.getConnection;
import static com.hw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;



public class FlightService {

	private FlightDao fDao = new FlightDao();
	
	public ArrayList<Flight> selectList() {
		Connection con = getConnection();
		
		ArrayList<Flight> list = fDao.selectList(con);
		
		close(con);
		
		return list;
	}

	
}






