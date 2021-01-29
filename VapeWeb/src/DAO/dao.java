package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.sun.org.apache.xpath.internal.operations.Or;

import DTO.Orders;

public class dao {
	//DB ���� ��ü ���� 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public dao() {
		try {
			String url = "jdbc:mysql://localhost:3306/vape?useSSL=false";
			String user = "root";
			String password = "1234";

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
	
	// 금일 날짜를 불러오는 메소드.
		public String getToday() {
			String sql = "SELECT now()";
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e) {
			}
			return "";
		}
		
	
	
	// 2일 뒤 날짜를 불러오는 메소드.
	public String getDate() {
		String sql = "SELECT adddate(CURDATE(),2)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
		}
		return "";
	}
		// 주문목록을 받아오는 메소드
		public ArrayList<Orders> getOrderList(String id) {
			String sql = "SELECT cartID,Odate,DATE_ADD(Odate,INTERVAL 2 DAY) AS 'LaterDate',id FROM orders WHERE id = ?";
				ArrayList<Orders> list = new ArrayList<Orders>();
					PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs =pstmt.executeQuery(); 
				while(rs.next()) {
					Orders orders = new Orders();
					orders.setCartID(rs.getString(1));
					orders.setOdate(rs.getDate(2).toString().substring(0, 10));
					orders.setLaterDate(rs.getDate(3).toString().substring(0, 10));
					orders.setId(rs.getString(4));
					list.add(orders);
				}return list;
			} catch (Exception e) {
				e.printStackTrace();
			}return null;
		}
		
		
		// 업데이트 DB 문
		public void upDateOrder(String id, HttpSession session) {
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			sql = "INSERT INTO ORDERS VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,session.getId());
			pstmt.setString(1,session.getId());
			pstmt.setString(2,getToday());
			pstmt.setString(3,id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		

		
		
		
}
