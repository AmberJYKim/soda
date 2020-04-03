<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
 <!-- 로그인 메뉴 -->
    <!-- main.css, util.css추가 -->
    <!-- ${pageContext.request.contextPath }/resources/images/ui에 다수의 png 추가 -->

    <!-- 냉부해 슬라이드 -->
    <section class="hero-section">
        <div class="hero-social-warp">
            <div class="hero-social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-google"></i></a>
                <a href="#"><i class="fab fa-kickstarter-k"></i></a>
                <a href="#"><i class="fab fa-neos"></i></a>
            </div>
        </div>
        <div class="arrow-buttom">
            <img src="${pageContext.request.contextPath }/resources/images/icons/arrows-buttom.png" alt="">
        </div>
        <div class="hero-slider owl-carousel">
            <div class="hs-item">
                <div class="hs-style-1 text-center">
                    <img src="${pageContext.request.contextPath }/resources/images/hero-slider/main2.jpg" alt="">
                </div>
            </div>
            <div class="hs-item">
                <div class="hs-style-2">
                    <div class="container-fluid h-100">
                        <div class="row h-100">
                            <div class="col-lg-6 h-100 d-none d-lg-flex align-items-xl-end align-items-lg-center">
                                <div class="hs-img">
                                    <img src="${pageContext.request.contextPath }/resources/images/hero-slider/main4.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6 d-flex align-items-center">
                                <div class="hs-text-warp">
                                    <div class="hs-text">
                                        <h2>냉장고를 부탁해</h2>
                                        <p>요리와 썸 타고 있는 당신을 위해 <br/>냉장고 속 재료들로 완벽한 한끼 식사를 추천해 드립니다. </p>
                                        <div class="site-btn sb-white">냉장고 털어가기</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hs-item">
                <div class="hs-style-3 text-center">
                    <div class="container">
                        <div class="hs-text">
                            <h2>레시피 속 재료</h2>
                            <p>레시피 영상 속 재료, 쿠킹박스, 주방도구가 확인 하고 원 클릭으로 내 집 앞으로 올 수 있게 실현해 보세요.
                                </p>
                                    <div class="site-btn sb-white">구매하러 가기</div>
                        </div>
                    </div>
                    <div class="hs-img">
                        <img src="${pageContext.request.contextPath }/resources/images/hero-slider/food.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 냉부해 슬라이드 end -->


    <!-- 레시피 인기영상 Top6Section -->
    <section class="trainer-section overflow-hidden spad">
        <div class="container">
            <div class="section-title text-center">
                <h2>TODAY RECIPE</h2>
                <p>오늘 인기 있는 셔프 레시피 영상 TOP5!<br/>최근 인기 셰프 및 레시피 TOP6 입니다. 영상 속 레시피를 완벽한 한끼를 준비해 보세요.</p>
            </div>
            <div class="trainer-slider owl-carousel">
                <div class="ts-item">
                    <div class="trainer-item">
                        <div class="ti-img">
                            <img src="${pageContext.request.contextPath }/resources/images/thumbnail/thumbnail.jpg" alt="">
                        </div>
                        <div class="ti-text">
                            <h4>영상제목1</h4>
                            <h6>조회수 25만회</h6>
                            <p>영상소개 글 올 자리입니다.</p>
                        </div>
                    </div>
                </div>
                <div class="ts-item">
                    <div class="trainer-item">
                        <div class="ti-img">
                            <img src="${pageContext.request.contextPath }/resources/images/thumbnail/thumbnail.jpg" alt="">
                        </div>
                        <div class="ti-text">
                            <h4>영상제목2</h4>
                            <h6>조회수 25만회</h6>
                            <p>영상소개 글 올 자리입니다.</p>
                        </div>
                    </div>
                </div>
                <div class="ts-item">
                    <div class="trainer-item">
                        <div class="ti-img">
                            <img src="${pageContext.request.contextPath }/resources/images/thumbnail/thumbnail.jpg" alt="">
                        </div>
                        <div class="ti-text">
                            <h4>영상제목3</h4>
                            <h6>조회수 25만회</h6>
                            <p>영상소개 글</p>
                        </div>
                    </div>
                </div>
                <div class="ts-item">
                    <div class="trainer-item">
                        <div class="ti-img">
                            <img src="${pageContext.request.contextPath }/resources/images/thumbnail/thumbnail.jpg" alt="">
                        </div>
                        <div class="ti-text">
                            <h4>영상제목4</h4>
                            <h6>조회수 25만회</h6>
                            <p>영상소개 글 올 자리입니다.</p>
                        </div>
                    </div>
                </div>
                <div class="ts-item">
                    <div class="trainer-item">
                        <div class="ti-img">
                            <img src="${pageContext.request.contextPath }/resources/images/thumbnail/thumbnail.jpg" alt="">
                        </div>
                        <div class="ti-text">
                            <h4>영상제목5</h4>
                            <h6>조회수 20만회</h6>
                            <p>영상소개 글 올 자리입니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 레시피 인기영상 Top6 Section end -->

    <!-- 원데이 클래스 Section -->
    <section class="classes-section spad">
        <div class="container">
            <div class="section-title text-center">
                <h2>ONEDAY CLASSES</h2>
                <p>영상에서 부족했던 부분을 오프라인에서 해결해 보세요. 인기있는 셰프님과의 만남을 가져보세요.</p>
            </div>
            <div class="classes-slider owl-carousel">
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="${pageContext.request.contextPath }/resources/images/classes/cook.jpg" alt="">
                    </div>
                    <div class="ci-text">
                        <h4><a href="classes-details.html">클래스명1</a></h4>
                        <div class="ci-metas">
                            <div class="ci-meta"><i class="material-icons">event_available</i>월, 수, 금</div>
                            <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                        </div>
                        <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                    </div>
                    <div class="ci-bottom">
                        <div class="ci-author">
                            <img src="${pageContext.request.contextPath }/resources/images/classes/author/1.jpg" alt="">
                            <div class="author-text">
                                <h6>클래스명</h6>
                                <p>셰프이름</p>
                            </div>
                        </div>
                        <a href="" class="site-btn sb-gradient">예약하러 가기</a>
                    </div>
                </div>
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="${pageContext.request.contextPath }/resources/images/classes/cook.jpg" alt="">
                    </div>
                    <div class="ci-text">
                        <h4>클래스명2</h4>
                        <div class="ci-metas">
                            <div class="ci-meta"><i class="material-icons">event_available</i>월, 수, 금</div>
                            <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                        </div>
                        <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                    </div>
                    <div class="ci-bottom">
                        <div class="ci-author">
                            <img src="${pageContext.request.contextPath }/resources/images/classes/author/2.jpg" alt="">
                            <div class="author-text">
                                <h6>클래스명</h6>
                                <p>셰프이름</p>
                            </div>
                        </div>
                        <a href="" class="site-btn sb-gradient">예약하러 가기</a>
                    </div>
                </div>
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="${pageContext.request.contextPath }/resources/images/classes/cook.jpg" alt="">
                    </div>
                    <div class="ci-text">
                        <h4>클래스명3</h4>
                        <div class="ci-metas">
                            <div class="ci-meta"><i class="material-icons">event_available</i>월, 수, 금</div>
                            <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                        </div>
                        <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                    </div>
                    <div class="ci-bottom">
                        <div class="ci-author">
                            <img src="${pageContext.request.contextPath }/resources/images/classes/author/3.jpg" alt="">
                            <div class="author-text">
                                <h6>클래스명</h6>
                                <p>셰프이름</p>
                            </div>
                        </div>
                        <a href="" class="site-btn sb-gradient">예약하러 가기</a>
                    </div>
                </div>
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="${pageContext.request.contextPath }/resources/images/classes/cook.jpg" alt="">
                    </div>
                    <div class="ci-text">
                        <h4>클래스명4</h4>
                        <div class="ci-metas">
                            <div class="ci-meta"><i class="material-icons">event_available</i>월, 수, 금</div>
                            <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                        </div>
                        <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                    </div>
                    <div class="ci-bottom">
                        <div class="ci-author">
                            <img src="${pageContext.request.contextPath }/resources/images/classes/author/2.jpg" alt="">
                            <div class="author-text">
                                <h6>클래스명</h6>
                                <p>셰프이름</p>
                            </div>
                        </div>
                        <a href="" class="site-btn sb-gradient">예약하러 가기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 원데이 클래스 end -->
    <!-- Review Section -->
    <section class="review-section spad set-bg" data-setbg="${pageContext.request.contextPath }/resources/images/review-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 m-auto">
                    <div class="review-slider owl-carousel">
                        <div class="review-item">
                            <div class="ri-img">
                                <img src="${pageContext.request.contextPath }/resources/images/classes/author/1.jpg" alt="">
                            </div>
                            <div class="ri-text text-white">
                                <p>국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</p>
                                <h4>클래스명 - 셰프이름</h4>
                                <h6>회원명</h6>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="ri-img">
                                <img src="${pageContext.request.contextPath }/resources/images/classes/author/2.jpg" alt="">
                            </div>
                            <div class="ri-text text-white">
                                <p>국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</p>
                                <h4>클래스명 - 셰프이름</h4>
                                <h6>회원명</h6>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="ri-img">
                                <img src="${pageContext.request.contextPath }/resources/images/classes/author/3.jpg" alt="">
                            </div>
                            <div class="ri-text text-white">
                                <p>국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</p>
                                <h4>클래스명 - 셰프이름</h4>
                                <h6>회원명</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Review Section end -->



<jsp:include page="/WEB-INF/views/common/footer.jsp" />
