package DAO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import DTO.Board;
import DTO.Orders;
import DTO.Products;
import DTO.Users;

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

	// 페이지네이션 10개식 끊어서 보여주는 메소드
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
	
	//1을 출력해주는 메소드
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
	
	
	// 금일 날짜를 불러오는 메소드.
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

	
	
	// 글을 쓰는 메소드
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

	
	
	
	// 보드 리스트를 불러오는 메소드
	public ArrayList<Board> getList(){
		String sql = "Select * FROM board WHERE authority =1 order BY BNum DESC";
		ArrayList<Board> list = new ArrayList<Board>();
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
	
	
	
	


	
	
	
	// 조회수를 증가시키는 메소드
	public void viewsCount(int BNum) {
		String sql = "UPDATE board SET views = views +1 WHERE BNum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, BNum);
			 pstmt.executeUpdate();
		}
		 catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	// 게시물 상세내용 메소드
	public Board getBoard(int BNum) {
		viewsCount(BNum);
		String SQL = "SELECT * FROM board WHERE BNum = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
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
		}System.out.println("보드 전송에러");
		return null;
	}
	
	
	// 삭제 메소드
	public void deleteBoard(int BNum) {
		String sql = "UPDATE Board set authority = 0 where BNum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, BNum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 글 수정 메소드
	public int updateBoard(String BTitle,String BContent,int BNum) {
		String sql = "UPDATE board SET BTITLE = ? , BCONTENT = ? WHERE BNUM = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BTitle);
			pstmt.setString(2,BContent);
			pstmt.setInt(3, BNum);
			return pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}return -1;
	}
	
	
	/*======================================= 아영님 ===============================================*/
	
	
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
	public String Day2() {
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
	
		/* 태헌형님 */
		
		public List<Products> makeProductsList(String sqlQuery) {
			String sql = sqlQuery;
			if(sql == null || sql == "") {
				sql = "select * from products";
			} else {
				sql = sqlQuery;
			}
			List<Products> list = new ArrayList<Products>();
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					Products product = new Products();
					product.setPname(rs.getString("pname"));
					product.setCode(rs.getString("code"));
					product.setManufacturer(rs.getString("manufacturer"));
					product.setPrice(rs.getInt("price"));
					product.setStock(rs.getInt("stock"));
					product.setImgname(rs.getString("imgname"));
					product.setAdddate(rs.getDate("adddate"));
					product.setProducttype(rs.getString("producttype"));
					product.setDetailedimagepath(rs.getString("detailedimagepath"));
					list.add(product);
				} closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public List<String> makecategoryList() {
			String sql = "select distinct producttype from products";
			List<String> list = new ArrayList<String>();
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int i = 1;
				while(rs.next()) {
					list.add(rs.getString(1));
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public List<Integer> cntcategoryList() {
			String sql = "select count(*) from products group by producttype";
			List<Integer> list = new ArrayList<Integer>();
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int i = 1;
				while(rs.next()) {
					list.add(rs.getInt(1));
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		
		
		
		
		
		
		
		
		/* 세준님 */
		
		public int login(String id, String pw) {
			String SQL = "SELECT pw FROM USERS WHERE id = ?";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if(rs.getString(1).equals(pw)) {
						return 1; // 로그인 성공
					}
					else
						return 0; // 비밀번호 불일치
				}
				return -1; // 아이디 없음
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -2; // DB 오류
		}

			public int join(Users user) {
				String SQL = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?, ?, ? , ? , ?)";
				try {
					pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, user.getId());
					pstmt.setString(2, user.getPw());
					pstmt.setString(3, user.getZip());
					pstmt.setString(4, user.getStreet());
					pstmt.setString(5, user.getBuilding());
					pstmt.setString(6, user.getMobile());
					pstmt.setInt(7, user.getAuthority());
					pstmt.setString(8, user.getBirthday());
					pstmt.setInt(9, user.getAdmin());
					return pstmt.executeUpdate();
				} catch(Exception e) {
					e.printStackTrace();
				}
				return -1; // 데이터 베이스 오류
			}
		
			public int getadmin(String id) {
				String sql = "select admin from Users where id = ?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					ResultSet rs =pstmt.executeQuery();
					if(rs.next()) {
						return rs.getInt(1);
					} else {
						return 0;
					}
				}
				catch (SQLException e) {
					e.printStackTrace();
					return -1;
				}
			}
}