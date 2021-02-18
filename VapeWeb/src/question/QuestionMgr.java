package question;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QuestionMgr {
	
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/myapp/WebContent/board/fileupload/";
	public static final String ENCTYPE = "utf-8";
	public static int MAXSIZE = 10*1024*1024;

	public QuestionMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Question Insert : ���Ͼ��ε�, contentType, ref�� ������� ��ġ��
	public void insertQuestion(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//////////���Ͼ��ε� ���� ����//////////////
			File dir = new File(SAVEFOLDER);
			if(!dir.exists()) {//������ �������� �ʴ´ٸ�
				//mkdir:���� ������ ������ �����Ұ� 
				//mkdirs:���� ������ ��� ��������
				dir.mkdirs();
			}
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
							new DefaultFileRenamePolicy());
			String filename = null;
			int filesize = 0;
			//��� �Խù��� ���Ͼ��ε带 �ϴ°� �ƴϴ�.
			//����ڰ� ������ ���ε� �ϴ� ���
			if(multi.getFilesystemName("filename")!=null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			//�Խù� contentType : text, html
			String content = multi.getParameter("content");//�Խù� ����
			///�亯�� ���� ref ����/////
			int ref = getMaxNum() + 1;
			con = pool.getConnection();
			sql = "insert tblQuestion(name,content,subject,ref,pos,depth,";
			sql += "regdate,pass,count,ip,filename,filesize)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Question Max Num : ref�� ���忡 �ʿ��� ���
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblQuestion";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
	//Question Total Count : �� �Խù���
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")||keyWord==null) {
				//�˻��� �ƴѰ��
				sql = "select count(*) from tblQuestion";
				pstmt = con.prepareStatement(sql);
			}else {
				//�˻��� ���
				sql = "select count(*) from tblQuestion where " 
				+ keyField +" like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//Question List : �������� ������ ������ ����, �˻� ����.
	//keyField : ���ÿɼ�(name, subject, content)
	//keyWord : �˻���
	//start : ���۹�ȣ, cnt : �� �������� ������ �Խù� ���� 
	public Vector<QuestionBean> getQuestionList(String keyField, 
			String keyWord,int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<QuestionBean> vlist = new Vector<QuestionBean>();
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")||keyWord==null) {
				//�˻��� �ƴѰ��
				sql = "select * from tblQuestion order by ref desc, pos "
						+ "limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, cnt);
			}else {
				//�˻��� ���
				sql = "select * from tblQuestion where " + keyField 
						+" like ? order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QuestionBean bean = new QuestionBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Question Get : �Ѱ��� �Խù�, 13�� �÷� ��� ����
	public QuestionBean getQuestion(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		QuestionBean bean = new QuestionBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblQuestion where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//Count Up : ��ȸ�� ����
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblQuestion set count = count +1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Question Delete : ���ε� ���� ����
	public void deleteQuestion(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			///////���ε� ���� ����////////////////////
			QuestionBean bean = getQuestion(num);
			String filename = bean.getFilename();
			if(filename!=null&&!filename.equals("")) {
				File f = new File(SAVEFOLDER+filename);
				if(f.exists()) {
					UtilMgr.delete(SAVEFOLDER+filename);
				}
			}
			////////////////////////////////////
			con = pool.getConnection();
			sql = "delete from tblQuestion where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Question Update : name, subject, content 3���� ����
	public void updateQuestion(QuestionBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblQuestion set name=?, subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Question Update2 : ���ε� ���� ���� ����
	public void updateQuestion2(MultipartRequest multi) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			int num = Integer.parseInt(multi.getParameter("num"));
			String name = multi.getParameter("name");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String filename = multi.getFilesystemName("filename");
			if(filename!=null&&!filename.equals("")) {
				//���ε� ���ϱ��� ���� : ������ ������ ����
				QuestionBean bean = getQuestion(num);
				String tempfile = bean.getFilename();
				if(tempfile!=null&&!tempfile.equals("")) {
					File f = new File(SAVEFOLDER+tempfile);
					if(f.exists()) {
						UtilMgr.delete(SAVEFOLDER+tempfile);
					}
				}
				int filesize = (int)multi.getFile("filename").length();
				sql = "update tblQuestion set name=?, subject=?, content=?, "
						+ "filename=?, filesize=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, filename);
				pstmt.setInt(5, filesize);
				pstmt.setInt(6, num);
			}else {
				sql = "update tblQuestion set name=?, subject=?, content=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setInt(4, num);
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Question Reply: �亯�� ����
	public void replyQuestion(QuestionBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblQuestion(name,content,subject,ref,pos,depth,regdate,"
					+ "pass,count,ip)values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getSubject());
			///////////////////////////////////
			pstmt.setInt(4, bean.getRef());//���۰� ������ Ref
			pstmt.setInt(5, bean.getPos()+1);//������ pos+1
			pstmt.setInt(6, bean.getDepth()+1);//������ depth+1
			///////////////////////////////////
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Question Reply Up : �亯�� ��ġ�� ���� 
	//�亯�ϰ��ڴ� �Խù��� pos ������ ū ������ 1�� ����
	public void replyUpQuestion(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblQuestion set pos=pos+1 where ref=? and pos>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Post 1000 : ����¡ �� �� ó���� ���� �Խù� 1000�� ����.
	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblQuestion(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public static void main(String[] args) {
		QuestionMgr mgr = new QuestionMgr();
		mgr.post1000();
		System.out.println("����~~");
	}
	
}


















