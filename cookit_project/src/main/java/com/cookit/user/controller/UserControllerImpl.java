package com.cookit.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.common.base.BaseController;
import com.cookit.user.vo.UserVO;
import com.cookit.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserControllerImpl extends BaseController implements UserController{
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;

	@Override	
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		userVO=userService.login(loginMap);
		if(userVO!= null && userVO.getUser_id()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("userInfo",userVO);
			
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachProduct.do")){
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");	
			}			
		}else{
			String message="���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���";
			mav.addObject("message", message);
			mav.setViewName("/user/loginForm");
		}
		mav.setViewName("/user/loginForm");
		return mav;
	}

	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("userInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addUser.do" ,method = RequestMethod.POST)
	public ResponseEntity addUser(@ModelAttribute("userVO") UserVO _userVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    userService.addUser(_userVO);
		    message  = "<script>";
		    message +=" alert('ȸ�� ������ ���ƽ��ϴ�.�α���â���� �̵��մϴ�.');";
		    message += " location.href='"+request.getContextPath()+"/user/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/user/userForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = userService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	

}
