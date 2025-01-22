package com.cookit.mypage.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.mypage.service.MyPageService;
import com.cookit.mypage.vo.MyPageVO;

@Controller()
@RequestMapping(value="/mypage")
public class MyPageControllerImpl {
	
	@Autowired
    private MyPageService myPageService;
	
	@RequestMapping(value= "/myPageMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();		
		mav.setViewName(viewName);
		System.out.println("viewName : "+ viewName);
		return mav;
	}
	
	  @RequestMapping(value= "/myUpdateInfo.do",method={RequestMethod.POST,RequestMethod.GET})
	  public ModelAndView updateInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName=(String)request.getAttribute("viewName");
	  ModelAndView mav=new ModelAndView(); mav.setViewName(viewName);
	  System.out.println("viewName : "+ viewName); return mav; }
	  
	  @RequestMapping("/myPageMain.do")
	    public ModelAndView myPageMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        HttpSession session = request.getSession();
	        MyPageVO userVO = (MyPageVO) session.getAttribute("user"); 

	        ModelAndView mav = new ModelAndView();
	        if (userVO != null) {
	            int userId = Integer.parseInt(userVO.getUser_id());
	            MyPageVO userInfo = myPageService.getUserInfo(userId); 
	            mav.addObject("user", userInfo);
	        }
	        mav.setViewName("mypage/myPageMain");
	        return mav;
	    }
	  
}
