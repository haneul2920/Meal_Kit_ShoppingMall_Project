package com.cookit.admin.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cookit.admin.product.service.AdminProductService;
import com.cookit.common.base.BaseController;
import com.cookit.product.vo.CategoryVO;
import com.cookit.product.vo.ProductInformVO;
import com.cookit.product.vo.ProductVO;
import com.cookit.user.vo.UserVO;


@Controller
@RequestMapping("/admin")
public class AdminProductControllerImpl extends BaseController implements AdminProductController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\cookitMall\\file_repo";
	@Autowired
	private AdminProductService adminProductService;

	// ��ǰ ���� �Է��������� ����
	@Override
	@RequestMapping(value="/goForm.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goForm(
			                 HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("viewName : "+ viewName);
		return mav;
	}
	
	// �Էµ� �����͸� db�� �Է��ϵ��� ����
	@Override
	@RequestMapping(value="/insertProduct.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity insertProduct( @ModelAttribute("productVO") ProductVO productVO, @ModelAttribute("productInformVO") ProductInformVO productInformVO,
	         MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		System.out.println(productVO.getPrice());
		System.out.println(productVO.getProduct_name());
		System.out.println(productVO.getProduct_amount());

		String imageFileName=null;
		
		Map newProductMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement(); // <input>�� name �Ӽ� ��
			String value=multipartRequest.getParameter(name); // null ������ ��ü�� ����
			newProductMap.put(name,value);
		}
		
		// HttpSession session = multipartRequest.getSession();
		String reg_id = request.getParameter("user_id"); 
		String category_name = request.getParameter("product_category"); 
		int category_id = adminProductService.findCategoryId(category_name);
		ProductVO imageFileList =upload(multipartRequest); // �̹���, �̹��� ���� ���� ���� �̸� ����Ʈ
		String imageName = imageFileList.getProduct_image();
		String imageInform = imageFileList.getProduct_inf_image();
		System.out.println(imageName);
		System.out.println(imageInform);
		
		productVO.setCategory_id(category_id);
 		productVO.setProduct_inf_image(imageInform);
  		productVO.setProduct_image(imageName);
		productVO.setReg_id(reg_id);
		int product_id = adminProductService.addNewProduct(productVO);
		productInformVO.setProduct_name(productVO.getProduct_name());
		adminProductService.insertInform(productInformVO);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			if(imageFileList!=null) {
				
				File srcFile1 = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageName);
				File destDir1 = new File(CURR_IMAGE_REPO_PATH+"\\"+product_id);
				FileUtils.moveFileToDirectory(srcFile1, destDir1,true);
	
				File srcFile2 = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageInform);
				File destDir2 = new File(CURR_IMAGE_REPO_PATH+"\\"+product_id);
				FileUtils.moveFileToDirectory(srcFile2, destDir2,true);
			}
			message= "<script>";
			message += " alert('상품이 등록되었습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/goForm.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null) {
				File srcFile1 = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageName);
				File srcFile2 = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageInform);
				srcFile1.delete();
				srcFile2.delete();				
			}
			
			message= "<script>";
			message += " alert('오류가 발생했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/goForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}