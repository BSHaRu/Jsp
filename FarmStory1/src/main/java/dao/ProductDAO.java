package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDTO;
import util.*;

public class ProductDAO extends DBCP{

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
	public List<ProductDTO> selectProducts() {
		List<ProductDTO> list = new ArrayList<>();
		
		return list;
	}
	public void updateProduct(ProductDTO dto) {}
	public void deleteProduct(int pNo) {}
}
