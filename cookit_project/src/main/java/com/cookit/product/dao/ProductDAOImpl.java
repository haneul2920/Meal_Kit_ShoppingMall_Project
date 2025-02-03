package com.cookit.product.dao;

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

@Repository("ProductDAO")
public class ProductDAOImpl  implements ProductDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectAllProductList() throws DataAccessException {
		List<ProductVO> productList= sqlSession.selectList("mapper.product.selectAllProductList");
	   return productList;	
     
	}
	
	@Override
	public ProductVO selectProductDetail(int product_id) throws DataAccessException{
		ProductVO productVO = new ProductVO();
		productVO = sqlSession.selectOne("mapper.product.selectProductDetail",product_id);
		return productVO;
	}
	
	@Override
	public List<ProductVO> selectRelationProduct(int product_id) throws DataAccessException {
		List<ProductVO> relationProduct = sqlSession.selectList("mapper.product.selectRelationProduct",product_id);
		return relationProduct;
	};
	
	@Override
	public ProductInformVO selectProductInform(int product_id) throws DataAccessException {
		ProductInformVO productInformVO = new ProductInformVO();
		productInformVO = sqlSession.selectOne("mapper.product.selectProductInform",product_id);
		return productInformVO;
	};
	
	@Override
	public List<ProductVO> selectRecommnedProduct(int category_id) throws DataAccessException {
		List<ProductVO> ProductList = sqlSession.selectList("mapper.product.selectRecommnedProduct",category_id);
		return ProductList;
	};
	
	@Override
	public List<ProductVO> selectNewProduct() throws DataAccessException {
		List<ProductVO> newProductList = sqlSession.selectList("mapper.product.selectNewProduct");
		return newProductList;
	};
	
	@Override
	public List<ProductVO> selectTwoProductCategory() throws DataAccessException{
		List<ProductVO> ProductList = sqlSession.selectList("mapper.product.selectTwoProductCategory");
		return ProductList;
	};
	
	@Override
	public List<ProductVO> selectNormalProductCategory(int category_id) throws DataAccessException{
		List<ProductVO> ProductList = sqlSession.selectList("mapper.product.selectNormalProductCategory",category_id);
		return ProductList;
	};
	
	@Override
	public List<ProductVO> selectSearchProduct(String searchWord) throws DataAccessException {
		List<ProductVO> ProductList = sqlSession.selectList("mapper.product.selectSearchProduct",searchWord);
		return ProductList;
	};
	
	
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