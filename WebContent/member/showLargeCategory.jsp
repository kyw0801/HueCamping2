<%@page import="java.text.DecimalFormat"%>
<%@page import="net.hue.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.hue.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" />

<script src="../js/jquery.js"></script>
<script>
	$(document).ready(function(){
		$('#banner_image').show();
	});
</script>


<%
	int lcno = Integer.parseInt(request.getParameter("lcno"));
	
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> list = pdao.getAllProductByLcno(lcno); 
	
	DecimalFormat decFormat = new DecimalFormat("###,###");
%>

<%
	if(list.size() == 0){%>
		<table id="mainList">
		<tr>
			<td>해당 카테고리에는 진열된 상품이 존재하지 않습니다.</td>
		</tr>
		</table>
	<%
	}else{%>
	<table id="mainList">
	<tr>
	<%
     for(int i = 0; i < list.size(); i++){
     	ProductBean pbean = list.get(i);
				
     	String fullPath = request.getContextPath() + "/admin/product_images/" + pbean.getMainImgN();
     	System.out.println(fullPath);
    %>
     <td>
      <table id="mainListInside">
       <tr>
        <td class="thumnail_img">
         <a href="getProduct_detail_ok.net?no=<%=pbean.getNo()%>"><img src=<%=fullPath%> style="max-height: 300px; max-width: 300px;"></a>
        </td>
       </tr>
       <tr>
        <td class="thumnail_prod">
         <h3><%=pbean.getName()%></h3>
        </td>
       </tr>
       <tr>
        <td class="thumnail_price">
         <span style="text-decoration:line-through;" class="thumnail_price1"><%=decFormat.format(pbean.getOriprice())%>원</span>
         <span class="thumnail_price2"><%=decFormat.format(pbean.getDiscprice())%>원</span>
        </td>
       </tr>
      </table>
     </td>
     <%
      if(i%4 == 3){
     %>
    </tr>
    <tr>
     <%	
      	}
      }
     %>
    </tr>
</table>	
	<%
	}
%>
<jsp:include page="../include/footer.jsp" />