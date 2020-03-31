<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
<script>
function oneday_search(){
	
	location.href="${pageContext.request.contextPath }/oneday/search.do";
}
</script>
    <section class="page-top-section page-sp set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto text-white">
                    <h2>원데이 클래스</h2>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="event-filter-warp">
            <div class="row">
                <div class="col-xl-2">
                    <p>원데이클래스 검색</p>
                </div>
                <div class="col-xl-10">
                    <form class="event-filter-form">
                        <div class="ef-item">
                            <i class="material-icons">event_available</i>
                            <input type="text" placeholder="날짜로 검색" class="event-date">
                        </div>
                        <div class="ef-item">
                            <i class="material-icons">map</i>
                            <input type="text" placeholder="위치로 검색">
                        </div>
                        <div class="ef-item">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="">
                        </div>
                        <input class="site-btn sb-gradient" type="button" value="클래스 검색" onclick="oneday_search();">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Page top Section -->
    <!-- <section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 m-auto text-white">
					<h2>원데이 클래스</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
			</div>
		</div>
	</section> -->
    <!-- Page top Section end -->


    <!-- 원데이 클래스 Section -->
    <section class="classes-section spad">
        <div class="container">

            <div class="row">
                <div class="col-md-9">
                    <span>인기순</span>
                    <sapn>가나다순</sapn>
                </div>
                <div class="col-md-3">
                    <select class="circle-select">
                            <option data-display="한식">한식</option>
                            <option value="2">양식</option>
                            <option value="2">일식</option>
                            <option value="2">중식</option>
                            <option value="2">밀식</option>
                            <option value="2">기타식</option>
                        </select>
                </div>
            </div>
            <div class="section-title text-center">
                <h2>인기 클래스</h2>
                <p>영상에서 부족했던 부분을 오프라인에서 해결해 보세요. 인기있는 셰프님과의 만남을 가져보세요.</p>
            </div>
            <div class="classes-slider owl-carousel">
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/1.jpg" alt="">
                            <div class="author-text">
                                <h6>클래스명</h6>
                                <p>셰프이름</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath }/oneday/detail.do" class="site-btn sb-gradient">예약하러 가기</a>
                    </div>
                </div>
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/2.jpg" alt="">
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
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/3.jpg" alt="">
                            <div class="author-text">
                                <h6>클래스명</h6>
                                <p>셰프이름</p>
                            </div>
                        </div>
                        <a href="/on" class="site-btn sb-gradient">예약하러 가기</a>
                    </div>
                </div>
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/2.jpg" alt="">
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
    <section class="review-section spad set-bg" data-setbg="img/review-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 m-auto">
                    <div class="review-slider owl-carousel">
                        <div class="review-item">
                            <div class="ri-img">
                                <img src="img/classes/author/1.jpg" alt="">
                            </div>
                            <div class="ri-text text-white">
                                <p>국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</p>
                                <h4>클래스명 - 셰프이름</h4>
                                <h6>회원명</h6>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="ri-img">
                                <img src="img/classes/author/2.jpg" alt="">
                            </div>
                            <div class="ri-text text-white">
                                <p>국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</p>
                                <h4>클래스명 - 셰프이름</h4>
                                <h6>회원명</h6>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="ri-img">
                                <img src="img/classes/author/3.jpg" alt="">
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

    <!-- 원데이 클래스 Section -->
    <section class="classes-section spad">
        <div class="container">
            <div class="section-title text-center">
                <h2>신규 클래스</h2>
                <p>영상에서 부족했던 부분을 오프라인에서 해결해 보세요. 인기있는 셰프님과의 만남을 가져보세요.</p>
            </div>
            <div class="classes-slider owl-carousel">
                <div class="classes-item">
                    <div class="ci-img">
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/1.jpg" alt="">
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
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/2.jpg" alt="">
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
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/3.jpg" alt="">
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
                        <img src="img/classes/cook.jpg" alt="">
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
                            <img src="img/classes/author/2.jpg" alt="">
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
   

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
