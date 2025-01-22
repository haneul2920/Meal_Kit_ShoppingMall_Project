package com.cookit.product.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cookit.product.dao.ProductDAO;
import com.cookit.product.vo.ImageFileVO;

//import com.cookit.admin.goods.dao.AdminGoodsDAO;
//import com.bookshop01.goods.vo.GoodsVO;
//import com.bookshop01.goods.vo.ImageFileVO;
//import com.bookshop01.order.vo.OrderVO;


@Service("ProductService")
@Transactional(propagation=Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int addNewProduct(Map newProductMap) throws Exception{
		int product_id = productDAO.insertProduct(newProductMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList)newProductMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setProduct_id(product_id);
		}
		productDAO.insertProductImageFile(imageFileList);
		return product_id;
	}
//	
//	@Override
//	public List<GoodsVO> listNewGoods(Map condMap) throws Exception{
//		return adminGoodsDAO.selectNewGoodsList(condMap);
//	}
//	@Override
//	public Map goodsDetail(int goods_id) throws Exception {
//		Map goodsMap = new HashMap();
//		GoodsVO goodsVO=adminGoodsDAO.selectGoodsDetail(goods_id);
//		List imageFileList =adminGoodsDAO.selectGoodsImageFileList(goods_id);
//		goodsMap.put("goods", goodsVO);
//		goodsMap.put("imageFileList", imageFileList);
//		return goodsMap;
//	}
//	@Override
//	public List goodsImageFile(int goods_id) throws Exception{
//		List imageList =adminGoodsDAO.selectGoodsImageFileList(goods_id);
//		return imageList;
//	}
//	
//	@Override
//	public void modifyGoodsInfo(Map goodsMap) throws Exception{
//		adminGoodsDAO.updateGoodsInfo(goodsMap);
//		
//	}	
//	@Override
//	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception{
//		adminGoodsDAO.updateGoodsImage(imageFileList); 
//	}
//	
//	@Override
//	public List<OrderVO> listOrderGoods(Map condMap) throws Exception{
//		return adminGoodsDAO.selectOrderGoodsList(condMap);
//	}
//	@Override
//	public void modifyOrderGoods(Map orderMap) throws Exception{
//		adminGoodsDAO.updateOrderGoods(orderMap);
//	}
//	
//	@Override
//	public void removeGoodsImage(int image_id) throws Exception{
//		adminGoodsDAO.deleteGoodsImage(image_id);
//	}
//	
//	@Override
//	public void addNewGoodsImage(List imageFileList) throws Exception{
//		adminGoodsDAO.insertGoodsImageFile(imageFileList);
//	}
//	

	
}
