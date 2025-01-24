package com.cookit.admin.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;

public interface AdminProductController {
	
	public ModelAndView goForm(HttpServletRequest reuest, HttpServletResponse response) throws Exception;

	public ResponseEntity insertProduct(@ModelAttribute("productVO") ProductVO _productVO, @ModelAttribute("productInformVO") ProductInformVO _productInformVO,
	         MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
