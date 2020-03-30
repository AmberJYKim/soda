<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>

    <!-- Event Details Section -->
    <section class="event-details-section spad overflow-hidden">
        <div class="container">

            <div class="row">
                <div class="col-lg-7">
                    <div class="oneday_class_img">
                        <img src="img/hero-slider/main2.jpg" alt="">
                    </div>
                    <div class="sb-widget">
                        <h2 class="sb-title">셰프소개</h2>
                        <div class="about-instructor-widget">
                            <img src="img/classes/author/1.jpg" alt="">
                            <h6>Yoga Trainer</h6>
                            <p>Yoga & Therapy Certificate of Uttarakhand University</p>
                        </div>
                    </div>
                    <div class="event-details">
                        <p>이런 분들을 위한 클래스예요 매일의 요리를 어떻게 시작하고, 지속해야할지 막막하신 분 양파, 대파, 무, 버섯 등 기본 채소를 남김 없이 활용하고 싶으신 분 건강을 챙기고 싶지만 채소 요리에 한계를 느끼시는 분 습관처럼 요리를 할 수 있는 요령을 원하시는 분

                            </br>
                            요리가 단순히 한 끼의 식사를 해결하기 위한 기술에 그치지 않기를 바랍니다. 요리에 관심을 가지게 되면 자신이 현재 어떠한 곳에 살고 있으며, 어떠한 계절에 머물러 있는지, 몸과 마음은 어떠한 상태인지 알아보는 시간을 가질 수 있습니다. 가장 먼저 오늘 먹고 싶은 것이 무엇인지 고민해보고, 필요한 재료는 어디에서 구할 수 있는지, 이 계절에 나지 않는다면 얼마나 기다려야하는지, 시간이 걸리고 수고가 든다 하여도 스스로 알아가 보는 것 부터가 요리의
                            시작이라고 생각합니다. 그런 시간들이 매일을 설레이게 해주니까요. 클래스에서 알려드릴 요리에서는 구하기 어려운 식재료를 사용하지 않습니다. 완제품의 소스나, 통조림, 병조림 등 또한 사용하지 않습니다. 우리 근처에서 흔히 볼 수 있는 재료들을 사용하며, 다른 재료들로 충분히 대체 가능하도록 유연한 요리법을 안내합니다. 클래스 영상을 먼저 보고난 후 집에 남아있는 자투리 재료 중 활용할 수 있는 것은
                            없는지, 또는 제가 알려드리는 조합보다 더 좋은 것은 없는지 찾아보시기를 바랍니다. 삶의 모든 일이 그렇듯 요리에도 정답은 없습니다. 자신만의 답을 만들어보는 재미를 느껴보세요!
                        </p>
                        <!-- <div class="row mb-5">
                            <div class="col-lg-6">
                                <h3>클래스 위치</h3>
                                <p><i class="material-icons">map</i>서울특별시 강남구 논현동 165-3</p>
                                <div class="signup-map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d33245.297803635964!2d-73.76987401620775!3d40.704774398815005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1575866843291!5m2!1sen!2sbd"
                                        style="border:0;" allowfullscreen=""></iframe></div>
                            </div>
                            <div class="col-lg-6 pt-4 pb-5">
                                <h3>클래스 날짜</h3>
                                <p><i class="material-icons">map</i> </p>
                                <ul>
                                    <li><i class="material-icons">done_all</i>Fast and healthy weight loss yoga</li>
                                    <li><i class="material-icons">done_all</i>Yoga preserves beauty and youth</li>
                                    <li><i class="material-icons">done_all</i> Yoga repels all diseases</li>
                                    <li><i class="material-icons">done_all</i>Yoga brings peace, balance</li>
                                    <li><i class="material-icons">done_all</i> Yoga exercises for beautiful belly slim waist</li>
                                </ul>
                            </div>
                        </div> -->
                    </div>
                    <!-- <h3 class="comment-title">Other Classes</h3>
                    <div class="event-other-slider owl-carousel">
                        <div class="event-item">
                            <div class="ei-img">
                                <img src="img/event/1.jpg" alt="">
                            </div>
                            <div class="ei-text">
                                <h4><a href="event-details.html">Free Yoga Madrid</a></h4>
                                <ul>
                                    <li><i class="material-icons">person</i>Kelly Alexander</li>
                                    <li><i class="material-icons">event_available</i>15 January, 2019</li>
                                    <li><i class="material-icons">map</i>184 Main Collins Street</li>
                                </ul>
                            </div>
                        </div>
                        <div class="event-item">
                            <div class="ei-img">
                                <img src="img/event/2.jpg" alt="">
                            </div>
                            <div class="ei-text">
                                <h4>Get on Your Mat</h4>
                                <ul>
                                    <li><i class="material-icons">person</i>Kelly Alexander</li>
                                    <li><i class="material-icons">event_available</i>15 January, 2019</li>
                                    <li><i class="material-icons">map</i>184 Main Collins Street</li>
                                </ul>
                            </div>
                        </div>
                        <div class="event-item">
                            <div class="ei-img">
                                <img src="img/event/3.jpg" alt="">
                            </div>
                            <div class="ei-text">
                                <h4>One Love Dallas</h4>
                                <ul>
                                    <li><i class="material-icons">person</i>Kelly Alexander</li>
                                    <li><i class="material-icons">event_available</i>15 January, 2019</li>
                                    <li><i class="material-icons">map</i>184 Main Collins Street</li>
                                </ul>
                            </div>
                        </div>
                    </div> -->
                    <!--  -->
                    <h3 class="comment-title">Comments</h3>
                    <ul class="comment-list">
                        <li>
                            <img src="img/classes/author/3.jpg" class="comment-pic" alt="">
                            <div class="comment-text">
                                <h3>Beverly Price </h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                            <ul class="comment-sub-list">
                                <li>
                                    <img src="img/classes/author/2.jpg" class="comment-pic" alt="">
                                    <div class="comment-text">
                                        <h3>Jacqueline Watkins</h3>
                                        <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                        <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                        <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <img src="img/classes/author/1.jpg" class="comment-pic" alt="">
                            <div class="comment-text">
                                <h3>Lori Gonzales</h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                        </li>
                    </ul>
                    <h3 class="comment-title">Leave a Reply</h3>
                    <form class="singup-form">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" placeholder="First Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" placeholder="Last Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" placeholder="Your Email">
                            </div>
                            <div class="col-md-6">
                                <input type="text" placeholder="Phone Number">
                            </div>
                            <div class="col-md-12">
                                <textarea placeholder="Message"></textarea>
                                <a href="#" class="site-btn sb-gradient">Send message</a>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 사이드부분 -->
                <div class="col-lg-5 col-md-5 col-sm-8 sidebar">
                    <div class="sb-widget">
                        <div class="classes-info">
                            <h2>클래스명 재미있고 쉽게 하는 양식</h2>
                            <p>셰프닉네임(채널명)</p>
                            <h4> 20,000원</h4>
                            <ul>
                                <li><i class="material-icons">alarm_on</i>클래스 소요시간 : 1시간30분</li>
                                <li><i class="material-icons">people_outline</i>정원인원 : 10명</li>
                                <li><i class="material-icons">person_outline</i>최소인원 : 5명</li>
                            </ul>
                            <h2>클래스 날짜</h2>
                            <div class="datepicker-here" data-language='kr'></div>
                            <h2>클래스 시간/회차</h2>
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
                            <button class="site-btn sb-gradient reservation_class"><a href="${pageContext.request.contextPath }/oneday/reservation.do">신청하기</a></button>
                        </div>
                    </div>
                    <div class="sb-widget">
                        <div class="classes-info">
                            <h3>클래스 위치</h3>
                            <p><i class="material-icons">map</i>서울특별시 강남구 논현동 165-3</p>
                            <div class="cource-view-row map">
                                <div id="map_div"></div>
                            </div>
                            <script>
                                function() {
                                    let map = new Tmapv2.Map("map_div", {
                                        center: new Tmapv2.LatLng(35.977376, 126.713796), // 지도 초기 좌표
                                        width: "600px", // map의 width 설정
                                        height: "400px" // map의 height 설정	
                                    });
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Event Details Section end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
