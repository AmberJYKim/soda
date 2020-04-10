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
<style>
.basket {
	width: 1000px;
}

.order {
	text-align: right;
}

.inner-col>input {
	width: 35px;
}

.title, .ckbox {
	text-align: center;
}

.inner-col {
	height: 50%;
	padding: 15px 5px 15px 5px;
	vertical-align: middle;
}

.pline {
	border-bottom: 2px solid rgba(73, 73, 231, 0.459);
}

.p-img {
	resize: both;
	max-width: 98.5px;
	height: auto;
	border-radius: 50%;
	margin-top: 5px;
	box-shadow: 0px 0px 0px 3px rgba(73, 73, 231, 0.432);
}

.p-name {
	font-weight: 600;
	font-size: 16px;
}

.p-info {
	font-size: 12px
}

/* 전체상품가격 영역 */
.lline {
	border-top: 3px solid rgb(122, 122, 122);
	border-bottom: 3px solid rgb(122, 122, 122);
	margin-top: 5px;
	padding: 20px 10px 20px 10px;
}

.md-total-price, .ckbox {
	padding: 50px 0 50px 0;
	text-align: center;
}

.total-price {
	font-size: 16px;
	font-weight: 700;
	padding-top: 5px;
}

/* ? */
.floatRight span {
	float: right;
}

.th_border {
	border-bottom: 1px solid black;
}

.font-17 {
	font-size: 17px;
}

.nav_text {
	font-weight: 600;
	color: hsl(0, 0%, 69%);
}

.selected_nav {
	color: #355752;
}

.section {
	padding-top: 150px;
}

.border_bottom {
	border-bottom: 2px solid black;
}
</style>
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
								<div class="row">
									<div class="ckbox col-md-1">
										<input type="checkbox" name="" id="" checked>
									</div>
									<div class="col-md-2">
										<img class="p-img"
											src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스//육류/돼지고기/구이용.png"
											alt="">
									</div>
									<div class="col-md-7">
										<div class="inner-col pline">
											<span class="p-name">고기고기꼬기</span><span class="p-info">(단위.
												단위당 가격)</span>
										</div>
										<div class="inner-col">
											<i class="fa fa-minus btns"></i> <input type="text"
												class="qty" title="구매수량" value="1" readonly /> <i
												class="fa fa-plus btns"></i>
										</div>
									</div>
									<div class="col-md-2 md-total-price">
										~원 <i class="fa fa-trash btns" aria-hidden="true"
											onclick="delproduct();"></i>
									</div>

								</div>
							</div>

						</div>
						<!--  -->
						<div class="row font-17 lline">
							<div class="col total-price">
								<div>
									전체 상품 가격<span> : 346,000 원 </span>
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


<script>
$(function(){
	$(".mvToSelectedProduct").on('click', function(){
		console.log("클릭됨");
	
		location.href="${pageContext.request.contextPath}/mall/selectedProductList.do";
		
	});
	
});

</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />