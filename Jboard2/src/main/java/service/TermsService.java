package service;

import dao.TermsDAO;
import dto.TermsDTO;

public class TermsService {

	private TermsDAO dao = new TermsDAO();
	
	public void insertTerms(TermsDTO dto) {
		dao.insertTerms(dto);
	}
	
	public TermsDTO selectTerms() {
		return dao.selectTerms();
	}
	public void updateTerms() {}
	
	public void deleteTerms() {}
}
