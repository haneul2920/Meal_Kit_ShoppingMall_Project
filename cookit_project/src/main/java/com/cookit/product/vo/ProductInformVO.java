package com.cookit.product.vo;

import org.springframework.stereotype.Component;

//import java.sql.Date;
//import java.util.ArrayList;

@Component("productInformVO")
public class ProductInformVO {
	private String product_name;
	private String product_ex_date;
	private String ingredient_info;
	private String GMO_status;
	private String nutrition_facts;
	private String producer;
	private String product_addr;
	private String product_weight;
	private String delivery_area;
	private String delivery_method;
	private String import_notice;
	private String special_category;
	private String customer_service;
	private String warnings;
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getProduct_ex_date() {
		return product_ex_date;
	}
	public void setProduct_ex_date(String product_ex_date) {
		this.product_ex_date = product_ex_date;
	}
	public String getIngredient_info() {
		return ingredient_info;
	}
	public void setIngredient_info(String ingredient_info) {
		this.ingredient_info = ingredient_info;
	}
	public String getGMO_status() {
		return GMO_status;
	}
	public void setGMO_status(String gMO_status) {
		GMO_status = gMO_status;
	}
	public String getNutrition_facts() {
		return nutrition_facts;
	}
	public void setNutrition_facts(String nutrition_facts) {
		this.nutrition_facts = nutrition_facts;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getProduct_addr() {
		return product_addr;
	}
	public void setProduct_addr(String product_addr) {
		this.product_addr = product_addr;
	}
	public String getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}
	public String getDelivery_area() {
		return delivery_area;
	}
	public void setDelivery_area(String delivery_area) {
		this.delivery_area = delivery_area;
	}
	public String getDelivery_method() {
		return delivery_method;
	}
	public void setDelivery_method(String delivery_method) {
		this.delivery_method = delivery_method;
	}
	public String getImport_notice() {
		return import_notice;
	}
	public void setImport_notice(String import_notice) {
		this.import_notice = import_notice;
	}
	public String getSpecial_category() {
		return special_category;
	}
	public void setSpecial_category(String special_category) {
		this.special_category = special_category;
	}
	public String getCustomer_service() {
		return customer_service;
	}
	public void setCustomer_service(String cusomer_service) {
		this.customer_service = cusomer_service;
	}
	public String getWarnings() {
		return warnings;
	}
	public void setWarnings(String warnings) {
		this.warnings = warnings;
	}
	
	
	
	
}
