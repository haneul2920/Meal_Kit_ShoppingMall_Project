package com.cookit.cart.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.cart.service.CartService;
import com.cookit.cart.vo.CartVO;
import com.cookit.common.base.BaseController;
import com.cookit.user.vo.UserVO;



@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private UserVO userVO;
	

	
	@RequestMapping(value="/myCartList.do" ,method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("userInfo");
		String User_id=userVO.getUser_id();
		cartVO.setUser_id(User_id);
		Map<String ,List> cartMap=cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);//장바구니 목록 화면에서 상품 주문 시 사용하기 위해서 장바구니 목록을 세션에 저장한다.
		//mav.addObject("cartMap", cartMap);
		return mav;
	}

	
	@RequestMapping(value="/addPRoductInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public  @ResponseBody String addProductInCart(@RequestParam("product_id") int product_id,
			                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		userVO=(UserVO)session.getAttribute("userInfo");
		String user_id=userVO.getUser_id();
		
		cartVO.setUser_id(user_id);
		//카트 등록전에 이미 등록된 제품인지 판별한다.
		cartVO.setProduct_id(product_id);
		cartVO.setUser_id(user_id);
		boolean isAreadyExisted=cartService.findCartProduct(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
	}
	@Override
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("product_id") int product_id,
			                                   @RequestParam("cart_product_qty") int cart_product_qty,
			                                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		userVO=(UserVO)session.getAttribute("userInfo");
		String user_id=userVO.getUser_id();
		cartVO.setProduct_id(product_id);
		cartVO.setUser_id(user_id);
		cartVO.setCart_product_qty(cart_product_qty);
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true){
		   return "modify_success";
		}else{
			  return "modify_failed";	
		}
		
	}
	@Override
	@RequestMapping(value="/removeCartProduct.do" ,method = RequestMethod.POST)
	public ModelAndView removeCartProduct(@RequestParam("cart_id") int cart_id,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		cartService.removeCartProduct(cart_id);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}


}
