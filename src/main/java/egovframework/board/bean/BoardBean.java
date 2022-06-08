package egovframework.board.bean;

import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
	private int no;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
		
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}


	private String title;
	private String contents;
	private String reg_date;
	private String write_id;
	private String fileName;
	private MultipartFile uploadFile;
	
	
}
