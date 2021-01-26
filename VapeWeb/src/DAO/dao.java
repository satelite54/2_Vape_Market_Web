package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import DTO.Board;

public class dao {

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

	public void closeAll() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



	

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM Board WHERE BNum < ? Authority = 1 ORDER BY BNum DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
/*********************************           writeAction                              **************************************************************/
	public int getBNum() {
		int BNum = 0;
		String sql = "select max(BNum) from board";
			try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				BNum = rs.getInt("max(BNum)") + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return BNum;
	}
	
	public String getDate() {
		String BDate = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		BDate = ts.toString();
		return BDate;
	}
	
	public void write(String BTitle, String BContent, String id) {
		
		String sql = "insert into board(BNum, BTitle, BContent, BDate, id, authority, views) values(?,?,?,?,?,?,?)";
		try {
			int authority = 1;
			int views = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getBNum());
			pstmt.setString(2, BTitle);
			pstmt.setString(3, BContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, id);
			pstmt.setInt(6, authority);
			pstmt.setInt(7, views);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("쓰기 데이터 전송에러");
		}
	}
}