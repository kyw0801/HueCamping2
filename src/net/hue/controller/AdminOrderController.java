package net.hue.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hue.bean.OrderBean;
import net.hue.dao.OrderDao;

public class AdminOrderController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		OrderDao odao = OrderDao.getInstance();
		ArrayList<OrderBean> list = odao.getAllOrder();
		
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/orderManage/orderList.jsp");
		return forward;
	}

}
