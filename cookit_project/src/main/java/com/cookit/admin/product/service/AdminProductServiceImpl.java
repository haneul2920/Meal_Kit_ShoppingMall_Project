package com.cookit.admin.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cookit.admin.prodcut.dao.AdminProductDAO;
import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;

//import com.cookit.product.dao.ProductDAO;
//import com.cookit.product.vo.ProductInformVO;
//import com.cookit.product.vo.ProductVO;

//import com.cookit.admin.product.dao.AdminproductDAO;




@Service("AdminProductService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductDAO productAdiminDAO;
	
	@Override
	public int addNewProduct(ProductVO productVO) throws Exception{
		int product_id = productAdiminDAO.insertProduct(productVO);
		return product_id;
	}
	
	@Override
	public int findCategoryId(String category_name) throws Exception{
		int category_id = productAdiminDAO.findCategory(category_name);

		return category_id;
	}
	
	@Override
	public void insertInform(ProductInformVO productInformVO) throws Exception{
		productAdiminDAO.insertInform(productInformVO);
	}
	
//	@Override
//	public List<ProductVO> listAllProduct() throws Exception {
//		List<ProductVO> productList=productDAO.selectAllProductList();
//		return productList;
//	}
	
//	@Override
//	public ProductVO productDetail(int product_id) throws Exception {
//		productVO productVO=adminproductDAO.selectproductDetail(product_id);
//		List imageFileList =adminproductDAO.selectproductImageFileList(product_id);
//		productMap.put("product", productVO);
//		productMap.put("imageFileList", imageFileList);
//		return productMap;
//	}
	
	
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
