package dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.TermsDTO;
import util.DBCP;
import util.SQL;

public class TermsDAO extends DBCP{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public TermsDTO selectTerms() {
		TermsDTO dto = null;
		conn = getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()) {
				dto = new TermsDTO();
				dto.setTerms(rs.getString(1));
				dto.setPrivacy(rs.getString(2));
			}
		}catch (Exception e) {
			logger.error("seletTerms : " + e.getMessage());
		}finally {
			close(rs, stmt, conn);
		}
		return dto;
	}
}
