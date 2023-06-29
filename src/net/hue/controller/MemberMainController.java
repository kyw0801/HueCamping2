package net.hue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMainController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/index.jsp");
		return forward;
	}

}
