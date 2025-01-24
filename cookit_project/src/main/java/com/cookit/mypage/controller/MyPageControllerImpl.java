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
import com.cookit.user.vo.UserVO;

@Controller

@RequestMapping(value = "/mypage")
public class MyPageControllerImpl {

	@RequestMapping(value = "/myPageMain.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    HttpSession session = request.getSession();
	    UserVO userInfo = (UserVO) session.getAttribute("userInfo"); // 세션에서 사용자 정보 가져오기

	    ModelAndView mav = new ModelAndView();
	    String viewName = (String) request.getAttribute("viewName");
	    mav.setViewName(viewName);

	    if (userInfo != null) {
	        mav.addObject("userInfo", userInfo); // 모델에 사용자 정보 추가
	    }

	    System.out.println("viewName : " + viewName);
	    return mav;
	}

}
 
