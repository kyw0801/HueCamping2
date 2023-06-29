<%@page import="java.text.DecimalFormat"%>
<%@page import="net.hue.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.hue.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_include/top_admin.jsp"%> 


<%
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> list = pdao.getAllProduct();
%>

<form name="f" class="ProductList" action="prodList.jsp">
 <table id="ManageSearch">
  <tr>
   <td></td>
   <td></td>
   <td>
    <input class="Managesearcharea" type="text" name="searchId" placeholder="상품명 입력">
    <input class="Managesearchbtn" type="submit" value="검색">
   </td>
  </tr>
 </table>
</form>

<table class="productManage">
 <caption>
  <strong>상품관리</strong>
 </caption>
 <tr>
  <td colspan="9"><button class="product_reg" onClick="location.href='prodInsertForm.net'">상품등록</button></td>
 </tr>
 <tr class="ManageMenu">
  <th>번호</th>
  <th>대분류</th>
  <th>소분류</th>
  <th>상품명</th>
  <th>정가</th>
  <th>할인가</th>
  <th></th>
  <th></th>
  <th>상품이미지</th>
 </tr>
	<%
	DecimalFormat decFormat = new DecimalFormat("###,###");
	
	for(ProductBean pbean : list){%>
	<tr class="product_manage_list">
		<td><%=pbean.getNo()%></td>
		<td><%=pbean.getLcname() %></td>
		<td><%=pbean.getScname() %></td>
		<td><a href="getProduct_detail_ok.net?no=<%=pbean.getNo()%>"><%=pbean.getName()%></a></td>
		<td><%=decFormat.format(pbean.getOriprice())%>원</td>
		<td><%=decFormat.format(pbean.getDiscprice())%>원</td>
		<td><a href="#?pno=<%=pbean.getNo()%>">수정</a></td>
		<td><a href="prodDelete.net?pno=<%=pbean.getNo()%>">삭제</a></td>
		<td>
			<%
			String rContext = request.getContextPath() + "/admin/product_images/";
			String fullPath = rContext + pbean.getMainImgN();
			System.out.println(rContext);
			System.out.println(fullPath);
			%>
			<img src="<%=fullPath%>" style="max-height: 70px; max-width: 70px;">		
		</td>
	</tr>
	<%
	}%>
	
	
</table>