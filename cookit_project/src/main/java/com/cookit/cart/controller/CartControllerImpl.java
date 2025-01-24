package com.cookit.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/*import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;*/
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.mypage.service.MyPageService;
import com.cookit.mypage.vo.MyPageVO;

@Controller
@RequestMapping(value="/cart")
public class CartControllerImpl{
	
	@RequestMapping(value= "/myCartList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mainCart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();		
		mav.setViewName(viewName);
		System.out.println("viewName : "+ viewName);
		return mav;
	}
}
