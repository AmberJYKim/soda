<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/oneday_submenu_food.css" />
<!-- Page top Section start -->
    <section class="page-top-section page-sp set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto text-white">
                    <h2>원데이 클래스</h2>
                </div>
            </div>
        </div>
    </section>
    <!-- Page top Section end -->
    
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
                        <button class="site-btn sb-gradient">클래스 검색</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Events Section -->
    <section class="events-page-section spad">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <span>인기순</span>
                    <span>|</span>
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
            <!-- 클래스 목록들 start -->
            <div class="row">
                <div class="col-md-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="${pageContext.request.contextPath }/oneday/detail.do" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="classes-item-warp">
                        <div class="classes-item item_rate">
                            <div class="ci-img">
                                <img src="img/classes/cook.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <h4>클래스명</h4>
                                <div class="ci-metas">
                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
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
                                <a href="" class="site-btn sb-gradient">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-pagination pt-3.5">
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#"><i class="material-icons">keyboard_arrow_right</i></a>
            </div>
        </div>
    </section>
    <!-- Events Section end -->
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
