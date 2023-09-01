package service;

import java.util.List;

import dao.FileDAO;
import dto.FileDTO;

public enum FileSerivce{

	INSTANCE;
	
	private FileDAO dao = new FileDAO();
	
	public void insertFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	
	public FileDTO selectFile(int fno) {
		return dao.selectFile(fno);
	}
	
	public List<FileDTO> selectFiles() {
		return dao.selectFiles();
	}
	
	public void updateFile(FileDTO dto) {
		dao.updateFile(dto);
	}
	
	public int deleteFile(int ano) {
		return dao.deleteFile(ano);
	}
	
}
