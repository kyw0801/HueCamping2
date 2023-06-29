<%@page import="net.hue.bean.MemberBean"%>
<%@page import="net.hue.dao.MemberDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_include/top_admin.jsp"%> 
<%--
<%
	request.setCharacterEncoding("UTF-8");
	String searchId = request.getParameter("searchId");
	
	OrderDao odao = OrderDao.getInstance();
	ArrayList<OrderBean> list = null;
	
	if(searchId == null){
		list = odao.getAllOrder(); 
		System.out.println(list.size() + "개1");
	}else{
		list = odao.getAllOrderById(searchId);
		System.out.println(list.size() + "개2");
	}
%>
 --%>
<form name="f" class="OrderList" action="#">
 <table id="ManageSearch">
  <tr>
   <td></td>
   <td></td>
   <td>
    <input class="Managesearcharea" type="text" name="searchId" placeholder="아이디 입력">
    <input class="Managesearchbtn" type="submit" value="검색">
   </td>
  </tr>
 </table>
</form>

<table class="orderManage">
 <caption>
  <strong>회원관리</strong>
 </caption>
 <tr class="ManageMenu">
  <th>번호</th>
  <th>ID</th>
  <th>비밀번호</th>
  <th>이름</th>
  <th>주소</th>
  <th>전화번호</th>
  <th>이메일</th>
  <th>성별</th>
  <th>가입상태</th>
  <th>가입날짜</th>
  <th>탈퇴날짜</th>
 </tr>
	<c:if test="${!empty list}">
	<c:forEach var="m" items="${list}">
	<tr class="product_user_list">
		<td>${m.no}</td>
		<td>${m.id}</td>
		<td>${m.password}</td>
		<td>${m.name}</td>
		<td>(&nbsp;${m.zip}&nbsp;)&nbsp;${m.addr1}&nbsp;${m.addr2}</td>
		<td>${m.mobile1}-${m.mobile2}-${m.mobile3}</td>
		<td>${m.email}</td>
		<td>${m.gender}</td>
		<td>${m.state}</td>
		<td>${m.memdate}</td>
		<td>${m.deldate}</td>
	</tr>
	</c:forEach>
</c:if>
</table>