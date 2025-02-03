package com.cookit.product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.product.service.ProductService;
import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;

@Controller
@RequestMapping("/product")
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/detailProduct.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView detailProduct(@RequestParam("product_id") int product_id,
			                 HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ProductVO productVO = new ProductVO();
		ProductInformVO productInformVO = new ProductInformVO();
		ModelAndView mav = new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		System.out.println("viewName : "+ viewName);
		productVO = productService.detailProduct(product_id);
		productInformVO = productService.productInform(product_id);
		productInformVO.setProduct_name(productVO.getProduct_name());
		List <ProductVO> relationProduct = productService.relationProduct(product_id);
		mav.setViewName(viewName);
		mav.addObject("product", productVO);
		mav.addObject("relationProduct", relationProduct);
		mav.addObject("productInform", productInformVO);
		return mav;
	}
	
	@RequestMapping(value="/productCategory.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productCategory(@RequestParam("category_id") int category_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductVO productVO = new ProductVO();
		ModelAndView mav = new ModelAndView();
		List <ProductVO> productList = new ArrayList<ProductVO>();
		String viewName=(String)request.getAttribute("viewName");
		System.out.println("viewName : "+ viewName);
		System.out.println(category_id);
		if(category_id == 0) {
			productList = productService.listAllProduct();
		}
		else if(category_id == 2) {
			productList = productService.twoProductCategory();
		}
		else {
			productList = productService.normalProductCategory(category_id);
		}
		mav.setViewName(viewName);
		mav.addObject("productList", productList);
		return mav;
	}
	
	@RequestMapping(value="/searchProduct.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord,
		   HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductVO productVO = new ProductVO();
		System.out.println(searchWord);
		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = new ArrayList<ProductVO>();
		if(!searchWord.equals("")) {
			productList = productService.searchProduct(searchWord);
		}
		String viewName=(String)request.getAttribute("viewName");
		System.out.println("viewName : "+ viewName);
		mav.setViewName(viewName);
		mav.addObject("searchWord", searchWord);
		mav.addObject("productList", productList);
		return mav;
	}
}
