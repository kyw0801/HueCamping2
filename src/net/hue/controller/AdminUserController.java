package net.hue.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hue.bean.MemberBean;
import net.hue.dao.MemberDao;

public class AdminUserController implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDao mdao = MemberDao.getInstance();
		ArrayList<MemberBean> list = mdao.allMember();
		
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/userManage/userList.jsp");
		return forward;
	}

}
