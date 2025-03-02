package com.cookit.cart.vo;
import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private int cart_id;
	private String user_id;
	private int product_id;
	private int amount;
	private int cart_product_qty;
	
	public CartVO() {
		
	}
	
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCart_product_qty() {
		return cart_product_qty;
	}
	public void setCart_product_qty(int cart_product_qty) {
		this.cart_product_qty = cart_product_qty;
	}

}
