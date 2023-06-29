package net.hue.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hue.bean.ProductBean;
import net.hue.dao.ProductDao;


public class getProduct_detail_okController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/*
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pbean = pdao.getProduct(pno);
		String fullPath = request.getContextPath() + "/admin/product_images/" + pbean.getMainImgN();
		DecimalFormat decFormat = new DecimalFormat("###,###");
	
		request.setAttribute("pbean", pbean);
		request.setAttribute("fullPath", fullPath);
		request.setAttribute("decFormat", decFormat);
		*/
		
		ActionForward forward=new ActionForward();
		request.setCharacterEncoding("UTF-8");

  	    
		// 안내바 카테고리 불러오기
		ProductDao ipdao = ProductDao.getInstance();
		ProductBean pb = new ProductBean();
		
		int ino = Integer.parseInt(request.getParameter("no"));
		pb.setNo(ino);
		
		ProductBean ipb = ipdao.getProductByLcno(pb);
		
		request.setAttribute("iLcname", ipb.getLcname());
		request.setAttribute("iScname", ipb.getScname());
		forward.setRedirect(false);
		forward.setPath("./member/productDetail.jsp");//로그인 매핑주소로 이동
		return forward;
	}

}
