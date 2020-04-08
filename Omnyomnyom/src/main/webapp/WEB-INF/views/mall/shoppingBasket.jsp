<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="pageTitle" />
</jsp:include>
<!-- Event Details Section -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath }/resources/css/mall_delivery_info.css" />
<section class="event-details-section spad overflow-hidden">
	<div class="tm-section-2">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h2 class="tm-section-title">뇸뇸몰</h2>
					<p class="tm-color-white tm-section-subtitle">신선한 식재료만을 추구합니다.
					</p>
				</div>
			</div>
		</div>
	</div>


	<div class="tm-section tm-position-relative">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"
			preserveAspectRatio="none" class="tm-section-down-arrow">
                    <polygon fill="#4949e7" points="0,0  100,0  50,60"></polygon>
                </svg>
		<div class="container tm-pt-5 tm-pb-4">
			<div class="wizard">
				<a class="current badge-inverse"><span class="badge">01</span>장바구니</a>
				<a><span class="badge">02</span> 선택된 상품 리스트</a> <a><span
					class="badge">03</span> 배송지 정보</a> <a><span class="badge ">04</span>결제
					정보</a> <a><span class="badge ">05</span>결제 완료</a>
			</div>



		</div>
		<!-- 장바구니 시작 -->
		<div class="container col-md-12 basket">
			<div class="container">

				<div class="row border_bottom">
					<h4>장바구니</h4>
				</div>
				<br>

				<div class="row">
					<div class="col-md-12 ">
						<!--  -->
						<div class="row">
							<div class="container">
								<div class="row title">
									<div class="col-md-1">
										<input class="ckbox" type="checkbox" name="" id="" checked>
									</div>
									<div class="col-md-9">상품정보</div>
									<div class="col-md-2">상품금액</div>

								</div>
								<hr>
								<c:forEach items="${sbList }" var="sb">
									<div class="row">
										<div class="ckbox col-md-1">
											<input type="checkbox" name="" id="" checked>
										</div>
										<div class="col-md-2">
											<img class="p-img"
												src="${pageContext.request.contextPath }/resources/images/ingredient/${sb.mallEngPrCategory }/${sb.mallEngCdCategory }/${sb.prevImg }"
												alt="">
										</div>
										<div class="col-md-7">
											<div class="inner-col pline">
												<span class="p-name">${sb.ingMallName }</span><span class="p-info">(${sb.minUnit }당, <fmt:formatNumber value="${sb.price }" pattern="#,###" />)</span>
											</div>
											<div class="inner-col">
												<i class="fa fa-minus btns"></i> <input type="text"
													class="qty" title="구매수량" value="${sb.sbStock}"  /> <i
													class="fa fa-plus btns"></i>
											</div>
										</div>
										<div class="col-md-2 md-total-price">
											~원 <i class="fa fa-trash btns" aria-hidden="true"
												onclick="delproduct();"></i>
										</div>
	
									</div>
								</c:forEach>
							</div>

						</div>
						<!--  -->
						<div class="row font-17 lline">
							<div class="col total-price">
								<div>
									전체 상품 가격 :<span id="total_price">  346,000 원 </span>
								</div>
							</div>
							<div class="col order">
								<button type="button"
									class="btn btn-primary mvToSelectedProduct">선택 상품 주문하기</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- 장바구니 끝  -->
</section>
<!-- Event Details Section end -->
<style>
.p-img{
	border-radius: 50%;
}
</style>

<script>
	$(function () {
	    console.log('ready');
	    cursors();
	    totalPrice();
	})
	$(document).on("click",".ckbox",function(){
    	$box = $(this).children();
    	$box.attr('checked',!$box.prop("checked"));
    })
	function cursors() {
	    $(".btns").css("cursor", "pointer").on("click", function (e) {
	        let $nowcl = $(this).attr('class');
	        console.log($nowcl);
	        //
	        if ($nowcl.includes('fa-plus')) {
	        	let $input = $(this).prev();
	            let $qty = parseInt($input.val());
	            $input.val($qty+1);
	        } else if ($nowcl.includes('fa-minus')) {
	        	let $input = $(this).next();
	            let $qty = parseInt($input.val());
	            $input.val($qty-1);
	            if($input.val()<=0)
		            $input.val(1);
	        }
	    });
	}
	function changePrice(){
		
	}
	function totalPrice(){
		$("#total_price").text(String(ppap).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />