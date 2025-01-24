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
import org.springframework.ui.Model;
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
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
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
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/user/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
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
	
    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public ModelAndView myPage(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        UserVO userInfo = userService.getUserInfo(userId);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("myPageMain");
        mav.addObject("userInfo", userInfo);
        return mav;
    }
    
    @Override
    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public ModelAndView showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userId = request.getParameter("userId");
        UserVO user = userService.getUserById(userId);
        ModelAndView mav = new ModelAndView("/user/updateForm");
        mav.addObject("user", user);
        return mav;
    }

    @Override
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public void updateUser(@ModelAttribute UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String newPassword = request.getParameter("password2");
        if (newPassword != null && !newPassword.isEmpty()) {
            userVO.setUser_pwd(newPassword);
        }
        userService.updateUser(userVO);

        HttpSession session = request.getSession();
        session.setAttribute("loginUser", userVO);

        System.out.println("Updated Session User: " + session.getAttribute("loginUser"));

        // JavaScript alert â �� �����̷�Ʈ ó��
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().write(
            "<script>" +
            "alert('ȸ�� ������ �����Ǿ����ϴ�.');" +
            "location.href='" + request.getContextPath() + "/main/main.do';" +
            "</script>"
        );
    }
	
}
