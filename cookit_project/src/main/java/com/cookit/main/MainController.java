package com.cookit.main;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.common.base.BaseController;
import com.cookit.product.service.ProductService;
import com.cookit.product.vo.ProductVO;

@Controller("mainController")
public class MainController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Random random = new Random();
		String viewName=(String)request.getAttribute("viewName");
		int category_id = random.nextInt(6) + 1;
		List<ProductVO> productList = productService.recommnedProduct(category_id);
		List<ProductVO> newProductList = productService.newProduct();
		ModelAndView mav=new ModelAndView();		
		mav.setViewName(viewName);
		mav.addObject("recommendProduct", productList);
		mav.addObject("newProduct", newProductList);
		System.out.println("viewName : "+ viewName);
		return mav;
	}
}
