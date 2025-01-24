package com.cookit.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		HttpSession session;
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		//mav.setViewName("/main/main");
		mav.setViewName(viewName);
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		List<ProductVO> productList= productService.listAllProduct();
		mav.addObject("productList", productList);
		System.out.println("viewName : "+ viewName);
		return mav;
	}
	
}
