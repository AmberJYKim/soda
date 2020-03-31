
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>

	<link href="${pageContext.request.contextPath }/resources/css/class-manager.css" rel="stylesheet" type="text/css">
    <!-- 원데이 클래스 관리 -->
    <!-- 대부분 임채성이 만든 클래스 목록들 부분을 활용-->
    <section class="classes-details-section spad overflow-hidden">
        <!-- 컨테이너 시작 -->
        <div class="container">
            <!-- 버튼 부분 -->
            <div class="row">
                <div class="col clearfix">
                    <button type="button" class="btn btn-outline-danger float-right">클래스 삭제</button>
                    <button type="button" class="btn btn-outline-danger float-right">클래스 업로드</button>
                </div>
            </div>
            <!-- 클래스 리스트 시작 -->
            <div class="row">
                <div class="row">
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <!-- 삭제 버튼을 위한 체크박스 부분 -->
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <!-- 수정버튼 부분 -->
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--  -->
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 줄바꿈 -->
                <div class="row">
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="classes-item-warp">
                            <input type="checkbox" name="" id="">
                            <div class="classes-item item_rate">
                                <div class="ci-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/classes/cook.jpg" alt="">
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
                                        <img src="${pageContext.request.contextPath}/resources/images/classes/author/1.jpg" alt="">
                                        <div class="author-text">
                                            <h6>클래스명</h6>
                                            <p>셰프이름</p>
                                        </div>
                                    </div>
                                    <a href="" class="site-btn sb-gradient">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 페이지 바 -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="site-pagination pt-3.5">
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#"><i class="material-icons">keyboard_arrow_right</i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 페이지바 끝 -->
            </div>
            <!-- 클래스 리스트 끝 -->
        </div>
        <!-- 컨테이너 끝 -->
    </section>
    <!-- 원데이 클래스 관리 Section End -->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />