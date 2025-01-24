package com.cookit.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cookit.product.vo.ProductVO;
import com.cookit.product.vo.ProductInformVO;


public interface ProductService {
	public int  addNewProduct(ProductVO productVO) throws Exception;
	public int findCategoryId(String category_name) throws Exception;
	public void insertInform(ProductInformVO productInformVO) throws Exception;
	public List<ProductVO> listAllProduct() throws Exception;
	
//	public List<GoodsVO> listNewGoods(Map condMap) throws Exception;
//	public Map goodsDetail(int goods_id) throws Exception;
//	public List goodsImageFile(int goods_id) throws Exception;
//	public void modifyGoodsInfo(Map goodsMap) throws Exception;
//	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;
//	public List<OrderVO> listOrderGoods(Map condMap) throws Exception;
//	public void modifyOrderGoods(Map orderMap) throws Exception;
//	public void removeGoodsImage(int image_id) throws Exception;
//	public void addNewGoodsImage(List imageFileList) throws Exception;
//	
}
