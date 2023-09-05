package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.FileDAO;
import dto.FileDTO;

public enum FileService {

	INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private FileDAO dao = FileDAO.getInstance();
	
	public void insertFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	public FileDTO selectFile(int fno) {
		return dao.selectFile(fno);
	}
	public List<FileDTO> fileDownload() {
		return dao.fileDownload();
	}
	public void updateFile(FileDTO dto) {
		dao.updateFile(dto);
	}
	public void deleteFile(int fno) {
		dao.deleteFile(fno);
	}
	
}
