package service;

import java.util.List;

import dao.UserDAO;
import dto.UserDTO;

public enum UserService {

	INSTANCS;
	
	private UserDAO dao = UserDAO.getInstance();
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	public List<UserDTO> selectUsers() {
		return dao.selectUsers();
	}
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
	public UserDTO selectCookie(String uid) {
		return dao.selectCookie(uid);
	}
	
}
