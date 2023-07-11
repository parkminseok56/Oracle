package JDBC02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookList_Select {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			String sql = "select * from booklist order by booknum desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			System.out.println("도서번호\t출판년도\t입고가격\t대여가격\t등급\t제목");
			System.out.println("-----------------------------------------------------------");
			while( rs.next() ) {
				int booknum = rs.getInt("booknum");
				String subject = rs.getString("subject");
				int makeyear = rs.getInt("makeyear");
				int inprice = rs.getInt("inprice");
				int rentprice = rs.getInt("rentprice");
				String grade = rs.getString("grade");
				System.out.printf("%8d\t%d \t%d\t%d \t%s\t%s\n", 
						booknum, makeyear, inprice, rentprice, grade, subject);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try { 
			if(con != null) con.close();	
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch (SQLException e) { e.printStackTrace();	}

	}

}
