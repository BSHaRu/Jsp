package dao;

import java.util.*;
import dto.*;
import java.sql.*;
import util.*;

public class OrderDAO extends DBCP{

	// 주문 성공 때 DB 저장
	public void insertOrder(OrderDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_ORDER);
			psmt.setInt(1, dto.getOrderProduct());
			psmt.setInt(2, dto.getOrderCount());
			psmt.setInt(3, dto.getOrderDelivery());
			psmt.setInt(4, dto.getOrderPrice());
			psmt.setInt(5, dto.getOrderTotal());
			psmt.setString(6, dto.getReceiver());
			psmt.setString(7, dto.getHp());
			psmt.setString(8, dto.getZip());
			psmt.setString(9, dto.getAddr1());
			psmt.setString(10, dto.getAddr2());
			psmt.setString(11, dto.getOrderEtc());
			psmt.setString(12, dto.getOrderUser());
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertOrder : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	
	public OrderDTO selectOrder(int orderNo) {
		OrderDTO dto = null;
		
		return dto;
	}
	
	// 주문 목록 & PM 
	public List<OrderDTO> selectOrders(int start, int pageCount) {
		List<OrderDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.ORDER_LIST);
			psmt.setInt(1, start);
			psmt.setInt(2, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto = getOrder(rs);
				dto.setpName(rs.getString("pName"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, psmt, conn);
		}
		return list;
	}
	
	// 주문 목록 전체 조회
	public int selectOrderCount() {
		int total = 0;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_ORDER_COUNT);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rs, psmt, conn);
		}
		return total;
	}
	
	public void updateOrder(OrderDTO dto) {
		
	}
	
	// 주문 목록 삭제
	public void deleteOrder(int orderNo) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.DELETE_ORDER);
			psmt.setInt(1, orderNo);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt, conn);
		}
	}
	
	// Order rs
	public OrderDTO getOrder(ResultSet rs) {
		OrderDTO dto = null;
		try {
			dto = new OrderDTO();
			dto.setOrderNo(rs.getInt(1));
			dto.setOrderProduct(rs.getInt(2));
			dto.setOrderCount(rs.getInt(3));
			dto.setOrderDelivery(rs.getInt(4));
			dto.setOrderPrice(rs.getInt(5));
			dto.setOrderTotal(rs.getInt(6));
			dto.setReceiver(rs.getString(7));
			dto.setHp(rs.getString(8));
			dto.setZip(rs.getString(9));
			dto.setAddr1(rs.getString(10));
			dto.setAddr2(rs.getString(11));
			dto.setOrderEtc(rs.getString(12));
			dto.setOrderUser(rs.getString(13));
			dto.setOrderDate(rs.getDate(14));
		}catch (Exception e) {}
		return dto;
	}
}
