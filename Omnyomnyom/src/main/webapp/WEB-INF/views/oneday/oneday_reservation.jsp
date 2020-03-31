<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>


<!-- reservation css  -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class_reservation.css" />
 <!--  달력 css-->
 <link href="${pageContext.request.contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">

 <!-- 인원증감  -->
    <script>
        $(function() {
            $('.btn-number').click(function(e) {
                e.preventDefault();
                fieldName = $(this).attr('data-field');
                type = $(this).attr('data-type');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());
                if (!isNaN(currentVal)) {
                    if (type == 'minus') {

                        if (currentVal > input.attr('min')) {
                            input.val(currentVal - 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('min')) {
                            $(this).attr('disabled', true);
                        }

                    } else if (type == 'plus') {

                        if (currentVal < input.attr('max')) {
                            input.val(currentVal + 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('max')) {
                            $(this).attr('disabled', true);
                        }

                    }
                } else {
                    input.val(0);
                }
            });
            $('.input-number').focusin(function() {
                $(this).data('oldValue', $(this).val());
            });
            $('.input-number').change(function() {

                minValue = parseInt($(this).attr('min'));
                maxValue = parseInt($(this).attr('max'));
                valueCurrent = parseInt($(this).val());

                name = $(this).attr('name');
                if (valueCurrent >= minValue) {
                    $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the minimum value was reached');
                    $(this).val($(this).data('oldValue'));
                }
                if (valueCurrent <= maxValue) {
                    $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the maximum value was reached');
                    $(this).val($(this).data('oldValue'));
                }
            });

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
                    <a class="current badge-inverse"><span class="badge">01</span> 클래스 예약</a> <a><span class="badge">02</span>
                        예약 정보동의</a> <a><span class="badge ">03</span>
                        예약 결제</a> <a><span class="badge ">04</span>결제 완료</a>
                </div>

                <!--form 태그 시작 -->

                <form action="/gunsan/service/TourServiceRingServlet" id="sv_form" class="sv_form" method="POST">
                    <div class="row text-center">
                        <article class="col-xl-4 tm-article" id="infoView">
                            <h3 class="tm-color-primary tm-article-title-1">클래스 소개</h3>
                            <img src="/img/hero-slider/main2.jpg">
                        </article>


                        <article class=" col-xl-2.5 tm-article" name="dateTimeView">
                            <h3 class="tm-color-primary tm-article-title-1"> 날짜</h3>
                            <h4 id="date">
                                2020/3/26
                            </h4>
                            <p id="time-title" class="box_subtitle">❖ 선택하신 시간을 확인해 주세요.</p>

                            <table id="time-table" class="time-table">
                                <tr>
                                    <th>시간</th>
                                    <th>잔여수</th>
                                    <th>선택여부</th>
                                </tr>
                                <tr>
                                    <td>10:00</td>
                                    <td id="remainCnt">20</td>
                                    <td class="td-white-back">
                                        <input type="checkbox" class="timeCheck" name="timeCheck" value="10:00" onclick="">
                                        <input type="hidden" id="remainChk" value="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td>13:00</td>
                                    <td id="remainCnt">20</td>
                                    <td class="td-white-back">
                                        <input type="checkbox" class="timeCheck" name="timeCheck" value="10:00" onclick="">
                                        <input type="hidden" id="remainChk" value="20">
                                    </td>
                                </tr>
                            </table>


                        </article>
                        <article class="col-xl-2.5  tm-article">

                            <h3 class="tm-color-primary tm-article-title-1">인원 선택</h3>

                            <article class="col-xl-2.5  tm-article">
                                <p class="box_subtitle">❖ 인원을 선택 해주세요.</p>

                                <table id="amount-table">
                                    <tr>
                                        <th>인원</th>
                                        <td class="td-wthie-back"><span id="price">75,000원</span></td>
                                        <td class="">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-default btn-number" id="adultMinus">
                                                        <span class="glyphicon glyphicon-minus">-</span>
                                                </button>
                                                </span>
                                                <div class="selected-amount">
                                                    <input type="text" name="adultValue" class="form-control input-number" value="5" min="0" max="10"> <span class="input-group-btn"></span>
                                                </div>
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-default btn-number"
                                                    id="adultPlus">
                                                        <span class="glyphicon glyphicon-plus">+</span>
                                                </button>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </article>

                        </article>
                        <input type="hidden" name="idx" value="0" />
                        <input type="hidden" name="tour_info_id" value="TA60006" />
                        <input type="hidden" name="time" value="00:00" />
                        <input type="hidden" name="date" value="" />
                        <input type="hidden" name="member_no" value="gn200217_0003" />
                        <input type="hidden" name="childPrice" value="75000" />
                        <input type="hidden" name="adultPrice" value="50000" />
                </form>
                <article class=" col-xl-1.5">
                    <a href="" class="tm-color-white tm-btn-white-bordered">이전</a>
                    <a href="${pageContext.request.contextPath }/oneday/agree.do" class="tm-color-white tm-btn-white-bordered">다음</a>
                </article>
                </div>

            </div>
    </section>
    <!-- Event Details Section end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    