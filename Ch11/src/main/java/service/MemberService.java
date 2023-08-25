package service;

import java.util.List;

import dao.MemberDAO;
import dto.MemberDTO;

public enum MemberService {
	
	INSTANSE;
	
	/* enum으로 받은다음 그냥 INSTANSE;로 선언해주면 싱글톤이 된다네
	public static MemberService instanse = new MemberService();
	public static MemberService getInstanse() {
		return instanse;
	}
	private MemberService() {}
	*/
	
	private MemberDAO dao = MemberDAO.getInstance();
	
	
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}
	
	public MemberDTO selectMember(String uid) {
		return dao.selectMember(uid);
	}
	
	public List<MemberDTO> selectMembers() {
		return dao.selectMembers();
	} 
	
	public int updateMember(MemberDTO dto) {
		return dao.updateMember(dto);
	} 
	
	public void deleteMember() {
		dao.deleteMember();
	} 
}
