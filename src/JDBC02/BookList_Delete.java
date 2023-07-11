package JDBC02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class BookList_Delete {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			// 삭제할 booknum 을 입력 받아서 해당 도서를 삭제하세요
			
			Scanner sc = new Scanner(System.in);
			System.out.print("삭제할 도서번호를 선택하세요: ");
			String num = sc.nextLine();
			String sql = "delete from booklist where booknum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			int result = pstmt.executeUpdate();
			
			if(result == 1)System.out.println("삭제 성공 ~");
			else	System.out.println("삭제 실패 ㅠ");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try { 
			if(con != null) con.close();	
			if(pstmt != null) pstmt.close();
		}catch (SQLException e) { e.printStackTrace();	}

	}

}
