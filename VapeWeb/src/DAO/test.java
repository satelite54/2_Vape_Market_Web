package DAO;

public class test {

}


//페이지네이션 10개식 끊어서 보여주는 메소드
	public boolean reviewNextPage(int pageNumber) {
		String SQL = "SELECT * FROM Review WHERE RNum < ? and Authority = 1 ORDER BY RNum DESC LIMIT 10";
		ArrayList<Review> list = new ArrayList<Review>();
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
	public int reviewGetNext() {
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
	public String reviewGetDate() {
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
			pstmt.setString(4, reviewGetDate());
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
	public ArrayList<Review> reviewGetList(){
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
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, RNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Review review = new Review();
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
		return null;
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
	