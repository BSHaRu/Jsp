package service;

import java.util.List;

import dao.UserDAO;
import dto.UserDTO;

public class UserService {
	
	private UserDAO dao = new UserDAO();
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public UserDTO selectUser(String uid) {
		return dao.selectUser(uid);
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
}
