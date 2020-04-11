<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
<!--  원데이 pay  css -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class_reservation.css" />

<!-- 아임포트 결제 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
 <!-- 결제정보 js -->
    <script>
        $(document).ready(function() {
            //현재HTML문서가 브라우저에 로딩이 끝났다면   
            $("div.select-pay").hide();
            $('#card').click(function() {
                $("#card-pay").show();
                $("#bank-pay").hide();
                $("#card").style.backgroundColor = "#4949e7";
            }); //click

            $('#bank').click(function() {
                $("#bank-pay").show();
                $("#card-pay").hide();
                $("#bank").style.backgroundColor = "#4949e7";
            });
        }); //ready  
        function reservationEnd() {
            $("#reservationEndFrm").attr("action", "${pageContext.request.contextPath }/oneday/result.do").submit();
        };
        
        
        var IMP = window.IMP; // 생략가능
        IMP.init('imp50043848');  // 가맹점 식별 코드

        IMP.request_pay({
           pg : 'kakao', // 결제방식
	            pay_method : 'card',	// 결제 수단
	            merchant_uid : 'merchant_' + new Date().getTime(),
	           name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	            amount : '${.totalPrice}',	// 결제 금액 
	            buyer_email : '${memberLoggedIn.email}',	// 구매자 email
	           buyer_name :  '${memberLoggedIn.name}',	// 구매자 이름
	            buyer_tel :  '${memberLoggedIn.phone}',	// 구매자 전화번호
	            buyer_addr :  '${memberLoggedIn.Addr}',	// 구매자 주소
	            buyer_postcode :  '${memberLoggedIn.postalcode}',	// 구매자 우편번호
	            m_redirect_url : '/oneday/payresult'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	        }, function(rsp) {
	     	if ( rsp.success ) { // 성공시
	     		var msg = '결제가 완료되었습니다.';
	     		msg += '고유ID : ' + rsp.imp_uid;
	     		msg += '상점 거래ID : ' + rsp.merchant_uid;
	     		msg += '결제 금액 : ' + rsp.paid_amount;
	     		msg += '카드 승인번호 : ' + rsp.apply_num;
	     	} else { // 실패시
	     		var msg = '결제에 실패하였습니다.';
	     		msg += '에러내용 : ' + rsp.error_msg;
	     	}
    	});
        
    </script>
    
    <!-- Event Details Section -->
    <section class="event-details-section spad overflow-hidden">
        <div class="tm-section-2">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="tm-section-title">원데이클래스</h2>
                        <p class="tm-color-white tm-section-subtitle">당신만의 특별한 경험을 응원합니다. </p>
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
                    <a><span class="badge">01</span> 클래스 예약</a> <a><span class="badge">02</span>
                        예약 정보동의</a> <a  class="current badge-inverse"><span class="badge ">03</span>
                        예약 결제</a> <a><span class="badge">04</span>결제 완료</a>
                </div>
                <form action="/onn/oneday/result.do" method="POST">
                    <div class="row text-center">
                        <article class="col-lg-5 tm-article">
                            <h3 class="tm-color-primary tm-article-title-1">결제 상품 </h3>
                            <table class="ticket-tbl container">

                                <tr>
                                    <td><b>재미있는 양식클래스</b></td>
                                    <td>2020/3/27 (11:00)</td>
                                    <td>2매</td>
                                </tr>
                            </table>
                        </article>
                        <article class=" col-lg-2 tm-article">
                            <h3 class="tm-color-primary tm-article-title-1">결제수단</h3>
                            <p class="box_subtitle">❖ 원하시는 결제수단을 선택해 주세요.</p>
                            <input type="button" class="pay-btn" id="card" name="payCard" value="신용카드" onclick="selectPayType();">
                            <input type="button" class="pay-btn" id="bank" name="payBank" value="계좌이체" onclick="selectPayType();">
                        </article>

                        <article class="col-lg-3  tm-article">

                            <h3 class="tm-color-primary tm-article-title-1">결제수단 세부항목</h3>
                            <div class="select-pay" id="card-pay">
                                <p class="box_subtitle">❖ 결제하실 카드사를 선택해 주세요.</p>
                                <select name="pay-card-val" class="card-val" size="1">
                                                <option value="">카드사선택</option>
                                                <option value="C">군산카드</option>
                                                <option value="C">국민카드</option>
                                                <option value="C">하나카드</option>
                                                <option value="C">신한카드</option>
                                            </select>
                            </div>
                            <div class="select-pay" id="bank-pay">
                                <p class="box_subtitle">❖ 결제하실 은행를 선택해 주세요.</p>
                                <select name="pay-bank-val" class="card-val" size="1">
                                                <option value="">은행선택</option>
                                                <option value="W">군산은행</option>
                                                <option value="W">국민은행</option>
                                                <option value="W">하나은행</option>
                                                <option value="W">신한은행</option>
                                  </select>
                            </div>

                        </article>
                        <article class=" col-lg-1">
                            <input type="submit" value="결제완료" class="tm-color-white tm-btn-white-bordered" />
                        </article>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Event Details Section end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
