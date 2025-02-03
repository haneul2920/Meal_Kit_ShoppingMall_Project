package com.cookit.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


public interface ProductController {
	public ModelAndView detailProduct(@RequestParam("product_id") int product_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView productCategory(@RequestParam("category_id") int category_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView insertProduct(HttpServletRequest reuest, HttpServletResponse response) throws Exception;
}
