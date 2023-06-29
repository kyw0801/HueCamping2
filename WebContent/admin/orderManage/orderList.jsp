<%@page import="java.text.DecimalFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<form name="f" class="OrderList" action="orderList.jsp">
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
  <strong>주문접수내역</strong>
 </caption>
 <tr class="ManageMenu">
  <th>번호</th>
  <th>주문자ID</th>
  <th>상품명</th>
  <th>옵션명</th>
  <th>단가</th>
  <th>수량</th>
  <th>총계</th>
  <th>배송지</th>
  <th>수령자명</th>
  <th>주문시간</th>
  <th>상품이미지</th>
  <th></th>
 </tr>
	<fmt:formatNumber pattern="###,###" value="${yourNumber}" />
	<c:if test="${!empty list}">
	<c:forEach var="o" items="${list}">
	<tr>
		<td>${o.no}</td>
		<td>${o.id}</td>
		<td>${o.name}</td>
		<td>${o.opname}</td>
		<td><fmt:formatNumber pattern="###,###" value="${o.price}"/>원</td>
		<td>${o.qty}</td>
		<td><fmt:formatNumber pattern="###,###" value="${o.qty * o.price}"/>원</td>
		<td>${o.rv_zip} ${o.rv_addr1} ${o.rv_addr2}</td>		
		<td>${o.receiver}</td>
		<td>${o.time}</td>
		<td>
	<c:set var="fullPath" value="/HueCamping/admin/product_images/${o.mainimgn}" />
			<img src="${fullPath}" style="max-width: 70px; max-height=70px;">
		</td>
		<td>
		<c:url var="deleteUrl" value="orderDelete.net">
  <c:param name="pno" value="${o.pno}" />
</c:url>
<a href="${deleteUrl}">삭제</a></td>
	</tr>
	</c:forEach>
</c:if>
</table>