<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="net.hue.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.hue.dao.ProductDao"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/imageslide.css" >
<script type="text/javascript" src="./js/imageslide.js"></script>

  <div id="-main">
<%-- 메인페이지 이미지 S --%>
   <div id="main_main">
    <div id="main_img">
     <div class="mySlideDiv fade active">
      <img src="./images/mainimage.jpg" width="1660" height="500" alt="메인이미지" >
     </div>
     <div class="mySlideDiv fade">
      <img src="./images/imageslid1.jpg" width="1660" height="500" alt="메인이미지" >
     </div>
     <div class="mySlideDiv fade">
      <img src="./images/imageslid2.jpg" width="1660" height="500" alt="메인이미지" >
     </div>
     <a class="prev" onclick="prevSlide()">&#10094;</a>
     <a class="next" onclick="nextSlide()">&#10095;</a>
    </div>
   </div>
<%-- 메인페이지 이미지 E --%> 
 
   <div class="clear"></div>
   
<%-- 메인배너 S --%>   
   <div class="mainSection">
	<div class="mainsec01">
	 <div class="-frame">
	  <div id="mainsec00" class="mainsec00">
	   <div class="-sort2">
	    <ul class="grid4 -zero">
	     <li class="item0">
	      <a href="#">
	       <img src="https://egura83.cafe24.com/web/upload/NNEditor/20211112/562c3e483171391818f9ac6f0afc77a8.jpg">
	      </a>
	     </li>
	     <li class="item1">
	      <a href="#">
	       <img src="https://egura83.cafe24.com/web/upload/NNEditor/20211112/fd7e4a8c923eb3abbbf24f26cd2b27e4.jpg">
	      </a>
	     </li>
	     <li class="item2">
	      <a href="#">
	       <img src="https://egura83.cafe24.com/web/upload/NNEditor/20211112/e70d9c88f2ac4c62cfa8fc284595c0db.jpg">
	      </a>
	     </li>
	     <li class="item3">
	      <a href="#">
	       <img src="./images/asd.jpg">
	      </a>
	     </li>
	    </ul>
	   </div>
	  </div>
	 </div>
	</div>
   </div>
<%-- 메인배너 E --%>  

<%-- 메인페이지 본문 --%>
<%-- 베스트 아이템 --%>
   <div class="product-1 mainSection">
    <div class="ec-base-product mainproduct main">
     <div class="-frame">
      <div class="productGroupTitle">
       <div class="-prdstitle">
        <span class="text" style="display: ;">
         BEST ITEM
         <p>가장 많은 사랑을 받은 상품입니다.</p>
        </span>
        <span style="display: none;">
         <img alt="BEST ITEM<p>가장 많은 사랑을 받은 상품입니다.</p>" >
        </span>
       </div>
      </div>
 		<%
 		ProductDao pdao = ProductDao.getInstance();
		ArrayList<ProductBean> list = pdao.getAllProduct();
		DecimalFormat decFormat = new DecimalFormat("###,###");
		 %>
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
    <tr style="display: none;">
     <%	
      	}
      }
     %>
    </tr>
</table>
     </div>
    </div>
   </div>
   
   <%-- 신상품 아이템 --%>
   <div class="product-1 mainSection">
    <div class="ec-base-product mainproduct main">
     <div class="-frame">
      <div class="productGroupTitle">
       <div class="-prdstitle">
        <span class="text" style="display: ;">
         NEW ARRIVALS
         <p>매력적인 신상품, 지금 만나보세요!</p>
        </span>
        <span style="display: none;">
         <img alt="NEW ARRIVALS<p>매력적인 신상품, 지금 만나보세요!</p>" >
        </span>
       </div>
      </div>
 		<%
 		ProductDao pndao = ProductDao.getInstance();
		ArrayList<ProductBean> nlist = pndao.getAllProduct1();
		 %>
   <table id="mainList">
	<tr>
	<%
     for(int i = 0; i < nlist.size(); i++){
     	ProductBean npbean = nlist.get(i);
				
     	String fullPath = request.getContextPath() + "/admin/product_images/" + npbean.getMainImgN();
     	System.out.println(fullPath);
    %>
     <td>
      <table id="mainListInside">
       <tr>
        <td class="thumnail_img">
         <a href="getProduct_detail_ok.net?no=<%=npbean.getNo()%>"><img src=<%=fullPath%> style="max-height: 300px; max-width: 300px;"></a>
        </td>
       </tr>
       <tr>
        <td class="thumnail_prod">
         <h3><%=npbean.getName()%></h3>
        </td>
       </tr>
       <tr>
        <td class="thumnail_price">
         <span style="text-decoration:line-through;" class="thumnail_price1"><%=decFormat.format(npbean.getOriprice())%>원</span>
         <span class="thumnail_price2"><%=decFormat.format(npbean.getDiscprice())%>원</span>
        </td>
       </tr>
      </table>
     </td>
     <%
      if(i%4 == 3){
     %>
    </tr>
    <tr style="display: none;">
     <%	
      	}
      }
     %>
    </tr>
</table>
     </div>
    </div>
   </div>
   
   
   <%-- 핫딜 아이템 --%>
   <div class="product-1 mainSection">
    <div class="ec-base-product mainproduct main">
     <div class="-frame">
      <div class="productGroupTitle">
       <div class="-prdstitle">
        <span class="text" style="display: ;">
         HOT DEAL
         <p>핫태하태! 금주의 핫딜상품입니다.</p>
        </span>
        <span style="display: none;">
         <img alt="HOT DEAL<p>핫태하태! 금주의 핫딜상품입니다.</p>" >
        </span>
       </div>
      </div>
 		<%
 		ProductDao hndao = ProductDao.getInstance();
		ArrayList<ProductBean> hlist = pdao.getAllProduct();
		 %>
   <table id="mainList">
	<tr>
	<%
     for(int i = 0; i < hlist.size(); i++){
     	ProductBean hpbean = hlist.get(i);
				
     	String fullPath = request.getContextPath() + "/admin/product_images/" + hpbean.getMainImgN();
     	System.out.println(fullPath);
    %>
     <td>
      <table id="mainListInside">
       <tr>
        <td class="thumnail_img">
         <a href="getProduct_detail_ok.net?no=<%=hpbean.getNo()%>"><img src=<%=fullPath%> style="max-height: 300px; max-width: 300px;"></a>
        </td>
       </tr>
       <tr>
        <td class="thumnail_prod">
         <h3><%=hpbean.getName()%></h3>
        </td>
       </tr>
       <tr>
        <td class="thumnail_price">
         <span style="text-decoration:line-through;" class="thumnail_price1"><%=decFormat.format(hpbean.getOriprice())%>원</span>
         <span class="thumnail_price2"><%=decFormat.format(hpbean.getDiscprice())%>원</span>
        </td>
       </tr>
      </table>
     </td>
     <%
      if(i%4 == 3){
     %>
    </tr>
    <tr style="display: none;">
     <%	
      	}
      }
     %>
    </tr>
</table>
     </div>
    </div>
   </div>
   
   
 <div class="clear"></div>
 
 
<jsp:include page="../include/footer.jsp" />