package com.cookit.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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

import com.cookit.common.base.BaseController;
import com.cookit.product.service.ProductService;
import com.cookit.product.vo.ImageFileVO;
import com.cookit.product.vo.ProductVO;
import com.cookit.user.vo.UserVO;

@Controller
@RequestMapping("/product")
public class ProductControllerImpl extends BaseController implements ProductController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\cookit\\file_repo";
	@Autowired
	private ProductService productService;

	// ��ǰ ���â ������ ����
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
	
	// ���â���� �޾ƿ� ���
	@Override
	@RequestMapping(value="/insertProduct.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity insertProduct(@ModelAttribute("product_inform") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map newProductMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement(); // <input>�� name �Ӽ� ��
			String value=multipartRequest.getParameter(name); // null ������ ��ü�� ����
			newProductMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user_id");
		String reg_id = userVO.getUser_id();
		List<ImageFileVO> imageFileList =upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
			}
			newProductMap.put("imageFileList", imageFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int product_id = productService.addNewProduct(newProductMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+product_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('상품이 등록되었습니다..');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/product/goForm.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			
			message= "<script>";
			message += " alert('상품 등록에 실패했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/product/goForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}