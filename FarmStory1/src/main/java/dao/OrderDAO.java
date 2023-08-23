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
	
	public List<OrderDTO> selectOrders() {
		List<OrderDTO> list = new ArrayList<>();
		
		return list;
	}
	
	public void updateOrder(OrderDTO dto) {
		
	}
	
	public void deleteOrder(int orderNo) {
		
	}
	
	
	public OrderDTO getOrder(ResultSet rs) {
		OrderDTO dto = null;
		try {
			dto = new OrderDTO();
			
		}catch (Exception e) {}
		
		return dto;
	}
}
