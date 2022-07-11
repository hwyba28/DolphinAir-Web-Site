package flightTest;

import static com.hw.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

public class FlightDao {

	private Properties prop;
	
	public FlightDao() {
		prop = new Properties();
		
		String filePath = FlightDao.class.getResource("/config/Flight-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Flight> selectList(Connection con) {
		ArrayList<Flight> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList"); // select * from FlightList
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Flight>();
			
			while(rset.next()) {
				Flight f = new Flight();
System.out.println(rset.getString("ROUTE_NO"));
				f.setRoute_no(rset.getString("ROUTE_NO"));
				f.setFrom(rset.getString("FROM"));
				f.setTo(rset.getString("TO"));
				f.setDeparture(rset.getDate("DEPARTURE"));
				f.setArrival(rset.getDate("ARRIVAL"));

				System.out.println(list);

				list.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	

	}







