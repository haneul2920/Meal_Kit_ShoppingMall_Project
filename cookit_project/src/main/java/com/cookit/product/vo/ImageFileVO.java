package com.cookit.product.vo;

public class ImageFileVO {
	private int product_id;
	private int image_id; 
	private String fileName; // 실제 업로드할 때의 파일이름(상품이름)
	private String fileType; // 예) product_image or product_inform
	private String reg_id; // 작성자의 아이디 
	

	public ImageFileVO() {
		super();
	}


	public int getProduct_id() {
		return product_id;
	}




	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}




	public int getImage_id() {
		return image_id;
	}




	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}




	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}


	

}
