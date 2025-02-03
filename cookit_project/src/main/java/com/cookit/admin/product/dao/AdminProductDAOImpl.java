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


//import com.bookshop01.order.vo.OrderVO;

@Repository("AdminProductDAO")
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
	public Integer findCategory(String category_name) throws DataAccessException {
	    if (category_name == null || category_name.trim().isEmpty()) {
	        throw new IllegalArgumentException("Category name cannot be null or empty");
	    }

	    Integer category_id = sqlSession.selectOne("mapper.admin_product.findCategory", category_name);

	    if (category_id == null) {
	        throw new NullPointerException("No category found for name: " + category_name);
	    }

	    return category_id;
	}
	
	@Override
	public void insertInform(ProductInformVO productInformVO) throws DataAccessException{
		sqlSession.insert("mapper.admin_product.insertInform", productInformVO);
	}
	

	public List<ProductVO> selectAllProductList() throws DataAccessException {
		List<ProductVO> productList=sqlSession.selectList("mapper.admin_product.selectAllProductList");
	   return productList;	
     
	}
//	@Override
//	public List<ProductVO> selectAllProductList() throws DataAccessException {
//		List<ProductVO> productList=(ArrayList)sqlSession.selectList("mapper.product.selectAllProductList");
//	   return productList;	
//     
//	}
//	@Override
//	public void insertProductImageFile(List fileList)  throws DataAccessException {
//		for(int i=0; i<fileList.size();i++){
//			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
//			sqlSession.insert("mapper.product.insertProductImageFile",imageFileVO);
//		}
//	}
//		
//	@Override
//	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException {
//		ArrayList<GoodsVO>  goodsList=(ArrayList)sqlSession.selectList("mapper.admin.goods.selectNewGoodsList",condMap);
//		return goodsList;
//	}
//	
//	@Override
//	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException{
//		GoodsVO goodsBean = new GoodsVO();
//		goodsBean=(GoodsVO)sqlSession.selectOne("mapper.admin.goods.selectGoodsDetail",goods_id);
//		return goodsBean;
//	}
//	
//	@Override
//	public List selectGoodsImageFileList(int goods_id) throws DataAccessException {
//		List imageList=new ArrayList();
//		imageList=(List)sqlSession.selectList("mapper.admin.goods.selectGoodsImageFileList",goods_id);
//		return imageList;
//	}
//	
//	@Override
//	public void updateGoodsInfo(Map goodsMap) throws DataAccessException{
//		sqlSession.update("mapper.admin.goods.updateGoodsInfo",goodsMap);
//	}
//	
//	@Override
//	public void deleteGoodsImage(int image_id) throws DataAccessException{
//		sqlSession.delete("mapper.admin.goods.deleteGoodsImage",image_id);
//	}
//	
//	@Override
//	public void deleteGoodsImage(List fileList) throws DataAccessException{
//		int image_id;
//		for(int i=0; i<fileList.size();i++){
//			ImageFileVO bean=(ImageFileVO) fileList.get(i);
//			image_id=bean.getImage_id();
//			sqlSession.delete("mapper.admin.goods.deleteGoodsImage",image_id);	
//		}
//	}
//
//	@Override
//	public List<OrderVO> selectOrderGoodsList(Map condMap) throws DataAccessException{
//		List<OrderVO>  orderGoodsList=(ArrayList)sqlSession.selectList("mapper.admin.selectOrderGoodsList",condMap);
//		return orderGoodsList;
//	}	
//	
//	@Override
//	public void updateOrderGoods(Map orderMap) throws DataAccessException{
//		sqlSession.update("mapper.admin.goods.updateOrderGoods",orderMap);
//		
//	}
//
//	@Override
//	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException {
//		
//		for(int i=0; i<imageFileList.size();i++){
//			ImageFileVO imageFileVO = imageFileList.get(i);
//			sqlSession.update("mapper.admin.goods.updateGoodsImage",imageFileVO);	
//		}
//		
//	}





	

}