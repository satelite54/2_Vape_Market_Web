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
	
	public int getNext() {
		String sql = "Select BNum from Board order by BNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시물인 경우
			
		} catch (Exception e) {
		}return -1; // 데이터 베이스오류
	}
	
	public int write(String BTitle, String BContent) {
		String sql = "INSERT INTO Board VALUES (?,?,?,?,?,?,?)";
		try {
			pstmt.setInt(1,getNext());
			pstmt.setString(2,BTitle);
			pstmt.setString(3,BContent);
			pstmt.setString(4,"now()");
			pstmt.setString(5,"wodn");
			pstmt.setInt(6,1);
			pstmt.setInt(7,0);
			rs = pstmt.executeQuery(sql);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("쓰기 데이터 입력부문 에러");
		}return -1 ; // 데이터베이스 오류
	}
	
}

