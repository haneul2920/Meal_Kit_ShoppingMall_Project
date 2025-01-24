package com.cookit.product.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {
	private int product_id; //
	private String product_name; //
	private int price; //
	private int product_amount; //
	private int category_id;
	private String product_inf_image;
	private String product_image;
	private String reg_id;
	private String post_date;
	
	
	
	
	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}



	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}



	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}



	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}



	public String getProduct_inf_image() {
		return product_inf_image;
	}

	public void setProduct_inf_image(String product_inf_image) {
		this.product_inf_image = product_inf_image;
	}



	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}



	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

}
