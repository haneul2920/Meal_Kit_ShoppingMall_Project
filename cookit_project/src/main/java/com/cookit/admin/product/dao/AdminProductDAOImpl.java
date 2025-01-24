package com.cookit.admin.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;


@Repository("adminProductDAO")
public class AdminProductDAOImpl  implements AdminProductDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertProduct(ProductVO productVO) throws DataAccessException {
		sqlSession.insert("mapper.admin_product.insertProduct",productVO);
		String product_name = productVO.getProduct_name();
		int product_id = sqlSession.selectOne("mapper.admin_product.selectProductId", product_name);
		return product_id;
	}
	
	@Override
	public void insertInform(ProductInformVO productInformVO) throws DataAccessException{
		sqlSession.insert("mapper.admin_product.insertInform", productInformVO);
	}
	
	@Override
	public List<ProductVO> selectAllProductList() throws DataAccessException {
		List<ProductVO> productList=(ArrayList)sqlSession.selectList("mapper.admin_product.selectAllProductList");
	   return productList;	
     
	}
	
	@Override
	public int findCategory(String category_name) throws DataAccessException {
		System.out.println(category_name);
		int category_id =sqlSession.selectOne("mapper.admin_product.findCategory", category_name);
		System.out.println(category_id);
		return category_id;
	}

	
	
}
