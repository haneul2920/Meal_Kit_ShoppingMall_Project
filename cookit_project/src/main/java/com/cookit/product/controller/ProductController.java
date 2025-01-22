package com.cookit.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.product.vo.ProductVO;


public interface ProductController {
//	public ModelAndView productDetail(@RequestParam("product_id") String goods_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goForm(HttpServletRequest reuest, HttpServletResponse response) throws Exception;
	public ResponseEntity insertProduct(@ModelAttribute("product_inform") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
