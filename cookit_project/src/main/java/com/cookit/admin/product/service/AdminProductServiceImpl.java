package com.cookit.admin.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cookit.admin.product.dao.AdminProductDAO;
import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;


@Service("adminProductService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductDAO adminProductDAO;
	
	@Override
	public int addNewProduct(ProductVO productVO) throws Exception{
		int product_id = adminProductDAO.insertProduct(productVO);
		return product_id;
	}
	
	@Override
	public void insertInform(ProductInformVO productInformVO) throws Exception{
		adminProductDAO.insertInform(productInformVO);
	}
	
	@Override
	public List<ProductVO> listAllProduct() throws Exception {
		List<ProductVO> productList=adminProductDAO.selectAllProductList();
		return productList;
	}

	@Override
	public int findCategoryId(String category_name) throws Exception {
		int category_id = adminProductDAO.findCategory(category_name);
		return category_id;
	}
	
	
	
	

	
}
