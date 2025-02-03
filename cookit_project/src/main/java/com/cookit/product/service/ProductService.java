package com.cookit.product.service;

import java.util.List;

import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;


public interface ProductService {
	public List<ProductVO> listAllProduct() throws Exception;
	public ProductVO detailProduct(int product_id) throws Exception;
	public ProductInformVO productInform(int product_id) throws Exception;
	public List<ProductVO> relationProduct(int product_id) throws Exception;
	public List<ProductVO> recommnedProduct(int category_id) throws Exception;
	public List<ProductVO> newProduct() throws Exception;
	public List<ProductVO> twoProductCategory() throws Exception;
	public List<ProductVO> normalProductCategory(int category_id) throws Exception;
	public List<ProductVO> searchProduct(String searchWord) throws Exception;
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