package com.cookit.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cookit.product.dao.ProductDAO;
import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;

//import com.cookit.product.dao.ProductDAO;
//import com.cookit.product.vo.ProductInformVO;
//import com.cookit.product.vo.ProductVO;

//import com.cookit.admin.product.dao.AdminproductDAO;




@Service("ProductService")
@Transactional(propagation=Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> listAllProduct() throws Exception {
		List<ProductVO> productList=productDAO.selectAllProductList();
		return productList;
	}
	
	@Override
	public ProductVO detailProduct(int product_id) throws Exception {
		ProductVO productVO=productDAO.selectProductDetail(product_id);
		return productVO;
	}
	
	@Override
	public List<ProductVO> relationProduct(int product_id) throws Exception {
		List<ProductVO> relationProduct = productDAO.selectRelationProduct(product_id);
		return relationProduct;
		
	};
	
	@Override
	public ProductInformVO productInform(int product_id) throws Exception {
		ProductInformVO productInformVO= productDAO.selectProductInform(product_id);
		return productInformVO;
	};
	
	@Override
	public List<ProductVO> recommnedProduct(int category_id) throws Exception {
		List<ProductVO> productList = productDAO.selectRecommnedProduct(category_id);
		return productList;
	};
	
	@Override
	public List<ProductVO> newProduct() throws Exception {
		List<ProductVO> newProductList = productDAO.selectNewProduct();
		return newProductList;
	};
	
	@Override
	public List<ProductVO> twoProductCategory() throws Exception {
		List<ProductVO> productList = productDAO.selectTwoProductCategory();
		return productList;
	};
	
	@Override
	public List<ProductVO> normalProductCategory(int category_id) throws Exception {
		List<ProductVO> productList = productDAO.selectNormalProductCategory(category_id);
		return productList;
	};
	
	@Override
	public List<ProductVO> searchProduct(String searchWord) throws Exception{
		List<ProductVO> productList = productDAO.selectSearchProduct(searchWord);
		return productList;
	};
//	
//	@Override
//	public List<productVO> listNewproduct(Map condMap) throws Exception{
//		return adminproductDAO.selectNewproductList(condMap);
//	}
//	@Override
//	public Map productDetail(int product_id) throws Exception {
//		Map productMap = new HashMap();
//		productVO productVO=adminproductDAO.selectproductDetail(product_id);
//		List imageFileList =adminproductDAO.selectproductImageFileList(product_id);
//		productMap.put("product", productVO);
//		productMap.put("imageFileList", imageFileList);
//		return productMap;
//	}
//	@Override
//	public List productImageFile(int product_id) throws Exception{
//		List imageList =adminproductDAO.selectproductImageFileList(product_id);
//		return imageList;
//	}
//	
//	@Override
//	public void modifyproductInfo(Map productMap) throws Exception{
//		adminproductDAO.updateproductInfo(productMap);
//		
//	}	
//	@Override
//	public void modifyproductImage(List<ImageFileVO> imageFileList) throws Exception{
//		adminproductDAO.updateproductImage(imageFileList); 
//	}
//	
//	@Override
//	public List<OrderVO> listOrderproduct(Map condMap) throws Exception{
//		return adminproductDAO.selectOrderproductList(condMap);
//	}
//	@Override
//	public void modifyOrderproduct(Map orderMap) throws Exception{
//		adminproductDAO.updateOrderproduct(orderMap);
//	}
//	
//	@Override
//	public void removeproductImage(int image_id) throws Exception{
//		adminproductDAO.deleteproductImage(image_id);
//	}
//	
//	@Override
//	public void addNewproductImage(List imageFileList) throws Exception{
//		adminproductDAO.insertproductImageFile(imageFileList);
//	}
//	

	
}