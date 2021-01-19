package DAO;

import java.sql.*;

public class BDAO{
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Connection getConnection() {
	try {
		String url = "jdbc:mysql://localhost:3306/Vape?useSSL=false";
		String user = "root";
		String password = "root";
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(url,user,password);
		} 	catch (Exception e) {
				e.printStackTrace();
				System.out.println("DB 접속에러");
		}return null; 
	}
	


		public void BoardWrite() {
			String sql = "INSERT INTO board (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
		}
}
