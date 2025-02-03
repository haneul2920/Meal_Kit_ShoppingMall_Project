package com.cookit.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cookit.product.vo.ProductVO;
import com.cookit.product.vo.ProductInformVO;


public interface ProductDAO {
	public List<ProductVO> selectAllProductList() throws DataAccessException;
	public ProductVO selectProductDetail(int product_id) throws DataAccessException;
	public ProductInformVO selectProductInform(int product_id) throws DataAccessException;
	public List<ProductVO> selectRelationProduct(int product_id) throws DataAccessException;
	public List<ProductVO> selectRecommnedProduct(int category_id) throws DataAccessException;
	public List<ProductVO> selectNewProduct() throws DataAccessException;
	public List<ProductVO> selectTwoProductCategory() throws DataAccessException;
	public List<ProductVO> selectNormalProductCategory(int category_id) throws DataAccessException;
	public List<ProductVO> selectSearchProduct(String searchWord) throws DataAccessException;
//	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException;
//	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException;
//	public List selectGoodsImageFileList(int goods_id) throws DataAccessException;
//	public void insertProductImageFile(List fileList)  throws DataAccessException;
//	public void updateGoodsInfo(Map goodsMap) throws DataAccessException;
//	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException;
//	public void deleteGoodsImage(int image_id) throws DataAccessException;
//	public void deleteGoodsImage(List fileList) throws DataAccessException;
//	public List<OrderVO> selectOrderGoodsList(Map condMap) throws DataAccessException;
//	public void updateOrderGoods(Map orderMap) throws DataAccessException;
	
}