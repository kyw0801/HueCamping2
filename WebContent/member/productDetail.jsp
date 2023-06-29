<%@page import="net.hue.bean.CategoryBean"%>
<%@page import="net.hue.dao.CategoryDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="net.hue.bean.StockBean"%>
<%@page import="net.hue.dao.StockDao"%>
<%@page import="net.hue.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.hue.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" />

<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">


<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".plus").click(function() {
			var num = $(".numBox").val();
			var plusNum = Number(num) + 1;
			
			$(".numBox").val(plusNum);
		});

		$(".minus").click(function() {
			var num = $(".numBox").val();
			var minusNum = Number(num) - 1;
			
			if(minusNum <= 0) {
				$(".numBox").val(num);
			} 
			else {
				$(".numBox").val(minusNum);          
			}
		});
		
		
	});
	
	function addCart(pno){
		<%
		if(session.getAttribute("memno") == null){
		%>
				alert("로그인 먼저 해야합니다.");
				location.href="member_loin.net";
				return;
		<%
		}
		%>
		
		if($('#optionSelect').val() == ""){
			//alert($('#optionSelect').val());
			alert("옵션을 선택해주세요");
			return;
		}

		var qty = $(".numBox").val();
		var opname = $('#optionSelect').val();
		
		var count = (($('select option:selected').text()).split("(")[1]).split("개")[0]; // 재고
		
		if(parseInt(count) < parseInt(qty)){
			alert("재고수량을 확인 후 다시 시도하세요");
			return;
		}
		
		location.href = "addCart.net?pno=" + pno + "&qty=" + qty + "&opname=" + opname; 
	}
	
	function addCartSkipShow(pno){
		<%
		if(session.getAttribute("memno") == null){
		%>
				alert("로그인 먼저 해야합니다.");
				location.href="member_loin.net";
				return;
		<%
		}
		%>
		
		if($('#optionSelect').val() == ""){
			//alert($('#optionSelect').val());
			alert("옵션을 선택해주세요");
			return;
		}
		
		var qty = $(".numBox").val();
		var opname = $('#optionSelect').val();
		
		var count = (($('select option:selected').text()).split("(")[1]).split("개")[0]; // 재고
		
		if(parseInt(count) < parseInt(qty)){
			alert("재고수량을 넘어서는 주문 시도는 불가능 합니다");
			return;
		}
		
		location.href = "orderSkipCart.net?pno=" + pno + "&qty=" + qty + "&opname=" + opname;  
	}
</script>

<div class="-frame">

<!-- 안내바 S -->
  <div id="expath" class="path">
   <ol>
    <li>
     <a href="member_main.net">Home</a>
    </li>
    <li>
     <a href="#">${iLcname}</a>
    </li>
    <li>
     <a href="#"><strong>${iScname}</strong></a>
    </li>
   </ol>
  </div>
<!-- 안내바 E -->

<div id="detailTopArea">
<%
	int pno = Integer.parseInt(request.getParameter("no"));

	ProductDao pdao = ProductDao.getInstance();
	ProductBean pbean = pdao.getProduct(pno);
	
	String fullPath = request.getContextPath() + "/admin/product_images/" + pbean.getMainImgN();
	//System.out.println(fullPath);
	DecimalFormat decFormat = new DecimalFormat("###,###");
%>
<table class="detailArea">
 <tr>
  <td>
   <img id="mainImg" src="<%=fullPath%>">
  </td>
  <td id="detailTopRight">
   <table>
    <tr>
     <td>
      <h3><%=pbean.getName() %></h3>
      <img src="./images/depart_today.png">
     </td>
    </tr>
    <tr>
     <td>
      <span id="info"><%=pbean.getInfo() %></span>
     </td>
    </tr>
    <tr>
     <td class="detail_t">정가</td>
     <td class="detail_c">
      <span style="text-decoration:line-through">
       <%=decFormat.format(pbean.getOriprice())%>
      </span>원
     </td>
    </tr>
    <tr>
     <td class="detail_t">할인가</td>
     <td class="detail_c"><%=decFormat.format(pbean.getDiscprice())%>원</td>
    </tr>
    <tr>
     <td class="detail_t">배송비</td>
     <td class="detail_c">3,000원 (50,000원 이상 구매 시 무료)</td>
    </tr>
    <tr>
     <td class="detail_optiont">옵션선택</td>
     <td class="detail_option">
      <select id="optionSelect">
      <option value="">옵션선택</option>
      <%
       StockDao sdao = StockDao.getInstance();
       ArrayList<StockBean> slist = sdao.getAllStockByPno(pno);
							
       for(StockBean sbean : slist){
      %>
      <option value="<%=sbean.getOpname()%>" <%if(sbean.getCount() == 0){%> disabled <%} %>>
       <%=sbean.getOpname()%> 
       <%
        for(int i = 0; i<30 ;i++){
       %>
       &nbsp;		
       <%}
									
        if(sbean.getCount() == 0){
       %>
       (품절)
       <%		
        }else{
       %>
       (<%=sbean.getCount()%>개 남음)
										
       <%	
        }
       %>									
       </option>
       <%
        }
       %>
      </select>
     </td>
    </tr>
    <tr>
     <td class="detail_t">수량선택</td>
     <td class="detail_count">
      <button type="button" class="minus">-</button>
      <input type="number" class="numBox" min="1" max="999" size="10" value="1" readonly="readonly" >
      <button type="button" class="plus">+</button>
     </td>
    </tr>

    <tr class="detail_btn">
     <td><input type="button" value="바로구매" class="buy_btn" onClick="addCartSkipShow(<%=pbean.getNo()%>)"></td>
     <td><input type="button" value="장바구니" class="addcart_btn" onClick="addCart(<%=pbean.getNo()%>)"></td>
     <td><input type="button" value="관심상품" class="addcart_btn" onClick="addCart(<%=pbean.getNo()%>)"></td>
    </tr>
   </table>
  </td>
 </tr>
</table>
</div>
<table id="detailMiddleArea">
 <tr>
  <td class="product_detail">
   <strong>Product Detail</strong>
  </td>
 </tr>
 <%
  String detailImg_fullPath = null;

  if(pbean.getDetailImgN1() != null){
  		detailImg_fullPath= request.getContextPath() + "/admin/product_images/" + pbean.getDetailImgN1();
 %>
 <tr>
  <td class="detailImg">	
   <img src = "<%=detailImg_fullPath%>">
  </td>
 </tr>
 <%
  }
	
  if(pbean.getDetailImgN2() != null){
  		detailImg_fullPath= request.getContextPath() + "/admin/product_images/" + pbean.getDetailImgN2();
 %>
 <tr>
  <td class="detailImg">
   <img src = "<%=detailImg_fullPath%>">
  </td>
 </tr>
 <%
  }
	
  if(pbean.getDetailImgN3() != null){
  		detailImg_fullPath= request.getContextPath() + "/admin/product_images/" + pbean.getDetailImgN3();
 %>
 <tr>
  <td class="detailImg">
   <img src = "<%=detailImg_fullPath%>">
  </td>
 </tr>
 <%
  }
	
  if(pbean.getDetailImgN4() != null){
  		detailImg_fullPath= request.getContextPath() + "/admin/product_images/" + pbean.getDetailImgN4();
 %>
 <tr>
  <td class="detailImg">
   <img src = "<%=detailImg_fullPath%>">
  </td>
 </tr>
 <%
  }
 %>
</table>
</div>
<jsp:include page="../include/footer.jsp" />
