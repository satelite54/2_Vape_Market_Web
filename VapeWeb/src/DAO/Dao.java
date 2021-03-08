package DAO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.print.attribute.standard.PresentationDirection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DTO.Board;
import DTO.Orders;
import DTO.Products;
import DTO.Users;
import DTO.Review;

public class Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Dao() {
		try {
			String url = "jdbc:mysql://localhost:3306/vape?useSSL=false&useUnicode=true&characterEncoding=utf8";
			String user = "root";
			String password = "1234";
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

	public List<Board> getlimitBoardList(int pageNum){
		ArrayList<Board> getBoardLimit = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		if (pageNum != 0 && pageNum == 1) {
			pageNum = getBNum();
		}else {
			pageNum = getBNum() - (pageNum * 10)+10;
		}

		String sql  = "select * from board where bnum < "+pageNum+" and authority = 1 order by bnum desc limit 10";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBNum(rs.getInt(1));
				board.setBTitle(rs.getString(2));
				board.setBContent(rs.getString(3));
				board.setBDate(rs.getString(4));
				board.setId(rs.getString(5));
				board.setAuthority(rs.getInt(6));
				board.setViews(rs.getInt(7));
				getBoardLimit.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getBoardLimit;
	}



	// 게시판 작성시 최신번호를 가져오는 메소드
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

	// 존재하는 보드의 갯수를 가지고오는 메소드

	public int getBoardCnt() {
		int boardCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(BNum) FROM board WHERE authority = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			if (rs.next()) {
				boardCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardCnt;
	}



	// 글을 쓰는 메소드
	public void write(String BTitle, String BContent, String id) {
		PreparedStatement pstmt = null;
		String sql = "insert into board(BNum, BTitle, BContent, BDate, id, authority, views) values (?,?,?,now(),?,1,0)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getBNum());
			pstmt.setString(2, BTitle);
			pstmt.setString(3, BContent);
			pstmt.setString(4, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("쓰기 데이터 전송에러");
			e.printStackTrace();
		}
	}


	public void writeReview(String RTitle, String RContent, String id) {
		PreparedStatement pstmt = null;
		String sql = "insert into review(RNum, RTitle, RContent, RDate, id, authority, views) values (?,?,?,now(),?,1,0)";
		try {
			int authority = 1;
			int views = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getRNum());
			pstmt.setString(2, RTitle);
			pstmt.setString(3, RContent);
			pstmt.setString(4, id);
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
			PreparedStatement pstmt = conn.prepareStatement(sql);
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
//페이지네이션 10개식 끊어서 보여주는 메소드
public boolean nextReviewPage(int pageNumber) {
	String SQL = "SELECT * FROM Review WHERE RNum < ? and Authority = 1 ORDER BY RNum DESC LIMIT 10";
	ArrayList<Review> list = new ArrayList<Review>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getRNum() + 1 - (pageNumber - 1) * 10);
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
public int getReviewNext() {
	String SQL = "SELECT RNum FROM Review ORDER BY RNum DESC";
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
public int getRNum() {
	int RNum = 0;
	String sql = "select max(RNum) from review";
	PreparedStatement pstmt = null;
	try {
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			RNum = rs.getInt("max(RNum)") + 1;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return RNum;
	}
// 금일 날짜를 불러오는 메소드.
public String getReviewDate() {
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
public void reviewWrite(String RTitle, String RContent, String id) {
	PreparedStatement pstmt = null;
	String sql = "insert into review(RNum, RTitle, RContent, RDate, id, authority, views) values (?,?,?,?,?,?,?)";
	try {
		int authority = 1;
		int views = 0;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, getRNum());
		pstmt.setString(2, RTitle);
		pstmt.setString(3, RContent);
		pstmt.setString(4, getReviewDate());
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
public ArrayList<Review> getReviewList(){
	String sql = "Select * FROM review WHERE authority =1 order BY RNum DESC";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Review review = new Review();
				review.setRNum(rs.getInt(1));
				review.setRTitle(rs.getString(2));
				review.setRContent(rs.getString(3));
				review.setRDate(rs.getString(4));
				review.setId(rs.getString(5));
				review.setAuthority(rs.getInt(6));
				review.setViews(rs.getInt(7));
				list.add(review);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}return null;
}
	// 조회수를 증가시키는 메소드
public void reviewViewsCount(int RNum) {
	String sql = "UPDATE review SET views = views +1 WHERE RNum = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, RNum);
		 pstmt.executeUpdate();
	}
	 catch (Exception e) {
		e.printStackTrace();
	}
}
// 게시물 상세내용 메소드
public Review getReview(int RNum) {
	viewsCount(RNum);
	String SQL = "SELECT * FROM review WHERE RNum = ?";
	Review review = new Review();
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, RNum);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			review.setRNum(rs.getInt(1));
			review.setRTitle(rs.getString(2));
			review.setRContent(rs.getString(3));
			review.setRDate(rs.getString(4));
			review.setId(rs.getString(5));
			review.setAuthority(rs.getInt(6));
			review.setViews(rs.getInt(7));
			return review;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}System.out.println("보드 전송에러");
	return review;
}
// 삭제 메소드
public void deleteReview(int RNum) {
	String sql = "UPDATE Review set authority = 0 where RNum = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, RNum);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}

}
// 글 수정 메소드
public int updateReview(String RTitle,String RContent,int RNum) {
	String sql = "UPDATE review SET RTITLE = ? , RCONTENT = ? WHERE RNUM = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,RTitle);
		pstmt.setString(2,RContent);
		pstmt.setInt(3, RNum);
		return pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}return -1;
}
	// 금일 날짜를 불러오는 메소드.myshopping용
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
			Random random = new Random(2100000000);
			String n = Integer.toString(random.nextInt());
			String n1 = String.valueOf(random.nextInt());
			String n2 = Long.toString(random.nextInt());

			sql = "INSERT INTO ORDERS VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			//			pstmt.setString(1,session.getId());
			pstmt.setString(1,session.getId()+n);
			pstmt.setString(2,getToday());
			pstmt.setString(3,id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* 태헌형님 */

	public List<Products> makeProductsList(String sqlQuery) {
		List<Products> list = new ArrayList<Products>();
		try {

			pstmt = conn.prepareStatement(sqlQuery);
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
				product.setDetailedimagepath(rs.getString("detailedimgpath"));
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
		String SQL = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			pstmt.setString(10, user.getName());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}
	public int set_update(Users user, HttpSession session) {
		String SQL = "UPDATE USERS SET ID = ? ,Pw = ?, Zip = ? ,Street = ?,Building = ? ,Mobile = ?, Authority = ?  ,Birthday =? , Admin = ? ,Name = ? , Email = ? where id = ?";
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
			pstmt.setString(10, user.getName());
			pstmt.setString(11, user.getEmail());
			pstmt.setString(12,(String)session.getAttribute("id"));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return -1; // 데이터 베이스 오류
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	public int setadmin(String modalid) {
		String sql = "update Users set admin = 1 where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modalid);
			return pstmt.executeUpdate();
		} catch (Exception e) {
		}
		return -1;
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


	// 회원수정 Page 정보를 불러오는 메소드
	public Users getUserList(HttpSession id){
		String sql = "Select * FROM users where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)id.getAttribute("id"));
			rs = pstmt.executeQuery();
			Users users = new Users();
			if (rs.next()){
				users.setId(rs.getString(1));
				users.setPw(rs.getString(2));
				users.setZip(rs.getString(3));
				users.setStreet(rs.getString(4));
				users.setBuilding(rs.getString(5));
				users.setMobile(rs.getString(6));
				users.setAuthority(rs.getInt(7));
				users.setBirthday(rs.getString(8));
				users.setAdmin(rs.getInt(9));
				users.setName(rs.getString(10));
				users.setEmail(rs.getString(11));
			}return users;
		} catch (Exception e) {
			e.printStackTrace();
		}return null;
	}

	// 회원수정 Page 회원정보를 삭제하는 메소드
	public int deleteUser(HttpSession id) {
		String sql = "Delete From USERS where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)id.getAttribute("id"));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}System.out.println("회원수정 Page 삭제메소드 에러");

		return -1;
	}

	public void deleteUser(String[] checkBoxId) {
		for(int i = 0; i < checkBoxId.length; i++) {
			String sql = "Delete From USERS where id = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, checkBoxId[i]);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			};
		}
	}

	public int insertProduct(Products products) {
		String SQL = "insert into products VALUES (?, ?, ?, ?, ?, ?, now() , ? , ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, products.getPname());
			pstmt.setString(2, products.getCode());
			pstmt.setString(3, products.getManufacturer());
			pstmt.setInt(4, products.getPrice());
			pstmt.setInt(5, products.getStock());
			pstmt.setString(6, products.getImgname());
			pstmt.setString(7, products.getProducttype());
			pstmt.setString(8, products.getDetailedimagepath());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int deleteProduct(String pname) {
		String sql = "delete From Products where pname = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int UpdateProduct(Products products) {
		String sql = "update products set pname = ?, code = ?, manufacturer = ?, price = ?, stock = ?,"
				+ "imgname = ?, adddate = now(), producttype = ?, detailedimgpath = ? where pname = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, products.getPname());
			pstmt.setString(2, products.getCode());
			pstmt.setString(3, products.getManufacturer());
			pstmt.setInt(4, products.getPrice());
			pstmt.setInt(5, products.getStock());
			pstmt.setString(6, products.getImgname());
			pstmt.setString(7, products.getProducttype());
			pstmt.setString(8, products.getDetailedimagepath());
			pstmt.setString(9, products.getPname());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 모든 유저 List 구해옴
	public List<Users> getAllUserList(){
		String sql = "Select * FROM users";
		List<Users> AllUsersList = new ArrayList<Users>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()){
				Users users = new Users();
				users.setId(rs.getString(1));
				users.setPw(rs.getString(2));
				users.setZip(rs.getString(3));
				users.setStreet(rs.getString(4));
				users.setBuilding(rs.getString(5));
				users.setMobile(rs.getString(6));
				users.setAuthority(rs.getInt(7));
				users.setBirthday(rs.getString(8));
				users.setAdmin(rs.getInt(9));
				users.setName(rs.getString(10));
				AllUsersList.add(users);
			}return AllUsersList;
		} catch (Exception e) {
			e.printStackTrace();
		}return null;
	}
}