<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mall_delivery_info.css" />
 <!-- Event Details Section -->
    <section class="event-details-section spad overflow-hidden">
        <div class="tm-section-2">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="tm-section-title">뇸뇸몰</h2>
                        <p class="tm-color-white tm-section-subtitle">신선한 식재료만을 추구합니다. </p>
                    </div>
                </div>
            </div>
        </div>


        <div class="tm-section tm-position-relative">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none" class="tm-section-down-arrow">
                    <polygon fill="#4949e7" points="0,0  100,0  50,60"></polygon>
                </svg>
            <div class="container tm-pt-5 tm-pb-4">
                <div class="wizard">
                   <a><span class="badge">01</span>장바구니</a> <a><span class="badge">02</span> 선택된
					상품 리스트</a> <a class="current badge-inverse"><span class="badge">03</span> 배송지 정보</a> <a><span
					class="badge ">04</span>결제 정보</a> <a><span class="badge ">05</span>결제
					완료</a>
                </div>

                <!--form 태그 시작 -->

                <form action="/gunsan/service/TourServiceRingServlet" id="sv_form" class="sv_form" method="POST">
                    <div class="row text-center">
                        <article class="col-lg-6 tm-article m-auto" id="infoView">
                            <h3 class="tm-color-primary tm-article-title-1">배송지 입력</h3>
                            <!-- 수령인 -->
                            <span class="input input--yoshiko">
                                <input class="input__field input__field--yoshiko" type="text" id="input-10" />
                                <label class="input__label input__label--yoshiko" for="input-10">
                                    <span class="input__label-content input__label-content--yoshiko" data-content="수령인">수령인</span>
                                </label>
                            </span>
                            <!-- 배송지 주소 -->
                            <span class="input input--yoshiko">
                                <input class="input__field input__field--yoshiko" type="text" id="input-10" />
                                <label class="input__label input__label--yoshiko" for="input-10">
                                    <span class="input__label-content input__label-content--yoshiko" data-content="배송지 주소">배송지 주소</span>
                                </label>
                            </span>
                            <!-- 연락처 -->
                            <span class="input input--yoshiko">
                                <input class="input__field input__field--yoshiko" type="text" id="input-10" />
                                <label class="input__label input__label--yoshiko" for="input-10">
                                    <span class="input__label-content input__label-content--yoshiko" data-content="연락처">연락처</span>
                                </label>
                            </span>
                            <!-- 배송메모 -->
                            <span class="input input--yoshiko">
                                <input class="input__field input__field--yoshiko" type="text" id="input-10" />
                                <label class="input__label input__label--yoshiko" for="input-10">
                                    <span class="input__label-content input__label-content--yoshiko" data-content="배송 메모">배송 메모</span>
                                </label>
                            </span>

                            <a href="${pageContext.request.contextPath }/mall/paymentInfo.do" class="tm-color-white tm-btn-white-bordered">배송지 등록 완료</a>
                        </article>
                </article>         
            </form>
                
                </div>

            </div>
    </section>
    <!-- Event Details Section end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
