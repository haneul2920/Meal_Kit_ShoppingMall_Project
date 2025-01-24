package com.cookit.admin.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;


public interface AdminProductService {
	public int  addNewProduct(ProductVO productVO) throws Exception;
	public void insertInform(ProductInformVO productInformVO) throws Exception;
	public List<ProductVO> listAllProduct() throws Exception;
	public int findCategoryId(String category_name) throws Exception;
	
}
