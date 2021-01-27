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
		String SQL = "SELECT * FROM Board WHERE BNum < ? and Authority = 1 ORDER BY BNum DESC LIMIT 10";
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

	/*********************************
	 * writeAction
	 **************************************************************/
	public int getBNum() {
		int BNum = 0;
		String sql = "select max(BNum) from board";
		PreparedStatement pstmt = null;
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
		String sql = "select now();";
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

	public void write(String BTitle, String BContent, String id) {
		PreparedStatement pstmt = null;
		String sql = "insert into board(BNum, BTitle, BContent, BDate, id, authority, views) values (?,?,?,?,?,?,?)";
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
			e.printStackTrace();
		}
	}

	public ArrayList<Board> getList(){
		String sql = "Select * FROM Board";
		ArrayList<Board> list = new ArrayList<Board>();{
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Board board = new Board();
				board.setBNum(rs.getInt(1));
				board.setBTitle(rs.getString(2));
				board.setBContent(rs.getString(3));
				board.setBDate(rs.getString(4));
				board.setId(rs.getString(5));
				board.setAuthority(rs.getInt(6));
				board.setViews(rs.getInt(7));
				list.add(board);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}return null;
	}
}	
	
	// 관리자 전체  리뷰 개수
	public int getAllCount() {
		String sql = "select count(*) from Board";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류
	}
	
	// 관리자 리뷰 전체보기 다음 페이지
	public boolean nextPageAdmin(int pageNum) {
		int count = getAllCount();
		int start = (pageNum -1)*10;
		int index = start + 1;
		
		String SQL = "select * from board"; // 12개만 출력
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();	//결과 리턴
			while(rs.absolute(index)) {
				
				if (index < (start + 10) && index <= count) {
					index++;
				} else {
					break;
				}
				
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; //결과가 없으면 false
	}

	public int getNext() {
		String SQL = "SELECT BNum FROM Board ORDER BY BNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;// 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public Board getBoard(int BNum) {
		String SQL = "SELECT * FROM board WHERE BNum= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();
				board.setBNum(rs.getInt(1));
				board.setBTitle(rs.getString(2));
				board.setBContent(rs.getString(3));
				board.setBDate(rs.getString(4));
				board.setId(rs.getString(5));
				board.setAuthority(rs.getInt(6));
				board.setViews(rs.getInt(7));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}