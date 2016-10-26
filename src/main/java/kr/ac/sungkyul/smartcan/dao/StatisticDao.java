package kr.ac.sungkyul.smartcan.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

/*
2016-09-20
 작업자 : 최솔빈
 개발 상황 : 완료
*/

@Repository
public class StatisticDao {
	
	private Connection getConnection() throws SQLException {

		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "smart", "smart");
		} catch (ClassNotFoundException e) {
			System.out.println("error : " + e);
		}
		return conn;
	}
	
	// 안양 쓰레기양 반환
	public Long getAnyang(){
		Long anyang = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = getConnection();
			
			String sql = "select sum(amount) from (select a.amount, b.name, b.region_no from DAILYSTATISTIC a, point b where a.point_no = b.no) c where c.region_no = 2";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				anyang = rs.getLong(1);
			}
		
		}catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			try {
				if(rs != null){
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error : " + e);
			}
		}
		return anyang;
	}
	// 인천 쓰레기양 반환
	public Long getIncheon(){
		Long incheon = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			conn = getConnection();
			
			String sql = "select sum(amount) from (select a.amount, b.name, b.region_no from DAILYSTATISTIC a, point b where a.point_no = b.no) c where c.region_no = 3";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				incheon = rs.getLong(1);
			}
		
		}catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			try {
				if(rs != null){
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error : " + e);
			}
		}
		return incheon;
		
	}
	// 서울 쓰레기양 반환
	public Long getSeoul(){
		Long seoul = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			String sql = "select sum(amount) from (select a.amount, b.name, b.region_no from DAILYSTATISTIC a, point b where a.point_no = b.no) c where c.region_no = 1";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				seoul = rs.getLong(1);
			}
		
		}catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			try {
				if(rs != null){
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error : " + e);
			}
		}
		return seoul;
	}
	// 안양 쓰레기통 설치 수 반환
	public Long getAnyangCount(){
		Long anyangCount = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			conn = getConnection();
			
			String sql = "select count(*) from (select * from point) a where a.region_no = 2";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				anyangCount = rs.getLong(1);
			}
		
		}catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			try {
				if(rs != null){
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error : " + e);
			}
		}
		return anyangCount;
	}
	// 인천 쓰레기통 설치 수 반환
	public Long getIncheonCount(){
		Long incheonCount = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			conn = getConnection();
			
			String sql = "select count(*) from (select * from point) a where a.region_no =3";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				incheonCount = rs.getLong(1);
			}
		
		}catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			try {
				if(rs != null){
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error : " + e);
			}
		}
		return incheonCount;
	}
	
	// 서울 쓰레기통 설치 수 반환
	public Long getSeoulCount(){
		Long seoulCount = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			conn = getConnection();
			
			String sql = "select count(*) from (select * from point) a where a.region_no = 1";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				seoulCount = rs.getLong(1);
			}
		
		}catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			try {
				if(rs != null){
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error : " + e);
			}
		}
		return seoulCount;
	}
}
