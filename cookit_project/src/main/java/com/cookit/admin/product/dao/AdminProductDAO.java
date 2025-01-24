package com.cookit.admin.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;


public interface AdminProductDAO {
	public void insertInform(ProductInformVO productInformVO) throws DataAccessException;
	public int insertProduct(ProductVO productVO) throws DataAccessException;
	public List<ProductVO> selectAllProductList() throws DataAccessException;
	public int findCategory(String category_name) throws DataAccessException;
	
}
