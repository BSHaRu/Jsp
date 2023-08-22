package dao;

import java.sql.*;
import java.util.*;


import dto.*;
import util.*;

public class ProductDAO extends DBCP{

	// 상품 등록
	public void insertProduct(ProductDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_PRODUCT);
			psmt.setInt(1, dto.getType());
			psmt.setString(2, dto.getpName());
			psmt.setInt(3, dto.getPrice());
			psmt.setInt(4, dto.getDelivery());
			psmt.setInt(5, dto.getStock());
			psmt.setInt(6, dto.getSold());
			psmt.setString(7, dto.getThumb1());
			psmt.setString(8, dto.getThumb2());
			psmt.setString(9, dto.getThumb3());
			psmt.setString(10, dto.getSeller());
			psmt.setString(11, dto.getEtc());
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertProduct : " + e.getMessage());
		}finally{
			close(psmt, conn);
		}
	}
	
	
	public ProductDTO selectProduct(int pNo) {
		
		return null;
	}
	
	// 상품 목록 보기
	public List<ProductDTO> selectProducts(String type, int start, int pageCount) {
		List<ProductDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			// 타입이 0(전체)이거나 null(아무것도 선택 안하고 바로 목록 볼 경우)
			// null 체크부터 해야 이후 연산이 됨
			// 이미 null이면(순서 바뀌면) 비교 연산 x
			// => makert.list에서 null check를 하기 때문에 할 필요 없음 
			if(type.equals("0")) {
				psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS_ALL);
				psmt.setInt(1, start);
				psmt.setInt(2, pageCount);
			}else {
				psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS_TYPE);
				psmt.setString(1, type);
				psmt.setInt(2, start);
				psmt.setInt(3, pageCount);
			}
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto = getProduct(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("selectProducts : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return list;
	}
	
	public void updateProduct(ProductDTO dto) {}
	
	public void deleteProduct(int pNo) {}
	
	// 상품 전체 개수
	public int selectCountProdTotal(String type) {
		int total = 0;
		conn = getConnection();
		try {
			if(type.equals("0")) {
				psmt = conn.prepareStatement(SQL.SELECT_COUNT_PROD_ALL);
			}else {
				psmt = conn.prepareStatement(SQL.SELECT_COUNT_PROD_TYPE);
				psmt.setString(1, type);
			}
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectCountProdTotal : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return total;
	}
	
	
	// prod rs
	public ProductDTO getProduct(ResultSet rs) {
		ProductDTO dto = null;
		try {
			dto = new ProductDTO();
			dto.setpNo(rs.getInt(1));
			dto.setType(rs.getInt(2));
			dto.setpName(rs.getString(3));
			dto.setPrice(rs.getInt(4));
			dto.setDelivery(rs.getInt(5));
			dto.setStock(rs.getInt(6));
			dto.setSold(rs.getInt(7));
			dto.setThumb1(rs.getString(8));
			dto.setThumb2(rs.getString(9));
			dto.setThumb3(rs.getString(10));
			dto.setSeller(rs.getString(11));
			dto.setEtc(rs.getString(12));
			dto.setRegDate(rs.getDate(13));
			
		}catch (Exception e) {}
		
		return dto;
	}
	
}
