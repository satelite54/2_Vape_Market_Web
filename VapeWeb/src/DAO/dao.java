package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dao {
	//DB ���� ��ü ���� 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public dao() {
		try {
			String url = "jdbc:mysql://localhost:3306/Vape?useSSL=false";
			String user = "root";
			String password = "root";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void closeAll() {	
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	
}

